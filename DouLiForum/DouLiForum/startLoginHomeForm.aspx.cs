using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class startLoginHomeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            registerButton_init();
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


        protected void submitButton_Click(object sender, EventArgs e)
        {
            DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();                           //L2S对象
            var result = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == userIDTextBox.Text.Trim());          //查找账号，无结果则返回null
            if (result == null)                                                                                     //查询无此账号
            {
                userPasswordLabel.Text = "查无此账户，请重新输入！";
            }
            else
            {
                if (result.user_password.Trim() == userPasswordTextBox.Text.Trim())                                 //密码正确
                {
                    Response.Cookies["userCookie"].Value = HttpUtility.UrlEncode(result.user_nickname);
                    //cookie存入用户昵称，url转码防止中文乱码
                    Response.Cookies["userCookie"].Expires = DateTime.Now.AddDays(1);                               //cookie有效期一天

                    Session["userName"] = "用户：" + result.user_nickname;
                    Session["user_ID"] = result.user_ID.Trim();

                    Button btn = (Button)((MasterPage)Master).FindControl("showIDButton");
                    btn.Text = "用户：" + result.user_nickname;                                                     //设置登录状态

                    Response.Redirect("~/microblogWebForm.aspx");                              //重定向，url传值
                }
                else
                {
                    userPasswordLabel.Text = "密码错误，请重新输入";
                }
            }
        }

        protected void adminSubmitButton_Click(object sender, EventArgs e)
        {
            DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();                           //L2S对象
            var result = db.admin_Table.FirstOrDefault(s => s.admin_ID.Trim() == userIDTextBox.Text.Trim());
            if (result == null)                                                                                     //查询无此账号
            {
                userPasswordLabel.Text = "查无此账户，请重新输入！";
            }
            else
            {
                if (result.admin_password.Trim() == userPasswordTextBox.Text.Trim())
                {
                    Response.Cookies["userCookie"].Value = HttpUtility.UrlEncode(result.admin_nickname);
                    //cookie存入用户昵称，url转码防止中文乱码
                    Response.Cookies["userCookie"].Expires = DateTime.Now.AddDays(1);                               //cookie有效期一天
                    Session["adminName"] = "管理员：" + result.admin_nickname;
                    Session["user_ID"] =result.admin_ID.Trim();

                    Button btn = (Button)((MasterPage)Master).FindControl("showIDButton");
                    btn.Text = "管理员：" + result.admin_nickname;                                                  //设置登录状态 

                    Response.Redirect("~/adminWebForm.aspx");                            //重定向
                }
                else
                {
                    userPasswordLabel.Text = "密码错误，请重新输入";
                }
            }
        }



    }
}