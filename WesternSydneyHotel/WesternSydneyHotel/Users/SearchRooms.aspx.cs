using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace WesternSydneyHotel.Users
{
    public partial class SearchRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                checkInDate.ValueToCompare = DateTime.Now.Date.ToShortDateString();               
             }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            sr_alert.Visible = false;

            string searchRooms = "";
            if (DDLOri.SelectedIndex != 0)
            {
                 searchRooms = "select * from rooms where beds = @num_bed and orientation = @ori and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.beds = @num_bed and rooms.orientation = @ori and rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin);";
            }
            else
            {
                 searchRooms = "select * from rooms where beds = @num_bed and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.beds = @num_bed and rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin);";
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString);
            using (conn)
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(searchRooms, conn);
                comm.Parameters.AddWithValue("@num_bed", DDLBeds.SelectedValue);
                comm.Parameters.AddWithValue("@ori", DDLOri.SelectedValue);
                comm.Parameters.AddWithValue("@checkin", txtCheckIn.Text);
                comm.Parameters.AddWithValue("@checkout", txtCheckOut.Text);

                SqlDataReader rd = comm.ExecuteReader();
                if (!rd.HasRows)
                {
                    sr_alert.Visible = true;
                }
                GridView1.DataSource = rd;
                GridView1.DataBind();
            }
        }
        
    }
}