using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WesternSydneyHotel
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("customers"))
            {
                customers.Visible = true;
            }
            else if (HttpContext.Current.User.IsInRole("administrators"))
            {
                admin.Visible = true;
            }
            else
            {
                anonymous.Visible = true;
            }
        }
    }
}