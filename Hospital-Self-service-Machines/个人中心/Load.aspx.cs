using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hospital_Self_service_Machines.服务助手;

namespace Hospital_Self_service_Machines.个人中心
{
    public partial class Load1 : System.Web.UI.Page
    {
        UserService usersrv = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
            if (usersrv.IsSucceedLoad(txb_UserNo.Text, txb_Password.Text))
            {
                Session["UserNo"] = txb_UserNo.Text;
                UserService.UserNo = txb_UserNo.Text;
                Response.Write("<script language=javascript>alert('登录成功！');location.href='../PageOne.aspx'</" + "script>");
            }
            else
            {
                if (UserService.IsActivated == 0)
                {
                    UserService.LogInFailCount++;
                    if (UserService.LogInFailCount >= 3)
                    {
                        Response.Write($"<script language=javascript>alert('{usersrv.LogInFailMax(txb_UserNo.Text.Trim(), txb_Password.Text.Trim())}');</" + "script>");
                    }
                    else
                    {
                        Response.Write($"<script language=javascript>alert('{usersrv.LogInFail()}');</" + "script>");
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('您的账号已被冻结\\n请联系前台进行解封！');</" + "script>");
                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }

        protected void txb_UserNo_TextChanged(object sender, EventArgs e)
        {
            lbl_IsHasUser.Text = null;
            lbl_IsHasUser.Text = Server.HtmlEncode(txb_UserNo.Text);
            if (txb_UserNo.Text.Length >= 4 && txb_UserNo.Text.Length <= 10)
            {
                if (usersrv.IsHasUser(txb_UserNo.Text.Trim()) && txb_UserNo.Text.Trim() != "")
                {
                    lbl_IsHasUser.Text = null;
                    UserService.UserNo = null;
                    UserService.UserNo = txb_UserNo.Text;
                }
                else
                {
                    lbl_IsHasUser.Text = "不存在该用户，请重新输入！";
                }
            }
            else
            {
                lbl_IsHasUser.Text = "账号长度应在4~10之间！";
            }
        }
    }
}