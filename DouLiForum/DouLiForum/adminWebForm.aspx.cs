using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class adminWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;                     //验证控件需要
            admin_init();
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


        protected void admin_init()                                                         //管理员身份验证
        {
            if (Session["adminName"] != null)
            {
                showLabel.Text = Session["adminName"].ToString() + "，欢迎您";
                adminShowPanel.Visible = true;
            }
            else
            {
                showLabel.Text = "用户无权访问管理员页面";
            }
        }

        protected void addAdminButton_Click(object sender, EventArgs e)
        {
            if (IDRequiredFieldValidator.IsValid && passwordRequiredFieldValidator.IsValid
                && nickNameRequiredFieldValidator.IsValid)                                  //通过所有验证
            {
                DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
                var result = db.admin_Table.FirstOrDefault(s => s.admin_ID.Trim() == IDTextBox.Text.Trim());
                if (result != null)
                {
                    IDreLabel.Text = "该账号已存在";
                }
                else
                {
                    add_admin_init();
                    IDreLabel.Text = "注册成功";
                }
                adminGridView.DataBind();                                                   //数据更新
            }
        }

        protected void add_admin_init()                                                           //向数据库添加新管理员
        {
            DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
            db.admin_Table.InsertOnSubmit(new admin_Table { admin_ID = IDTextBox.Text,
                admin_password = passwordTextBox.Text, admin_nickname = nickNameTextBox.Text });
            db.SubmitChanges();                                                             //提交对数据库做的修改
        }



    }
}