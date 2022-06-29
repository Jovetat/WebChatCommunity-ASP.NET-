using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DouLiForum
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DouliForumDataClassesDataContext db = new DouliForumDataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var result2 = db.post_Table
                    .Select(s => s)
                    .OrderByDescending(s => s.post_time);
            Label1.Text = result2.GetType().ToString();
        }


    }
}