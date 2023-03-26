using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.建档
{
    public partial class DocumentationTwo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (UserService.Gender == 1)
                {
                    lbl_Gender.Text = "男";
                }
                if (UserService.Gender == 0)
                {
                    lbl_Gender.Text = "女";
                }
                lbl_name.Text = UserService.UserName;
                lbl_Birthday.Text= UserService.Birthday.ToString("D");
                lbl_nation.Text= UserService.NationName.ToString();
                lbl_province.Text = UserService.ProvinceName.ToString();
                lbl_city.Text = UserService.CityName.ToString();
                lbl_country.Text = UserService.CountryName.ToString();
                lbl_minzu.Text = UserService.EthnicGroupName.ToString();
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("DocumentationThree.aspx");
            //Response.Write("<script language=javascript>alert('确定建档吗！！！');location.href='DocumentationThree.aspx'</" + "script>");
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("DocumentationOne.aspx");
        }
    }
}