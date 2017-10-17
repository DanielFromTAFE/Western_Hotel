using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;

namespace WesternSydneyHotel.Users
{
    public partial class BookRooms : System.Web.UI.Page
    {
        double cost = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            success_alert.Visible = false;
            tb_invoice.Visible = false;
            if (!IsPostBack) {
                checkInDate.ValueToCompare = DateTime.Now.Date.ToShortDateString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            br_alert.Visible = false;
            string checkRoom = "select * from rooms where rooms.rid = @roomId and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin);";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString);
            using (conn)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(checkRoom, conn);
                cmd.Parameters.AddWithValue("@roomId", DDLRoomId.SelectedValue);
                cmd.Parameters.AddWithValue("@checkin", txtCheckIn.Text);
                cmd.Parameters.AddWithValue("@checkout", txtCheckOut.Text);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    
                    while (reader.Read())
                    {
                        cost = (Double)reader["price"];
                    }
                    if (bookRoom(cost))
                    {
                        td_cost.InnerText = cost.ToString();
                        success_alert.Visible = true;
                        tb_invoice.Visible = true;

                    }
                }
                else
                {
                    br_alert.Visible = true;
                }
            }
        }

        private double getDateDiff(string start, string end)
        {
            DateTime startDate = DateTime.ParseExact(start, "yyyy-MM-dd",
                                       CultureInfo.InvariantCulture);

            DateTime endDate = DateTime.ParseExact(end, "yyyy-MM-dd", CultureInfo.InvariantCulture);

            double days = (endDate - startDate).TotalDays;
            return days;
        }
        private Boolean bookRoom(double price)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString);
            using (conn)
            {
                conn.Open();
                cost = getDateDiff(txtCheckIn.Text, txtCheckOut.Text) * price;
                string insertRoom = "INSERT INTO bookings(rid, username, checkin, checkout, cost, btime) VALUES(@rid, @username, @checkin, @checkout, @cost, @btime);";

                SqlCommand cmd_booking = new SqlCommand(insertRoom, conn);
                cmd_booking.Parameters.AddWithValue("@rid", DDLRoomId.SelectedValue);
                cmd_booking.Parameters.AddWithValue("@username", Context.User.Identity.Name);
                cmd_booking.Parameters.AddWithValue("@checkin", txtCheckIn.Text);
                cmd_booking.Parameters.AddWithValue("@checkout", txtCheckOut.Text);
                cmd_booking.Parameters.AddWithValue("@cost", cost);
                cmd_booking.Parameters.AddWithValue("@btime", DateTime.Now);
                cmd_booking.ExecuteNonQuery();

                return true;
            }          
        }
    }
}