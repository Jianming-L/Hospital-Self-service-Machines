using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Hospital_Self_service_Machines.挂号
{
    public partial class GuaHao : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
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
        public void listboxBind2()
        {
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

        protected void lb_guahaoxiangxi_SelectedIndexChanged(object sender, EventArgs e)
        {
            string commandText =
                $@"SELECT DD.DepartmentDetailName,S.Symptom
                    FROM tb_DepartmentDetail AS DD
                    LEFT JOIN tb_Symptom AS S ON DD.DepartmentDetailNo=S.SuggestDepartmentDetailNo
                    WHERE DD.DepartmentDetailName='{lb_guahaoxiangxi.SelectedValue.ToString().Trim()}'";
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
                Response.Write("<script language=javascript>alert('系统出现异常！请联系前台工作员')</" + "script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void gv_guahao_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}