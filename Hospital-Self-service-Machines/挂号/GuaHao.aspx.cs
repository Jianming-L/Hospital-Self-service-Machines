using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Hospital_Self_service_Machines.服务助手;
using System.Reflection.Emit;

namespace Hospital_Self_service_Machines.挂号
{
    public partial class GuaHao : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        UserService usersrv = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserNo"] == null)
                {
                    Response.Write("<script language=javascript>alert('请先登录您的账号！');location.href='../个人中心/Load.aspx'</" + "script>");
                }
                else
                {
                    listboxBind();
                }
            }
        }
        public void listboxBind()
        {
            string commandText =
                $@"SELECT * FROM tb_Department";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_guahao.Items.Add(sdr["DepartmentName"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_guahao.Items.Add(sdr["DepartmentName"].ToString().Trim());
                }
            }
            else
            {
                lb_guahao.Items.Add("暂无此数据");
            }
            con.Close();
        }

        protected void lb_guahao_SelectedIndexChanged(object sender, EventArgs e)
        {
            lb_guahaoxiangxi.Items.Clear();
            string commandText =
                $@"SELECT * FROM tb_DepartmentDetail WHERE DepartmentNo={lb_guahao.SelectedIndex}";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_guahaoxiangxi.Items.Add(sdr["DepartmentDetailName"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_guahaoxiangxi.Items.Add(sdr["DepartmentDetailName"].ToString().Trim());
                }
            }
            else
            {
                lb_guahaoxiangxi.Items.Add("暂无此数据");
            }
            con.Close();
        }
        //$@"SELECT DD.DepartmentDetailName,S.Symptom
        //    FROM tb_DepartmentDetail AS DD
        //    LEFT JOIN tb_Symptom AS S ON DD.DepartmentDetailNo=S.SuggestDepartmentDetailNo
        //    WHERE DD.DepartmentDetailName='{lb_guahaoxiangxi.SelectedValue.ToString().Trim()}'";
        protected void lb_guahaoxiangxi_SelectedIndexChanged(object sender, EventArgs e)
        {
            FindNumber();
            Bind();
        }
        public void FindNumber()
        {
            string commandText =
                $@"SELECT DepartmentDetailNo
                    FROM tb_DepartmentDetail 
                    WHERE DepartmentDetailName='{lb_guahaoxiangxi.SelectedValue}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["DepartmentDetailNo"] = Int32.Parse(reader["DepartmentDetailNo"].ToString());
                    //lbl_msg.Text = Session["DepartmentDetailNo"].ToString();
                }
            }
            catch
            {
                //throw;
                Response.Write("<script language=javascript>alert('系统出现异常！请联系前台工作员')</" + "script>");
            }
            finally
            {
                con.Close();
            }
        }
        public void Bind()
        {
            string commandText =
                $@"SELECT D.DepartmentName,DD.DepartmentDetailName,IIF(UserNo='{Session["UserNo"].ToString().Trim()}','是','否') AS IsRegisterd
                    FROM tb_Department AS D
                    LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentNo=D.DepartmentNo
                    LEFT JOIN tb_Registerd AS R ON R.DepartmentDetailNo=DD.DepartmentDetailNo
                    WHERE D.DepartmentNo='{lb_guahao.SelectedIndex}' AND DD.DepartmentDetailNo='{Session["DepartmentDetailNo"]}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            try
            {
                con.Open();
                DataSet ds = new DataSet();
                adsa.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gv_guahao.DataSource = ds;
                    gv_guahao.DataBind();
                }
                else
                {
                    gv_guahao.DataSource = null;
                    gv_guahao.DataBind();
                }
            }
            catch
            {
                //throw;
                Response.Write("<script language=javascript>alert('系统出现异常！请联系前台工作员')</" + "script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void gv_guahao_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "btn_yuyue")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (lb_guahao.SelectedIndex == 0)
                {
                    Response.Write("<script language=javascript>alert('未选择科室，预约失败')</" + "script>");
                    gv_guahao.DataSource = null;
                    gv_guahao.DataBind();
                }
                else
                {
                    if (((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text != "")
                    {
                        //预约时间不可早于当前时间
                        if (DateTime.Now.ToLocalTime() <= DateTime.Parse(((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text))
                        {
                            if (usersrv.IsHasRegiserd(Session["UserNo"].ToString().Trim(), (int)Session["DepartmentDetailNo"]))
                            {
                                if (usersrv.IsInsertRegister(Session["UserNo"].ToString().Trim(), (int)Session["DepartmentDetailNo"], DateTime.Parse(((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text)))
                                {
                                    Response.Write("<script language=javascript>alert('预约成功')</" + "script>");
                                    Bind();
                                }
                            }
                            else
                            {
                                Response.Write("<script language=javascript>alert('您已经预约过该科室，不可重复预约')</" + "script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('请重新选择预约时间\\n预约时间不可早于当前时间\\n请认真看当前时间并比较')</" + "script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('预约时间不得为空！！！')</" + "script>");
                    }
                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }
    }
}