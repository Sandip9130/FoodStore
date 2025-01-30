using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class user_profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] != null)
            {

            }
            else
            {
                Response.Redirect("landingPage.aspx");
            }
            fetchUser();
            fetchProduct();
            

            updporf.Attributes["data-bs-toggle"] = "modal";
            updporf.Attributes["data-bs-target"] = "#signUpModal";
        }

        private void fetchUser()
        {
            string uid = Session["Uid"].ToString();
            con.Open();
            string qry = "SELECT u_name, u_phone, u_email, u_address FROM Users where user_id = @uidi";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@uidi", uid);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            user_name.Text = reader[0].ToString();
            email.Text = reader[2].ToString();
            contact.Text = reader[1].ToString();
            address.Text = reader[3].ToString();
            reader.Close();
        }

        private void fetchProduct()
        {
            string htmlBlock = "";
            string uid = Session["Uid"].ToString();
            string qry = "SELECT TOP(15) product_img, product_title, product_quantity, product_price, order_value, order_date, order_status, product_id FROM Orders WHERE user_id = @uid AND order_success = 'true' ORDER BY order_Id DESC";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@uid", uid);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var a = int .Parse(reader[7].ToString());
                if (a < 1)
                {
                    htmlBlock += "<h1> Product is out of stock !! </h1>";
                }

                htmlBlock += "<div class='card mb-3'>";
                htmlBlock += "<div class='row g-0 align-items-center'>";
                htmlBlock += "<div class='col-md-2 text-center'>";
                htmlBlock += $"<img src='{reader[0]}' alt='Product Image' class='img-fluid rounded'>";
                htmlBlock += "</div>";
                htmlBlock += "<div class='col-md-8'>";
                htmlBlock += "<div class='card-body'>";
                htmlBlock += $"<h5 class='card-title mx-0'>Product Title: {reader[1]}</h5>";
                htmlBlock += $"<p class='card-text'>Quantity: {reader[2]}</p>";
                htmlBlock += $"<p class='card-text'>Price: ₹{reader[3]}</p>";
                htmlBlock += $"<p class='card-text'>Total: ₹{reader[4]}</p>";
                htmlBlock += $"<p class='card-text'>Order date: {reader[5]}</p>";
                htmlBlock += $"<p class='card-text'>Status: {reader[6]}</p>";
                htmlBlock += "</div>";
                htmlBlock += "</div>";
                htmlBlock += "<div class='col-md-2 text-center'>";
                htmlBlock += $"<a href='buyPage.aspx?pid={reader[7]}' class='btn btn-success'>Repeat Order</a>";
                htmlBlock += "</div>";
                htmlBlock += "</div>";
                htmlBlock += "</div>";
            }

            historyList.Text = htmlBlock;
            reader.Close();
        }

        protected void fetchUserDt()
        {
            int userId = int.Parse(Session["Uid"].ToString());
            string fetchData = "SELECT * FROM Users WHERE user_id = @usid";
            SqlCommand fchcmd = new SqlCommand(fetchData, con);
            fchcmd.Parameters.AddWithValue("@usid", userId);
            SqlDataReader rdr = fchcmd.ExecuteReader();
            rdr.Read();

            Text_name.Text = rdr[1].ToString();
            Text_email.Text = rdr[2].ToString();
            Text_phone.Text = rdr[3].ToString();
            Text_password.Text = rdr[4].ToString();
            Text_cPass.Text = rdr[4].ToString();
            Text_address.Text = rdr[5].ToString();

            rdr.Close();
        }

        protected void btn_signUp_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Text_name.Text) || string.IsNullOrEmpty(Text_email.Text) || string.IsNullOrEmpty(Text_phone.Text) || string.IsNullOrEmpty(Text_password.Text) || string.IsNullOrEmpty(Text_cPass.Text) || string.IsNullOrEmpty(Text_address.Text))
            {
                m_box.Text = "Please fill out the all fields !!";
                m_box.CssClass = "alert alert-warning ";
            }
            else if (Text_password.Text != Text_cPass.Text)
            {
                m_box.Text = "Password and Confirmed password doesn't match !!";
                m_box.CssClass = "alert alert-warning alert-dismissible";
            }
            else
            {
                int userId = int.Parse(Session["Uid"].ToString());
                string updqry = "UPDATE Users SET u_name = @name, u_phone = @phone, u_password = @pass, u_address = @address WHERE user_id = @usid";
                SqlCommand upCmd = new SqlCommand(updqry, con);
                upCmd.Parameters.AddWithValue("@name", Text_name.Text);
                upCmd.Parameters.AddWithValue("@usid", userId);
                upCmd.Parameters.AddWithValue("@phone", Text_phone.Text);
                upCmd.Parameters.AddWithValue("@pass", Text_password.Text);
                upCmd.Parameters.AddWithValue("@address", Text_address.Text);
                var rowsAff = upCmd.ExecuteNonQuery();

                if(rowsAff > 0)
                {
                    m_box.Text = "Profile updated successfully!";
                    m_box.CssClass = "alert alert-warning alert-dismissible";
                }
               
            }
        }

        protected void updporf_Click(object sender, EventArgs e)
        {
            fetchUserDt();
        }
    }
}