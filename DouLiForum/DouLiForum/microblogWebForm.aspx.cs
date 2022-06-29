using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class microblogWebForm : System.Web.UI.Page
    {
        protected DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            registerButton_init();
            if (Session["user_ID"] != null)
            {
                
                refresh_microblog();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('您尚未登录！');", true);
                //弹窗提示未登录
            }            
        }

        protected void refresh_microblog()                                                  //刷新全部帖子(局部刷新)
        {
            postPlaceHolder.Controls.Clear();
            string visitor0 = Session["user_ID"].ToString();
            
            var result = db.post_Table.Select(s => s)
                .OrderByDescending(s => s.post_time);                                                 //排序
            foreach (var dic in result)
            {
                postWebUserControl pwuc = (postWebUserControl)LoadControl("postWebUserControl.ascx");
                pwuc.post_id = dic.post_ID;
                pwuc.post_user_id = dic.post_user_ID;
                pwuc.visitor = visitor0;
                //不可以用new的构建方法，因为它不是类
                postPlaceHolder.Controls.Add(pwuc);                                         //将自定义微博空间放入占位控件
            }
            entireLabel.ForeColor = System.Drawing.Color.PaleVioletRed;
            myattentionLabel.ForeColor = System.Drawing.Color.DarkSlateGray;
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

        protected void searchImageButton_Click(object sender, ImageClickEventArgs e)        //搜索
        {
            postPlaceHolder.Controls.Clear();
            string visitor0 = Session["user_ID"].ToString();

            var result = db.post_Table.Where(s => s.post_content.Contains(searchTextBox.Text.Trim()))
                .Select(s => s)
                .OrderByDescending(s => s.post_time);
            foreach (var dic in result)
            {
                postWebUserControl pwuc = (postWebUserControl)LoadControl("postWebUserControl.ascx");
                pwuc.post_id = dic.post_ID;
                pwuc.post_user_id = dic.post_user_ID;
                pwuc.visitor = visitor0;
                //不可以用new的构建方法，因为它不是类
                postPlaceHolder.Controls.Add(pwuc);                                         //将自定义微博空间放入占位控件
            }
            entireLabel.ForeColor = System.Drawing.Color.DarkSlateGray;
            myattentionLabel.ForeColor = System.Drawing.Color.DarkSlateGray;
        }

        protected void myAttentionImageButton_Click(object sender, ImageClickEventArgs e)           //显示我的关注的人的帖子
        {
            postPlaceHolder.Controls.Clear();
            string visitor0 = Session["user_ID"].ToString();

            var result1 = db.attent_Table.Where(s => s.userID_attention_CL.Trim() == visitor0)
                .Select(s => s);
            foreach (var dic in result1)
            {
                var result2 = db.post_Table.Where(s => s.post_user_ID.Trim() == dic.user_attention_to_ID.Trim())
                    .Select(s => s)
                    .OrderByDescending(s => s.post_time);
                foreach (var dic2 in result2)
                {
                    postWebUserControl pwuc = (postWebUserControl)LoadControl("postWebUserControl.ascx");
                    pwuc.post_id = dic2.post_ID;
                    pwuc.post_user_id = dic2.post_user_ID;
                    pwuc.visitor = visitor0;
                    //不可以用new的构建方法，因为它不是类
                    postPlaceHolder.Controls.Add(pwuc);                                         //将自定义微博空间放入占位控件
                }
            }
            entireLabel.ForeColor = System.Drawing.Color.DarkSlateGray;
            myattentionLabel.ForeColor = System.Drawing.Color.PaleVioletRed;
        }

        protected void entireImageButton_Click(object sender, ImageClickEventArgs e)                //显示全部
        {
            refresh_microblog();
        }
    }
}