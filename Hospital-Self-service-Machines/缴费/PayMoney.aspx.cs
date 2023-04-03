using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.缴费
{
    public partial class PayMoney : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        UserService usersrv = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            Bind();
            if(usersrv.IsHasPayment(UserService.UserNo) == true)
            {
                btn_Pay.Visible = false;
                lbl_null.Text = "暂无缴费内容";
            }
        }
        public void Bind()
        {
            string commandText =
                $@"SELECT PR.PayItemName,PR.Price
                    FROM tb_Payment AS P
                    LEFT JOIN tb_Price AS PR ON P.PayItemNo=PR.PayItemNo
                    WHERE P.UserNo='{UserService.UserNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            con.Open();
            DataTable dt = new DataTable();
            adsa.Fill(dt);
            if (usersrv.IsHasPayment(UserService.UserNo) == true)
            {
                dt = null;
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    UserService.PayItemCount = dt.Rows.Count;
                    //UserService.PayCount = dt.Rows
                    gv_PayMoney.DataSource = dt;
                    gv_PayMoney.DataBind();
                    btn_Pay.Visible = true;
                    lbl_null.Text = null;
                }
                else
                {
                    UserService.PayItemCount = dt.Rows.Count;
                    gv_PayMoney.DataSource = null;
                    gv_PayMoney.DataBind();
                    lbl_null.Text = "暂无缴费内容";
                    btn_Pay.Visible = false;
                }
            }
            con.Close();
        }

        protected void btn_Pay_Click(object sender, EventArgs e)
        {
            if (usersrv.IsHasPayment(UserService.UserNo)==true)
            {
                Response.Write("<script language=javascript>alert('缴费成功！！！')</script>");
                gv_PayMoney.DataSource = null;
                gv_PayMoney.DataBind();
                btn_Pay.Visible = false;
                lbl_null.Text = "暂无缴费内容";
            }
            else
            {
                Response.Write("<script language=javascript>alert('缴费失败！！！')</script>");
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PageOne.aspx");
        }
    }
}