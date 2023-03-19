using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hospital_Self_service_Machines.服务助手;

namespace Hospital_Self_service_Machines.建档
{
    public partial class DocumentationOne : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lbl_name.Text = UserService.UserName;
            lbl_name.Text = "";
            if (d412.Text != "")
            {
                lbl_age.Text=GetAgeByBirthdate(d412.Text).ToString();
            }
        }
        public void Bind()
        {
            //lbl_age.Text = (DateTime.Now - DateTime.Parse(d412.Text)).ToString();

        }
        public int GetAgeByBirthdate(string birthdate)
        {
            DateTime now = DateTime.Now;
            DateTime dt = DateTime.Parse(birthdate);
            int age = now.Year - dt.Year;
            if (now.Month < dt.Month || (now.Month == dt.Month && now.Day < dt.Day))
            {
                age--;
            }
            return age < 0 ? 0 : age;
        }
    }
}