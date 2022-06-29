using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class changeUserPwWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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
            DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
            if (IDRequiredFieldValidator.IsValid && passwordRequiredFieldValidator.IsValid &&
                oldPWRequiredFieldValidator0.IsValid && passwordCompareValidator.IsValid &&
                passwordAgainRequiredFieldValidator.IsValid && nickNameRequiredFieldValidator.IsValid)
            {
                if (IDDropDownList.SelectedValue.Equals("用户"))
                {                    
                    var result = db.user_Table.FirstOrDefault(s => s.user_ID.Trim() == IDTextBox.Text.Trim());
                    if (result == null)
                    {
                        web_form_printf("用户ID不存在!");
                    }
                    else
                    {
                        if (result.user_password.Trim() == oldPasswordTextBox.Text.Trim())
                        {
                            result.user_password = newPasswordTextBox.Text.Trim();                   //更改密码
                            result.user_nickname = nickNameTextBox.Text.Trim();                      //昵称更改
                            db.SubmitChanges();                                                      //提交更改
                            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('提交成功！');", true);
                            //弹窗提示登录成功
                        }
                        else
                        {
                            web_form_printf("密码错误，请重新输入！");
                        }
                    }
                }
                else
                {
                    var result = db.admin_Table.FirstOrDefault(s => s.admin_ID.Trim() == IDTextBox.Text.Trim());
                    if (result == null)
                    {
                        web_form_printf("管理员ID不存在!");
                    }
                    else
                    {
                        if (result.admin_password.Trim() == oldPasswordTextBox.Text.Trim())
                        {
                            result.admin_password = newPasswordTextBox.Text.Trim();                  //更改密码
                            result.admin_nickname = nickNameTextBox.Text.Trim();                     //昵称更改
                            db.SubmitChanges();                                                      //提交更改                        
                            Thread.Sleep(1000);
                            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('提交成功！');", true);
                            //弹窗提示登录成功
                        }
                        else
                        {
                            web_form_printf("密码错误，请重新输入！");
                        }
                    }
                }
            }
            else
            {
                web_form_printf("请输入完整信息");
            }
        }


        protected void web_form_printf(string str)                                          //提示器
        {
            resultPlaceHolder.Controls.Clear();                                             //请除原控件
            Label resultlabel = new Label();                                                //提示结果
            resultlabel.Text = str;
            resultPlaceHolder.Controls.Add(resultlabel);
            resultPlaceHolder.Visible = true;
        }




    }
}