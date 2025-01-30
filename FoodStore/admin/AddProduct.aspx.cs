using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FoodStore.admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True");
        //SqlDataReader reader;
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_btn_Click(object sender, EventArgs e)
        {
            string connString = @"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True";

            // Input Validation (You can add more checks)
            if (string.IsNullOrEmpty(productTitle.Text) || string.IsNullOrEmpty(productName.Text) || string.IsNullOrEmpty(productDescription.Text) || string.IsNullOrEmpty(productCategory.Text))
            {
                Message_box.Text = "Please fill out all the fields !";
            }

            // Handle image upload validation
            else if (productImage.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(productImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                if (!allowedExtensions.Contains(fileExtension))
                {
                    Message_box.Text = "Invalid file type of image!";
                }

                // You can also add a file size check here if necessary
            }
            else { 
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    string insert = "INSERT INTO Products (Product_Title, Product_Name, Product_Discription, Product_Catagory, Product_Price, Price_Off, ImgUrl) VALUES(@Title, @Name, @Discription, @Catagory, @Price, @Price_Off, @ImgUrl)";
                    using (SqlCommand insCmd = new SqlCommand(insert, con))
                    {
                        insCmd.Parameters.AddWithValue("@Title", productTitle.Text);
                        insCmd.Parameters.AddWithValue("@Name", productName.Text);
                        insCmd.Parameters.AddWithValue("@Discription", productDescription.Text);
                        insCmd.Parameters.AddWithValue("@Catagory", productCategory.Text);
                        insCmd.Parameters.AddWithValue("@Price", productPrice.Text);
                        insCmd.Parameters.AddWithValue("@Price_Off", priceOff.Text);

                        // Save image to a specific path
                        string path = Server.MapPath("../images/");
                        string fileName = productImage.FileName;
                        string fullPath = path + fileName;
                        productImage.SaveAs(fullPath);

                        insCmd.Parameters.AddWithValue("@ImgUrl", "images/" + fileName); // Storing relative path in the database

                        insCmd.ExecuteNonQuery();
                    }
                }
                    // Optionally, show a success message or redirect
                    Message_box.Text = "Product is inserted successfully !";
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                // Handle any exceptions (log the error or show a message)
            }
            }
        }
    
    }
}