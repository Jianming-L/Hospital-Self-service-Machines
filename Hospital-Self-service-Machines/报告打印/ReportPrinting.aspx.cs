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

namespace Hospital_Self_service_Machines.报告打印
{
    public partial class ReportPrinting : System.Web.UI.Page
    {
        UserService usersrv=new UserService();
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (usersrv.IsHasBuildInfo(UserService.UserNo))
            {
                lbl_No.Text = UserService.UserNo;
                lbl_name.Text = UserService.UserName;
                bind2();
                if (UserService.Gender == 1)
                {
                    lbl_gender.Text = "男";
                }
                if (UserService.Gender == 0)
                {
                    lbl_gender.Text = "女";
                }
                agecompute();
                Bind();
                bind();
            }
            else if(UserService.UserNo==null)
            {
                Response.Write("<script language=javascript>alert('请先登录您的账号！！');location.href='../个人中心/Load.aspx'</" + "script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('请先建档并填写相关信息！！！');location.href='../建档/DocumentationOne.aspx'</" + "script>");
            }
        }
        public void agecompute()
        {
            DateTime now = DateTime.Now;
            int age = now.Year - UserService.Birthday.Year;
            if (now.Month < UserService.Birthday.Month || (now.Month == UserService.Birthday.Month && now.Day < UserService.Birthday.Day))
            {
                age--;
            }
            if (age < 1)
            {
                lbl_age.Text = age + "<1岁";
            }
            else
            {
                lbl_age.Text = age.ToString()+" 岁";
            }
        }
        public void Bind()
        {
            string commandText =
                $@"SELECT PCI.ItemNo,II.ItemName,PCI.ResultScore,II.ReferenceValue,II.Unit
                    FROM tb_PatientCheckInformation AS PCI
                    LEFT JOIN tb_ItemInformation AS II ON PCI.ItemNo=II.ItemNo
                    WHERE PCI.UserNo='{UserService.UserNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            con.Open();
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            DataTable dt = new DataTable();
            adsa.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gv_baogaotable.DataSource = dt;
                gv_baogaotable.DataBind();
            }
            else
            {
                gv_baogaotable.DataSource = null;
                gv_baogaotable.DataBind();
                lbl_null.Text = "无检测内容";
            }
            con.Close();
        }
        public void bind()
        {
            DateTime jianceshijian;
            string comandText =
                $@"SELECT *
                    FROM tb_CheckDateInformation
                    WHERE UserNo='{UserService.UserNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(comandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    jianceshijian = DateTime.Parse(reader["CheckTime"].ToString());
                    lbl_jianceshijian.Text = jianceshijian.ToString("D");
                    lbl_jianceyisheng.Text = reader["DoctorCheckName"].ToString();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public void bind2()
        {
            string commandText =
                $@"SELECT *
                    FROM tb_DocumentationInformation 
                    WHERE UserNo='{UserService.UserNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    UserService.Birthday = DateTime.Parse(reader["Birthday"].ToString());
                    bool Gender =bool.Parse(reader["Gender"].ToString());
                    if (Gender == true)
                    {
                        UserService.Gender = 1;
                    }
                    else
                    {
                        UserService.Gender = 0;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }
    }
}