using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    
    public partial class userHomePageWebForm : System.Web.UI.Page
    {  
        protected DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            registerButton_init();                                                          //更新登录信息
            personal_init();                                                                //身份判定
        }

        protected void personal_init()                                                      //判定用户是否登录，登录刷新自身帖子，未登录不刷新
        {
            string view_id = Request.QueryString["ID"];
            
            if (view_id == null)                                                            //根据url判断是否是游客
            {
                //个人，显示粉丝数，写微博和个人帖子
                if (Session["user_ID"] != null)
                {
                    string person_id = Session["user_ID"].ToString();
                    personalHomePanel.Visible = true;                                       //显示总个人信息的控件
                    creatPanel.Visible = true;                                              //显示写帖界面
                    refresh_message(person_id);
                    refresh_microblog(person_id,person_id);
                }
                else
                {
                    quit_all_message();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('您尚未登录！');", true);
                    //弹窗提示未登录
                }
            }
            else
            {
                //游客,只显示粉丝数和帖子
                string person_id = Session["user_ID"].ToString();
                personalHomePanel.Visible = true;
                creatPanel.Visible = false;
                refresh_message(view_id);
                refresh_microblog(view_id,person_id);
            }
            
        }
        public void quit_all_message()                                                      //退出登录时消除所有信息
        {
            personalPanel.Visible = false;
            creatPanel.Visible = false;
            postPlaceHolder.Controls.Clear();                                               //消除局部刷新控件里的帖子
        }


        protected void refresh_message(string person_id)                                    //刷新ID粉丝数等信息
        {
            userNicknameLabel.Text = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == person_id).user_nickname;
            var result1 = db.attent_Table.Where(s => s.userID_attention_CL.Trim() == person_id)          //找出关注列表
                .Count();
            attentionNumButton.Text = result1.ToString();
            var result2 = db.attent_Table.Where(s => s.user_attention_to_ID.Trim() == person_id)
                .Count();
            fansNumButton.Text = result2.ToString();
            var result3 = db.post_Table.Where(s => s.post_user_ID.Trim() == person_id)
                .Count();
            microblogNumButton.Text = result3.ToString();
        }

        protected void refresh_microblog(string post_user_id,string visitor0)                                  //刷新帖子(局部刷新)
        {
            //无游客时visitor为自身
            postPlaceHolder.Controls.Clear();
            var result = db.post_Table.Where(s => s.post_user_ID.Trim() == post_user_id)
                .Select(s => s)
                .OrderByDescending(s => s.post_time);                                                 //排序
            foreach (var dic in result)
            {
                postWebUserControl pwuc = (postWebUserControl)LoadControl("postWebUserControl.ascx");
                pwuc.post_id = dic.post_ID;
                pwuc.post_user_id = post_user_id;
                pwuc.visitor = visitor0;
                //不可以用new的构建方法，因为它不是类
                postPlaceHolder.Controls.Add(pwuc);                                         //将自定义微博空间放入占位控件
            }
            //((Button)cuc.FindControl("userIDButton")).Text = "加油！！！";
        }


        protected void registerButton_init()                                                //更新登录内容
        {
            if (Session["adminName"] != null)
            {
                Button btn = (Button)((MasterPage)Master).FindControl("showIDButton");
                btn.Text = Session["adminName"].ToString();
            }
            else if (Session["userName"] != null)
            {
                Button btn = (Button)((MasterPage)Master).FindControl("showIDButton");
                btn.Text = Session["userName"].ToString();
            }
        }

        protected void releaseButton_Click(object sender, EventArgs e)                      //发布帖子
        {
            string idtable = Session["user_ID"].ToString();
            
            db.post_Table.InsertOnSubmit(new post_Table
            {   //ID随机数
                post_ID = random_post_id(),
                post_user_ID = idtable,
                post_content = postContentTextBox.Text,
                post_time = DateTime.Now
            });                                                                             //数据库添加微博
            db.SubmitChanges();                                                             //提交对数据库所做的更改
            postContentTextBox.Text = "";                                                   //清空输入记录
            refresh_microblog(idtable,idtable);                                             //刷新用户帖子和微博数
            refresh_message(idtable);
        }

        protected string random_post_id()                                                   //随机不重复字母混合数字的微博id
        {
            string result = System.Guid.NewGuid().ToString("N");                            //Guid全球唯一标识符
            return result;
        }

        protected void postRefreshTimer_Tick(object sender, EventArgs e)                    //每半分钟刷新
        {

        }
    }
}