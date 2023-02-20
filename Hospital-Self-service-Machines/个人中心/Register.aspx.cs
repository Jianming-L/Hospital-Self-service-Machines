using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace Hospital_Self_service_Machines.个人中心
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btn_SignUp_Click(object sender, EventArgs e)
        {

            //SqlConnection con = new SqlConnection();
            //con.ConnectionString = ConfigurationManager.ConnectionStrings["sql"].ConnectionString;
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;
            //cmd.CommandText = 
            //    $"SELECT 1 FROM tb_User WHERE UserNo='{txt_UserNo.Text}' AND Password=HASHBYTES('MD2','{this.txt_ConfirmPassword.Text.Trim()}');";
            //con.Open();
            //int rowAffect = (int)cmd.ExecuteScalar();
            //if (rowAffect == 1)
            //{
            //    lbl_msg.Text = "测试成功";
            //}
            //else
            //{
            //    lbl_msg.Text = "测试失败";
            //}
        }
    }
}