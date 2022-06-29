using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class registerUserWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;                     //验证控件需要
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
            if (IDRequiredFieldValidator.IsValid && passwordRequiredFieldValidator.IsValid
                && passwordAgainRequiredFieldValidator.IsValid && passwordCompareValidator.IsValid
                && nickNameRequiredFieldValidator.IsValid)                                  //通过所有验证
            {
                DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
                var result = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == IDTextBox.Text.Trim());
                if (result != null)
                {
                    IDreLabel.Text = "该账号已存在";
                }
                else
                {
                    userInit();
                    Response.Redirect("~/startLoginHomeForm.aspx");
                }
            }
        }

        protected void userInit()                                                           //向数据库添加新用户
        {
            DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
            db.user_Table.InsertOnSubmit(new user_Table { user_ID = IDTextBox.Text.Trim(), 
                user_password = passwordTextBox.Text.Trim(), user_nickname = nickNameTextBox.Text.Trim()  });
            db.SubmitChanges();                                                             //提交对数据库做的修改
            Button btn = (Button)((MasterPage)Master).FindControl("showIDButton");
            btn.Text = "用户："+nickNameTextBox.Text.Trim();
        }



    }
}