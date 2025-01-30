using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Globalization;

namespace FoodStore.Users
{
    public partial class userMaster : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=E-commerse;Integrated Security=True;");
        //SqlCommand cmd;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] != null)
            {
                string usid = Session["Uid"].ToString();
                litforcart.Text = $"<a href='cartPage.aspx?uid={usid}' class='text-light me-3'><i class='fas fa-shopping-cart'></i></a>";
            }
            else
            {
                Response.Redirect("landingPage.aspx");
            }
             con.Open();
            string query = "SELECT u_name FROM Users WHERE user_id =" + Session["Uid"].ToString();
            SqlCommand cmd = new SqlCommand(query, con);
            reader = cmd.ExecuteReader();
            reader.Read();

            string uName = reader[0].ToString();
            TextInfo textInfo = CultureInfo.CurrentCulture.TextInfo;
            m_lable_user.Text = textInfo.ToTitleCase(uName.ToLower());
            con.Close();     
        }

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("landingPage.aspx");
        }
    }
}