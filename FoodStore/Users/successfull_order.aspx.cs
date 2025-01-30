using System;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace FoodStore.Users
{
    public partial class successfull_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Response.Redirect("landingPage.aspx");
            }
        }

        
    }
}
