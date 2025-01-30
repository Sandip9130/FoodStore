using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.admin
{
    public partial class deleteProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                string proid = Request.QueryString["pid"].ToString();

                SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
                con.Open();

                string delQry = "DELETE FROM Products WHERE product_id = @prdt";
                SqlCommand cmd = new SqlCommand(delQry, con);
                
                cmd.Parameters.AddWithValue("@prdt", proid);
                int rowsaff = cmd.ExecuteNonQuery();

                if (rowsaff > 0)
                {
                    Response.Write("<script>alert('Product deleted successfully...')</script>");
                    Response.Redirect($"menuManage.aspx");
                }

            


        }


    }
}