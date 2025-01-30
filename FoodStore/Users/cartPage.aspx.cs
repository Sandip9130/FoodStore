using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class cartPage : System.Web.UI.Page
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
                showCartContent();
            }
        }
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        
        private void showCartContent()
        {
            string userId = Request.QueryString["uid"];

            
            string qry = "SELECT * FROM Orders WHERE user_id = @uid AND order_success = 'false'";
            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@uid", userId);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows == true) 
            {
                string htmlBlock = "<table class='table table-bordered table-responsive text-center'><thead><tr><th>Product</th><th>Price</th><th>Quantity</th><th>Total</th><th>Action</th> </tr></thead><tbody>";
            try
            {
                int grandTotal = 0;
                while (reader.Read())
                {
                    int tot = int.Parse(reader[6].ToString()) * int.Parse(reader[7].ToString());
                    htmlBlock += $"<tr class='text-center'><td><img src='{reader[4]}' height='100' width='100' /><br><span>{reader[5]}</span></td>";
                    htmlBlock += $"<td><br><br>₹{reader[6]}.00</td><td><br><br>{reader[7]}</td><td><br><br>₹{tot}.00</td>";
                    htmlBlock += $"<td><br><br><a href='delete.aspx?prid={reader[2]}' class='btn btn-danger'>Remove</a></td></tr>";
                    grandTotal = grandTotal + tot;
                }
                htmlBlock += $"</tbody></table></div><div class='mx-5'><h2>Total: ₹{grandTotal}.00</h2><a href='placeOrder.aspx?gt={grandTotal}' class='btn btn-primary'>Checkout</a></div></div>";

                cartTable.Text = htmlBlock;
            }
            catch (Exception ex) 
            {
                Response.Write(ex.Message);
            }
            }
            else
            {
                string html2 = "<h1 class='text-center'>is empty</h1><div class='text-center' style='margin: 5vh 0;'><img src='../designFiles/images/emptyCart.png' height='300px' width='500px'></div>";
                cartTable.Text += html2;
                
            }

            con.Close();
        }
    }
}