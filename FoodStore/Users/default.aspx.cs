using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class _default : System.Web.UI.Page
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
                showData();
            }
            
            
        }
        private void showData()
        {
            string query = "SELECT TOP (5) Product_Id, Product_Name, Product_Title, Product_Discription, Product_Catagory, Product_Price, Price_Off, ImgUrl FROM Products ORDER BY Product_Id DESC";

            string HtmlBlock = "<div class='table-responsive' style='width: 100%; display: flex; align-items: center; justify-content: center;'><table class='table table-hover table- w-75 mx-5'><tbody>";

            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                while (reader.Read())
                {
                    HtmlBlock += "<tr>";
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (i == 0)
                        {
                            HtmlBlock += $"<td><img src='../{reader[7]}' height='250px' width='250px'></td><td class='px-5'><span class='fs-3 fw-bold'>{reader[2]}</span><br><span class='fs-4'>{reader[1]}</span><br>";
                        }
                        else if (i == 3)
                        {
                            HtmlBlock += $"<span class='fs-5'>{reader[i]}<span><br>";
                        }
                        else if (i == 4)
                        {
                            HtmlBlock += $"<span class='fs-5'>{reader[i]}<span><br>";
                        }
                        else if (i == 5)
                        {
                            HtmlBlock += $"<span class='fs-3 fw-bold'>₹{reader[i]}.00<span>";
                        }
                        else if (i == 6)
                        {
                            HtmlBlock += $"<span class='fs-5 text-muted'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp{reader[i]}%Off<span><br><a href='buyPage.aspx?pid={reader[0]}' class='btn btn-success'>BUY NOW</a></td>";
                        }

                    }
                    HtmlBlock += "</tr>";
                }
            }
            catch (Exception ex)
            {
                HtmlBlock = $"<p>Error:{ex.Message}</p>";
            }

            HtmlBlock += "</tbody></table></div>";

            TableLiteral.Text = HtmlBlock;
        }
    }
}