using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hospital_Self_service_Machines.服务助手;

namespace Hospital_Self_service_Machines.查询科室
{
    public partial class FindDepartment : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserNo"] == null)
            {
                Response.Write("<script language=javascript>alert('请先登录您的账号！');location.href='../个人中心/Load.aspx'</" + "script>");
            }
            else
            {
                listboxBind();
                btn_Back.Visible = false;
            }
        }
        public void listboxBind()
        {
            lbl_Symptom.Text = lb_keshidalei.SelectedValue;
            FindNumber();
            lb_keshidalei.Items.Clear();
            string commandText =
                $@"SELECT * FROM tb_SymptomStype";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_keshidalei.Items.Add(sdr["Symptom"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_keshidalei.Items.Add(sdr["Symptom"].ToString().Trim());
                }
            }
            else
            {
                lb_keshidalei.Items.Add("暂无此数据");
            }
            con.Close();

        }

        protected void lb_keshidalei_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind();
        }

        public void FindNumber()
        {
            string commandText =
                $@"SELECT SymptomStypeNo
                    FROM tb_SymptomStype 
                    WHERE Symptom='{lb_keshidalei.SelectedValue}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["SymptomStypeNo"] = Int32.Parse(reader["SymptomStypeNo"].ToString());
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
                $@"SELECT S.Symptom AS 详细症状,D.DepartmentName AS 科室大类,DD.DepartmentDetailName AS 所在科室
                    FROM tb_SymptomStype AS SS
                    LEFT JOIN tb_Symptom AS S ON SS.SymptomStypeNo=S.SymptomNo
                    LEFT JOIN tb_DepartmentDetail AS DD ON S.SuggestDepartmentDetailNo=DD.DepartmentDetailNo
                    LEFT JOIN tb_Department AS D ON D.DepartmentNo=DD.DepartmentNo
                    WHERE SS.SymptomStypeNo='{Session["SymptomStypeNo"]}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            try
            {
                con.Open();
                DataSet ds = new DataSet();
                adsa.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gv_FindDepartment.DataSource = ds;
                    gv_FindDepartment.DataBind();
                    btn_Back.Visible = true;
                }
                else
                {
                    gv_FindDepartment.DataSource = null;
                    gv_FindDepartment.DataBind();
                    btn_Back.Visible = false;
                }
            }
            catch
            {
                throw;
                //Response.Write("<script language=javascript>alert('系统出现异常！请联系前台工作员')</" + "script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }
    }
}