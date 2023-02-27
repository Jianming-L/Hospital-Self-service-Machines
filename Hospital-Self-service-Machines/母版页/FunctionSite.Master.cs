using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.母版页
{
    public partial class FunctionSite : System.Web.UI.MasterPage
    {
        private string[] weekday = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_NowTime.Text = DateTime.Now.ToString();
            int weekdaycount = (int)DateTime.Now.DayOfWeek;
            lbl_Weekly.Text = weekday[weekdaycount];
            if (Session["UserNo"] != null)
            {
                lbl_load.Text = null;
            }
            else
            {
                lbl_myinfo.Text = null;
                lbl_my.Text = null;
            }
        }
    }
}