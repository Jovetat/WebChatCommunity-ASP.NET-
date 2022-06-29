using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class DouliForumSite : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void adminButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/adminWebForm.aspx");                         //会保留url传值数据
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registerUserWebForm.aspx");
        }

        protected void changePWButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/changeUserPwWebForm.aspx");
        }

        protected void showIDButton_Click(object sender, EventArgs e)
        {
            if (showIDButton.Text.Trim() == "未登录，点击登录")
            {
                Response.Redirect("~/startLoginHomeForm.aspx");
            }
            else
            {
                Response.Redirect("~/userHomePageWebForm.aspx");
            }
        }

        protected void microButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/microblogWebForm.aspx");
        }

        protected void quitRegisterImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (showIDButton.Text.Trim() != "未登录，点击登录")
            {
                showIDButton.Text = "未登录，点击登录";

                HttpCookie myCookie = new HttpCookie("userCookie");                             //使cookie立刻过期
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);

                Session.Clear();                                                                //清除session权限
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('已退出登录！');", true);
                //弹窗提示退出登录成功
            }
            else
            {
                Response.Redirect("~/startLoginHomeForm.aspx");
            }
        }





    }
}