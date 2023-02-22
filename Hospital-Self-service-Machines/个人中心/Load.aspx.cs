using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hospital_Self_service_Machines.服务助手;

namespace Hospital_Self_service_Machines.个人中心
{
    public partial class Load : System.Web.UI.Page
    {
        UserService usersrv = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
            if (usersrv.IsSucceedLoad(txt_UserNo.Text, txt_Password.Text))
            {
                Response.Write("<script language=javascript>alert('登录成功！');</" + "script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('账号/密码错误，登录失败！');</" + "script>");
            }
        }
    }
}