using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using static System.Net.Mime.MediaTypeNames;
using System.Security.Cryptography.X509Certificates;

namespace FoodStore.Users
{
    public partial class landingPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        SqlDataReader rdr;
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Function to generate a random 4-digit OTP
        public string GenerateOTP()
        {
            Random random = new Random();
            return random.Next(1000, 10000).ToString(); // Generates a 4-digit OTP
        }

        // Function to send a verification OTP email
        public void SendVerificationEmail()
        {
            // SMTP configuration
            string smtpHost = "smtp.gmail.com";
            int smtpPort = 587;
            string senderEmail = "emartshopforyou@gmail.com"; // Your email
            string senderPassword = "tuqgriwxqekhkywv"; // Your email password or app-specific password
           
            try
            {
                // Generate OTP
                string rotp = GenerateOTP();
                Session["recivedOTP"] = rotp;

                // Create email content
                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress(senderEmail),
                    Subject = "Your Email Verification OTP",
                    Body = $"Your OTP for email verification is: {rotp}\n\nPlease use this code to complete your registration.",
                    IsBodyHtml = false // Set to true if you want to use HTML
                };
               var userEmail = Text_email.Text;
                mailMessage.To.Add(userEmail);

                // Configure SMTP client
                SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort)
                {
                    Credentials = new NetworkCredential(senderEmail, senderPassword),
                    EnableSsl = true // Ensure secure connection
                };


                // Send the email
                smtpClient.Send(mailMessage);
                otp_sent_mag.Text = "Verification email sent successfully on "+Text_email.Text;
            }
            catch (Exception ex)
            {
                otp_sent_mag.Text = "Error sending email: " + ex.Message;
            }
        }



    protected void btn_sendOTP_Click(object sender, EventArgs e)
        {
            
            SendVerificationEmail();
            
        }



    protected void btn_signUp_Click(object sender, EventArgs e)
        {
            string recivedOTP = Session["recivedOTP"].ToString();
            con.Open();
            string fetchData = "SELECT u_email FROM Users WHERE u_email = @eml";
            SqlCommand fchcmd = new SqlCommand(fetchData, con);
            fchcmd.Parameters.AddWithValue("@eml", Text_email.Text);
            rdr = fchcmd.ExecuteReader();
            if (string.IsNullOrEmpty(Text_name.Text) || string.IsNullOrEmpty(Text_email.Text) || string.IsNullOrEmpty(otp.Text) || string.IsNullOrEmpty(Text_phone.Text) || string.IsNullOrEmpty(Text_password.Text) || string.IsNullOrEmpty(Text_cPass.Text) || string.IsNullOrEmpty(Text_address.Text))
            {
                m_box.Text = "Please fill out the all fields !!";
                m_box.CssClass = "alert alert-warning ";
            }
            else if (Text_password.Text != Text_cPass.Text)
            {
                m_box.Text = "Password and Confirmed password doesn't match !!";
                m_box.CssClass = "alert alert-warning alert-dismissible";
            }
            else if (otp.Text != recivedOTP)
            {
                m_box.Text = "Please enter valid OTP !!";
                m_box.CssClass = "alert alert-warning alert-dismissible";
            }
            else if(rdr.HasRows)
            {
                m_box.Text = Text_email.Text + " is already exist..!";
                m_box.CssClass = "alert alert-warning alert-dismissible alert-responsive";
            }
            else
            {
                rdr.Close();

                string insertData = "INSERT INTO Users (u_name, u_email, u_phone, u_password, u_address) VALUES (@name, @email, @phone, @pass, @address)";
                SqlCommand insCmd = new SqlCommand(insertData, con);
                insCmd.Parameters.AddWithValue("@name", Text_name.Text);
                insCmd.Parameters.AddWithValue("@email", Text_email.Text);
                insCmd.Parameters.AddWithValue("@phone", Text_phone.Text);
                insCmd.Parameters.AddWithValue("@pass", Text_password.Text);
                insCmd.Parameters.AddWithValue("@address", Text_address.Text);

                insCmd.ExecuteNonQuery();

                con.Close();

                m_box.Text = "You have registered successfully !!";
                m_box.CssClass = "alert alert-success alert-dismissible";
            }
        }

        protected void btn_logIn_Click(object sender, EventArgs e)
        {
            con.Open();
            string queryString = "SELECT * FROM Users WHERE u_email = @uEmail";
            SqlCommand acmd = new SqlCommand(queryString, con);
            acmd.Parameters.AddWithValue("@uEmail", log_email.Text);
            rdr = acmd.ExecuteReader();

            if (rdr.HasRows)
            {
                rdr.Read();
                if (rdr["u_email"].ToString() == log_email.Text && rdr["u_password"].ToString() == log_pass.Text)
                {
                    Session["Uid"] = rdr["user_id"].ToString();
                    Response.Redirect("default.aspx");
                }
                else 
                {
                    logIn_ms_box.Text = "Incorect password..!";
                    logIn_ms_box.CssClass = "alert alert-warning alert-dismissible";
                }
            }
            else 
            {
                logIn_ms_box.Text = "Please insert valid email..!";
                logIn_ms_box.CssClass = "alert alert-warning alert-dismissible";
            }
        }

    }
}