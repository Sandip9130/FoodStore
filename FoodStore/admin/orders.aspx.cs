using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.admin
{
    public partial class orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            fetchOrders();
        }

        private void fetchOrders()
        {
            con.Open();
            string qry = "SELECT * FROM Orders WHERE order_success = 'true' ORDER BY order_Id DESC";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string htmlBlock = "";
            while (reader.Read())
            {
                htmlBlock += "<tr>";
                htmlBlock += $"<td>{reader[0]}</td>";
                htmlBlock += $"<td><img src='{reader[4]}' alt='Product Image' height='100px' width='100px' class='img-fluid rounded'></td>";
                htmlBlock += $"<td>{reader[5]}</td>";
                htmlBlock += $"<td>₹{reader[6]}</td>";
                htmlBlock += $"<td>{reader[7]}</td>";
                htmlBlock += $"<td>₹{reader[13]}</td>";
                htmlBlock += $"<td>{reader[8]}</td>";
                htmlBlock += $"<td>{reader[10]}</td>";
                htmlBlock += $"<td>{reader[9]}</td>";
                htmlBlock += $"<td>{reader[11]}</td>";
                htmlBlock += $"<td class='text-center'>";
                htmlBlock += "<div class='dropdown'>";
                htmlBlock += $"<button class='btn btn-warning'>Manage Order Status</button><div class='dropdown-content'>";
                htmlBlock += $"<a href='stetusPend.aspx?oid={reader[0]}&stid=1'>Pending</a>";
                htmlBlock += $"<a href='stetusPend.aspx?oid={reader[0]}&stid=2'>Dispatched</a>";
                htmlBlock += $"<a href='stetusPend.aspx?oid={reader[0]}&stid=3'>Delivered</a>";
                htmlBlock += "</div></div>";
                htmlBlock += "</td>";
                htmlBlock += $"<td>{reader[12]}</td>";
                htmlBlock += "</tr>";
            }
            ordrTblDt.Text = htmlBlock;
        }
    }
}