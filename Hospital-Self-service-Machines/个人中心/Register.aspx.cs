using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using Hospital_Self_service_Machines.服务助手;

namespace Hospital_Self_service_Machines.个人中心
{
    public partial class Register : System.Web.UI.Page
    {
        UserService usersrv=new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
            if (usersrv.IsHasUserRecord(txt_UserNo.Text))
            {
                Response.Write("<script language=javascript>alert('已注册过该账号，请勿重复操作！');</" + "script>");
                txt_UserNo.Text = null;
                txt_UserName.Text = null;
                txt_Password.Text = null;
                txt_ConfirmPassword.Text = null;
            }
            else
            {
                if (usersrv.IsSignUp(txt_UserNo.Text, txt_UserName.Text, txt_ConfirmPassword.Text))
                {
                    Response.Write("<script language=javascript>alert('注册成功！');</" + "script>");
                    txt_UserNo.Text = null;
                    txt_UserName.Text = null;
                    txt_Password.Text = null;
                    txt_ConfirmPassword.Text = null;
                }
                else
                {
                    Response.Write("<script language=javascript>alert('注册失败！');</" + "script>");
                    txt_UserNo.Text = null;
                    txt_UserName.Text = null;
                    txt_Password.Text = null;
                    txt_ConfirmPassword.Text = null;
                }
            }
        }
    }
}