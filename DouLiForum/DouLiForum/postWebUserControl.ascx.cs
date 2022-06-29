using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class postWebUserControl : System.Web.UI.UserControl
    {
        public string post_user_id;
        public string visitor;
        public string post_id;
        protected DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
        


        protected void Page_Load(object sender, EventArgs e)
        {
            post_init();
        }

        protected void post_init()                                                          //初始化设置
        {
            userNickNameButton.Text = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == post_user_id).user_nickname;
            var result = db.post_Table.FirstOrDefault(s => s.post_ID.Trim() == post_id);
            contentLabel.Text = result.post_content;                                        //微博信息初始化
            timeLabel.Text = result.post_time.ToString();
            //检测是否已关注
            refresh_attention();                                                            //刷新关注信息
            refresh_comment();                                                              //刷新评论
        }

        protected void likeImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (likeImageButton.ImageUrl.ToString()== "~/Image/点赞.png")
            {
                likeImageButton.ImageUrl = "~/Image/未点赞.png";
            }
            else
            {                
                likeImageButton.ImageUrl = "~/Image/点赞.png";
            }
        }

        

        protected void attentionImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (attentionImageButton.ImageUrl.ToString() == "~/Image/未关注.png")
            {                
                db.attent_Table.InsertOnSubmit(new attent_Table
                {
                    attention_ID = random_comment_id(),
                    userID_attention_CL = visitor,
                    user_attention_to_ID = post_user_id
                });                                                 //添加关注列表
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('关注成功！');", true);
            }
            else
            {
                var result = db.attent_Table.FirstOrDefault(s => s.userID_attention_CL.Trim() == visitor &&
                    s.user_attention_to_ID.Trim() == post_user_id);
                //找到关注表第一个内容
                db.attent_Table.DeleteOnSubmit(result);          //删除关注表中此内容
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('已取消关注！');", true);
            }
            db.SubmitChanges();                                     //提交数据库更改
            refresh_attention();
        }

        protected void refresh_attention()                              //刷新关注信息
        {
            var att = db.attent_Table.FirstOrDefault(s => s.userID_attention_CL.Trim() == visitor
                && s.user_attention_to_ID.Trim() == post_user_id);
            if (att == null)
            {
                attentionImageButton.ImageUrl = "~/Image/未关注.png";
            }
            else
            {
                attentionImageButton.ImageUrl = "~/Image/关注.png";
            }
        }

        protected void commmentImageButton_Click(object sender, ImageClickEventArgs e)
        {   if (commentPanel.Visible)
            {
                commentPanel.Visible = false;
            }
            else
            {
                commentPanel.Visible = true;                            //显示评论            
                refresh_comment();                                      //刷新评论
            }

        }

        protected void refresh_comment()                                //刷新评论
        {
            commentTable.Rows.Clear();
            var result = db.comment_Table.Where(s => s.comment_post_ID.Trim() == post_id.Trim())
                .Select(s => s)
                .OrderBy(s => s.comment_time);                          //降序
            foreach (var dic in result)
            {
                TableRow row = new TableRow();                          //行对象
                row.BorderStyle = BorderStyle.Groove;

                TableCell tablecellA = new TableCell();                 //单元格对象
                TableCell tablecellB = new TableCell();
                TableCell tablecellC = new TableCell();
                TableCell tablecellD = new TableCell();

                HyperLink link = new HyperLink();                       //构造文本超链接                
                link.Text = db.user_Table.FirstOrDefault(s => s.user_ID == dic.comment_user_ID).user_nickname;
                link.NavigateUrl = "~/userHomePageWebForm.aspx?ID=" + dic.comment_user_ID;
                link.ForeColor = System.Drawing.Color.DarkBlue;
                //设置表格样式！！！
                tablecellA.Controls.Add(link);                               //连接放入单元格

                Label la = new Label();
                la.Text = dic.comment_content;
                la.Style.Value = "margin-left:30px";
                la.ForeColor = System.Drawing.Color.CadetBlue;
                tablecellB.Controls.Add(la);

                Label time = new Label();
                time.Text = dic.comment_time.ToString();
                time.Style.Value = "margin-left:30px";
                time.ForeColor = System.Drawing.Color.CornflowerBlue;
                tablecellC.Controls.Add(time);

                Button bt = new Button();                                   //构建回复的button
                bt.Text = "回复";
                bt.CommandArgument = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == dic.comment_user_ID.Trim()).user_nickname;
                //向事件传递数据
                bt.Click += new EventHandler(replyButton_Click);
                bt.Style.Value = "margin-left:30px";
                bt.BackColor = System.Drawing.Color.Lavender;
                tablecellD.Controls.Add(bt);

                row.Cells.Add(tablecellA);                                   //单元格添加到行
                row.Cells.Add(tablecellC);
                row.Cells.Add(tablecellB);
                row.Cells.Add(tablecellD);
                
                commentTable.Rows.Add(row);                                 //行添加到表
            }
        }

        protected void replyButton_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;                                  //接收传来的数据
            this.commentContentTextBox.Text += "@" + btn.CommandArgument.ToString() + "  ";
        }

        protected void userNickNameButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/userHomePageWebForm.aspx?ID=" + post_user_id);
        }

        protected void releaseButton_Click(object sender, EventArgs e)          //发布评论
        {
            db.comment_Table.InsertOnSubmit(new comment_Table
            {
                comment_ID = random_comment_id(),
                comment_post_ID = post_id,
                comment_user_ID = visitor,
                comment_content = commentContentTextBox.Text,
                comment_time = DateTime.Now
            });
            db.SubmitChanges();                                                 //提交对数据库所做的更改
            commentContentTextBox.Text = "";                                    //清空输入记录
            refresh_comment();
        }
        protected string random_comment_id()                                    //随机不重复字母混合数字的微博id
        {
            string result = System.Guid.NewGuid().ToString("N");                //Guid全球唯一标识符
            return result;
        }

        
    }
}