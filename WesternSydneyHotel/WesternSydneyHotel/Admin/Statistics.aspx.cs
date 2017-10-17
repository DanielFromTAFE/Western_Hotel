using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace WesternSydneyHotel.Admin
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DDLType.SelectedValue);
                Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DDLType.SelectedValue);
                if (DDLDimension.SelectedValue == "3D")
                {
                    Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                    Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                }
                else
                {
                    Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                    Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                }

            }
        }
    }
}