using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.其它
{
    public partial class DoctorInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_name.Text = UserService.DoctorName;
            lbl_doctorinfo.Text = UserService.DepartmentDetial;
        }
    }
}