using FoodStore.Users;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            calculateSales();
            pendingOrders();
            completeOrders();
            snacksCnt();
            BevragesCnt();
            FastFoodCnt();
            BeakeryCnt();
            VegitablesCnt();
            FruitsCnt();
        }

        private void calculateSales()
        {
            con.Open();
            string query = "SELECT order_value FROM Orders WHERE order_success = @bol";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@bol", "true");
            SqlDataReader reader = cmd.ExecuteReader();
            int init = 0;
            while (reader.Read())
            {
                int val = int.Parse(reader[0].ToString());
                init = init + val;
            }
            reader.Close();
            Sales.Text = "₹" + init;
        }

        private void pendingOrders()
        {
            string qry = "SELECT * FROM Orders WHERE order_status = 'Pending'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read()) 
            {
                count++;
            }
            pendingOrd.Text = count.ToString();
            reader.Close();
        }

        private void completeOrders()
        {
            string qry = "SELECT * FROM Orders WHERE order_status = 'Delivered'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            completedOrd.Text = count.ToString();
            reader.Close();
        }

        private void snacksCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Snacks'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            SnacksC.Text = count.ToString();
            reader.Close();
        }

        private void BevragesCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Bevrages'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            Bevrages.Text = count.ToString();
            reader.Close();
        }

        private void FastFoodCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Fast food'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            FastFood.Text = count.ToString();
            reader.Close();
        }

        private void BeakeryCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Beakery'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            Beakery.Text = count.ToString();
            reader.Close();
        }

        private void VegitablesCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Vegetables'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            Vegitables.Text = count.ToString();
            reader.Close();
        }

        private void FruitsCnt()
        {
            string qry = "SELECT * FROM Products WHERE Product_Catagory = 'Fruits'";
            SqlCommand cmd = new SqlCommand(@qry, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                count++;
            }
            Fruits.Text = count.ToString();
            reader.Close();
        }
    }
}