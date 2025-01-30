using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodStore.Users
{
    public partial class placeOrder : System.Web.UI.Page
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
                fetchCart();
                fetchUser();
            }

        }

        SqlConnection conn = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");

        private void fetchCart()
        {
            int userId = int.Parse(Session["Uid"].ToString());

            string htmlBlock = "";

            SqlDataReader reader;
            conn.Open();

            string qry = "SELECT * FROM Orders WHERE user_id = @uid AND order_success = 'false'";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@uid", userId);
            reader = cmd.ExecuteReader();

            int grandTotal = 0;
            while (reader.Read())
            {
                int tot = int.Parse(reader[6].ToString()) * int.Parse(reader[7].ToString());
                htmlBlock += $"<tr><td><img src='{reader[4]}' height='100px' width='100px' class='mt-1 rounded'></td><td><div class='d-flex flex-column'>";
                htmlBlock += $"<h3>{reader[3]}</h3><h5>{reader[5]}</h5><div class='d-flex flex-row'><h6>₹{reader[6]}.00</h6><h6 style='margin-left: 40px;'>qty: {reader[7]}</h6></div>";
                htmlBlock += $"</div></td><td class='py-5 px-5' ><h5>₹{tot}.00</h5></td></tr>";

                grandTotal = grandTotal + tot;
            }
            int totalPayable = grandTotal + 60;

            grandTot.Text = grandTotal.ToString();
            totalPay.Text = totalPayable.ToString();
            placeOrderHtml.Text = htmlBlock;
            DateTime now = DateTime.Now;
            DateTime futureDate = now.AddDays(3);
            deliveryTime.Text = futureDate.ToString("dddd, dd MMMM yyyy");

            reader.Close();
        }

        private void fetchUser()
        {
            int uid = int.Parse(Session["Uid"].ToString());
            string ufQry = "SELECT u_name, u_phone, u_address FROM Users WHERE user_id = @usid";
            SqlCommand cmd2 = new SqlCommand(ufQry, conn);
            cmd2.Parameters.AddWithValue ("@usid", uid);
            SqlDataReader reader = cmd2.ExecuteReader();

            reader.Read();

            name.Text = reader[0].ToString();
            phone.Text = reader[1].ToString();
            DelAddr.Text = reader[2].ToString();

            reader.Close();
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(selecteMethod.SelectedValue == "UPI")
            {
                text_upi.Visible = true;
                upi_pay_btn.Visible = true;
                upi_validate.Visible = true;
            }
            else
            {
                text_upi.Visible = false;
                upi_pay_btn.Visible = false;
                upi_validate.Visible = false;
            }
            if (selecteMethod.SelectedValue == "Credit Card" || selecteMethod.SelectedValue == "Debit Card")
            {
                card_no.Visible = true;
                cardNoValidate.Visible = true;
                cvv_txt.Visible = true;
                cvvValidate.Visible = true;
                exp_txt.Visible = true;
                expValidate.Visible = true;
                card_pay_btn.Visible = true;
            }
            else 
            {
                card_no.Visible = false;
                cardNoValidate.Visible = false;
                cvv_txt.Visible = false;
                cvvValidate.Visible = false;
                exp_txt.Visible = false;
                expValidate.Visible = false;
                card_pay_btn.Visible = false;
            }
        }

        private void OnPlaceOrderTbl()
        {
            string updtOrd = "UPDATE Orders SET customer_name = @nme, customer_contact = @ctn, customer_address = @adrs, order_date = @dt, order_success = 'true' WHERE user_id = @udie";
            SqlCommand cmd = new SqlCommand(updtOrd, conn);
            cmd.Parameters.AddWithValue("@nme", name.Text);
            cmd.Parameters.AddWithValue("@ctn", phone.Text);
            cmd.Parameters.AddWithValue("@adrs", DelAddr.Text);
           
            DateTime now = DateTime.Now;
            //DateTime futureDate = now.AddDays(3);
            string ordDt = now.ToString("dddd, dd MMMM yyyy");

            int userId = int.Parse(Session["Uid"].ToString());

            cmd.Parameters.AddWithValue("@dt", ordDt);
            cmd.Parameters.AddWithValue("@udie", userId);
            conn.Open();
            cmd.ExecuteNonQuery();

        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            OnPlaceOrderTbl();
            Response.Redirect("successfull_order.aspx");
        }
    }
}