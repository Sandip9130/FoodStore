using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class searchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] != null)
            {

            }
            else
            {
                //Response.Redirect("landingPage.aspx");
            }
            if (!IsPostBack)
            {
                showData();
            }

        }

        private void showData()
        {
            string query = "SELECT Product_Id, Product_Name, Product_Title, Product_Discription, Product_Catagory, Product_Price, Price_Off, ImgUrl FROM Products"; /**/

            string HtmlBlock = "<div class='container overflow-hidden py-5'><div class='row gy-5'>";

            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (i == 0)
                        {
                            HtmlBlock += "<div class='searchByName col-4 d-flex justify-content-center'><div class='card shadow' style='width: 18rem;'>";
                            HtmlBlock += $"<img src='../{reader[7]}' height='200vh' width='20%' class='card-img-top' class='object-fit-cover' alt='...'>";
                            HtmlBlock += $"<div class='card-body'><h5 class='card-title'>{reader[2]}</h5><h6 class='card-title'>{reader[1]}</h6>";
                            HtmlBlock += $"<p class='card-text mb-1'>{reader[3]}</p>";
                            HtmlBlock += $"<div class='w-100 bg-dark position-relative'><div class='card-title fw-bold position-absolute start-0'>₹{reader[5]}.00</div><div class='card-title position-absolute end-50'>{reader[6]}%Off</div></div>";
                            HtmlBlock += $"<a href='buyPage.aspx?pid={reader[0]}' class='btn btn-primary mt-5 form-control'>Buy Now</a></div></div></div>";
                        }

                    }

                }
            }
            catch (Exception ex)
            {
                HtmlBlock = $"<p>Error:{ex.Message}</p>";
            }

            HtmlBlock += "</div></div>";
            HtmlBlock += " <script>        const searchProduct = () => {            let filter = document.getElementById('searchName').value.toUpperCase();            let cards = orderTableBody.getElementsByClassName('searchByName');            for (var i = 0; i < cards.length; i++) {                let pName = cards[i].getElementsByTagName('h6')[0];                if (pName) {                    let textvalue = pName.textContent || pName.innerHTML;                   if (textvalue.toUpperCase().indexOf(filter) > -1) {                        cards[i].style.display = '';                   }                    else {                        cards[i].style.display = 'none'                 }                }          }        } </script>";

            productSearch.Text = HtmlBlock;
        }
    }
}