using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class stetusPend : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            string std = Request.QueryString["stid"].ToString();
            if (std == "1")
            {
                updateStatus();
            }
            else if (std == "2") 
            {
                updateStatus2();
            }
            else
            {
                updateStatus3();
            }
            Response.Redirect("orders.aspx");
        }

        private void updateStatus()
        {
            con.Open();
            string ordId = Request.QueryString["oid"].ToString();
            string qry = "UPDATE Orders SET order_status = 'Pending' WHERE order_Id = @ordid";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@ordid", ordId);
            cmd.ExecuteNonQuery();
        }

        private void updateStatus2()
        {
            con.Open();
            string ordId = Request.QueryString["oid"].ToString();
            string qry = "UPDATE Orders SET order_status = 'Dispatched' WHERE order_Id = @ordid";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@ordid", ordId);
            cmd.ExecuteNonQuery();
        }

        private void updateStatus3()
        {
            con.Open();
            string ordId = Request.QueryString["oid"].ToString();
            string qry = "UPDATE Orders SET order_status = 'Delivered' WHERE order_Id = @ordid";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@ordid", ordId);
            cmd.ExecuteNonQuery();
        }
    }
}