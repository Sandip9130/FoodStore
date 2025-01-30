using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace FoodStore.Users
{
    public partial class buyPage : System.Web.UI.Page
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
            string productId = Request.QueryString["pid"].ToString();
            if (string.IsNullOrEmpty(productId))
            {
                // Handle missing productId gracefully
                Response.Redirect("ErrorPage.aspx");
                return;
            }

            string userId = Session["Uid"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;"))
                {
                    con.Open();

                    // Fetch Product Data
                    string productQuery = "SELECT * FROM Products WHERE Product_Id = @ProductId";
                    using (SqlCommand cmd = new SqlCommand(productQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@ProductId", productId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            if (reader[2].ToString() == null)
                            {
                                Literal1.Text = "<script> alert('Product is out of stock!!'); </script>";
                                
                            }
                            else
                            {
                                Literal1.Text = "<div class='co'>";
                                imag.ImageUrl = "../" + reader[7].ToString();
                                pTitle.Text = reader[2].ToString();
                                pName.Text = reader[1].ToString();
                                discription.Text = reader[3].ToString();
                                price.Text = reader[5].ToString();
                                priceoff.Text = reader[6].ToString() + "%Off";
                            }
                        }
                    }

                    //Fetch User Data
                    string userQuery = "SELECT * FROM Users WHERE User_Id = @UserId";
                    using (SqlCommand cmd = new SqlCommand(userQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                quantity.Text = "1"; // Default quantity
                                contact.Text = reader[3].ToString();
                                addr.Text = reader[5].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error (e.g., to a file, database, or monitoring system)
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                Response.Redirect("user_profile.aspx");
            }
        }

        private void addToCart()
        {
            string productId = Request.QueryString["pid"].ToString();
            if (string.IsNullOrEmpty(productId))
            {
                // Handle missing productId gracefully
                Response.Redirect("ErrorPage.aspx");
                return;
            }

            string userId = Session["Uid"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;"))
                {
                    con.Open();

                    // Fetch Product Data
                    string productQuery = "INSERT INTO Orders (user_id, product_id, product_title, product_img, product_name, product_price, product_quantity, customer_name, customer_contact, customer_address, order_status, order_date, order_value, order_success) VALUES (@user_id, @product_id, @product_title, @product_img, @product_name, @product_price, @product_quantity, @customer_name, @customer_contact, @customer_address, @order_status, @order_date, @order_value, @order_success)";
                    using (SqlCommand cmd = new SqlCommand(productQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@product_id", productId);
                        cmd.Parameters.AddWithValue("@product_title", pTitle.Text);
                        cmd.Parameters.AddWithValue("@product_img", imag.ImageUrl);
                        cmd.Parameters.AddWithValue("@product_name", pName.Text);
                        cmd.Parameters.AddWithValue("@product_price", price.Text);
                        cmd.Parameters.AddWithValue("@product_quantity", quantity.Text);
                        cmd.Parameters.AddWithValue("@customer_name", "n");
                        cmd.Parameters.AddWithValue("@customer_contact", contact.Text);
                        cmd.Parameters.AddWithValue("@customer_address", addr.Text);
                        cmd.Parameters.AddWithValue("@order_status", "Pending");
                        cmd.Parameters.AddWithValue("@order_date", "n");

                        int tot = int.Parse(price.Text.ToString()) * int.Parse(quantity.Text.ToString());
                        cmd.Parameters.AddWithValue("@order_value", tot);
                        cmd.Parameters.AddWithValue("@order_success", "false");

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if(rowsAffected != 0)
                        {
                            mesgBox.Text = "Product added to cart successfully !";
                            mesgBox.CssClass = "alert alert-warning alert-dismissible alert-responsive";
                        }
                        
                        
                    }

                }
            }
            catch (Exception ex)
            {
                // Log the error (e.g., to a file, database, or monitoring system)
                Response.Write(ex);
            }

        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            addToCart();
        }
    }
}
