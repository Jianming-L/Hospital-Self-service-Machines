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

namespace Hospital_Self_service_Machines.建档
{
    public partial class DocumentationOne : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_name.Text = UserService.UserName;
                DropDownList_nation();
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {

        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }
        public void DropDownList_nation()
        {
            string commandText =
                $@"SELECT * FROM tb_Nation";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                ddl_nation.Items.Add(sdr["NationName"].ToString().Trim());
                while (sdr.Read())
                {
                    ddl_nation.Items.Add(sdr["NationName"].ToString().Trim());
                }
            }
            else
            {
                ddl_nation.Items.Add("暂无此数据");
            }
            con.Close();
        }
        public void DropDownList_Province()
        {
            string commandText =
                $@"SELECT * FROM tb_Province WHERE NationNo='{UserService.NationNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                ddl_sheng.Items.Add("---请选择---");
                ddl_sheng.Items.Add(sdr["ProvinceName"].ToString().Trim());
                while (sdr.Read())
                {
                    ddl_sheng.Items.Add(sdr["ProvinceName"].ToString().Trim());
                }
            }
            else
            {
                ddl_sheng.Items.Add("暂无此数据");
            }
            con.Close();
        }
        public void DropDownList_City()
        {
            string commandText =
                $@"SELECT * FROM tb_City WHERE ProvinceNo='{UserService.NationNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                ddl_shi.Items.Add("---请选择---");
                ddl_shi.Items.Add(sdr["CityName"].ToString().Trim());
                while (sdr.Read())
                {
                    ddl_shi.Items.Add(sdr["CityName"].ToString().Trim());
                }
            }
            else
            {
                ddl_shi.Items.Add("暂无此数据");
            }
            con.Close();
        }
        public void DropDownList_Country()
        {
            string commandText =
                $@"SELECT * FROM tb_Country WHERE CityNo='{UserService.CityNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                ddl_xian.Items.Add("---请选择---");
                ddl_xian.Items.Add(sdr["CountryName"].ToString().Trim());
                while (sdr.Read())
                {
                    ddl_xian.Items.Add(sdr["CountryName"].ToString().Trim());
                }
            }
            else
            {
                ddl_xian.Items.Add("暂无此数据");
            }
            con.Close();
        }
        protected void ddl_nation_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserService.NationNo=ddl_nation.SelectedIndex;
            ddl_sheng.Items.Clear();
            DropDownList_Province();
        }

        protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserService.ProvinceNo = ddl_sheng.SelectedIndex;
            ddl_shi.Items.Clear();
            DropDownList_City();
        }

        protected void ddl_shi_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserService.CityNo = ddl_shi.SelectedIndex;
            ddl_xian.Items.Clear();
            DropDownList_Country();
        }
    }
}