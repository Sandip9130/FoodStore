using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.admin
{
    public partial class menuManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fetchProducts();
        }
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");

        private void fetchProducts()
        {
            con.Open();
            string qry = "SELECT * FROM Products";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader rdr = cmd.ExecuteReader();
            string htmlBolck = "";
            while (rdr.Read())
            {
                htmlBolck += $"<tr><td><img src='../{rdr[7]}' alt='Product Image' height='100px' width='100px' class='img-fluid rounded'></td><td>{rdr[1]}</td><td>{rdr[2]}</td>" +
                    $" <td>{rdr[3]}</td><td>{rdr[4]}</td> <td>₹{rdr[5]}</td><td>{rdr[6]}% Off</td>" +
                    $" <td> <a href='UpdateProduct.aspx?pid={rdr[0]}' class='btn btn-warning'>Update</a>" +
                    $"<a href='deleteProduct.aspx?pid={rdr[0]}' Class='btn btn-danger' OnClick='confirm('Are you sure you want to delete this item ?');'>Delete</a>" +
                    $"</td></tr>";
            }
            tblBody.Text = htmlBolck;
            rdr.Close();
        }
    }
}