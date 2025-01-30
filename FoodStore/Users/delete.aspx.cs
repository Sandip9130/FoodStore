using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] != null)
            {

            }
            else
            {
                Response.Redirect("landingPage.aspx");
            }
            if (!IsPostBack)
            {
                string user = Session["Uid"].ToString();
                string product = Request.QueryString["prid"].ToString();

                SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
                con.Open();

                string delQry = "DELETE FROM Orders WHERE user_id = @user AND product_id = @prdt AND order_success = 'false'";
                SqlCommand cmd = new SqlCommand(delQry, con);
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@prdt", product);
                int rowsaff = cmd.ExecuteNonQuery();

                if (rowsaff > 0) 
                { 
                    Response.Write("<script>alert('Product removed from cart successfully...')</script>");
                    Response.Redirect($"cartPage.aspx?uid={user}");
                }

            }

        }
    }
}