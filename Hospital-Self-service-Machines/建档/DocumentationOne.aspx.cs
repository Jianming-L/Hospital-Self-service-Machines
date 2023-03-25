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
                ddl_minzu.Items.Clear();
                DropDownList_minzu();
            }
        }
        
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (rdb_gender_man.Checked == true)
            {
                UserService.Gender = 1;
            }
            if (rdb_gender_woman.Checked == true)
            {
                UserService.Gender = 0;
            }
            UserService.NationNo = int.Parse(ddl_nation.SelectedItem.Value);
            UserService.ProvinceNo = int.Parse(ddl_sheng.SelectedItem.Value);
            UserService.CityNo = int.Parse(ddl_shi.SelectedItem.Value);
            UserService.CountryNo = int.Parse(ddl_xian.SelectedItem.Value);
            UserService.EthnicGroupNo = int.Parse(ddl_minzu.SelectedItem.Value);
            UserService.Birthday = DateTime.Parse(d412.Text);
            Response.Redirect("DocumentationTwo.aspx");
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }
        /// <summary>
        /// 国籍
        /// </summary>
        public void DropDownList_nation()
        {
            string commandText =
                $@"SELECT * FROM tb_Nation";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddl_nation.DataSource = sdr;
            this.ddl_nation.DataTextField = "NationName";
            this.ddl_nation.DataValueField = "No";
            this.ddl_nation.DataBind();
            con.Close();
        }
        /// <summary>
        /// 省
        /// </summary>
        public void DropDownList_Province()
        {
            string commandText =
                $@"SELECT * FROM tb_Province WHERE NationNo='{UserService.NationNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddl_sheng.DataSource = sdr;
            this.ddl_sheng.DataTextField = "ProvinceName";
            this.ddl_sheng.DataValueField = "No";
            this.ddl_sheng.DataBind();
            this.ddl_sheng.Items.Insert(0, "---请选择---");
            con.Close();
        }
        /// <summary>
        /// 市
        /// </summary>
        public void DropDownList_City()
        {
            string commandText =
                $@"SELECT * FROM tb_City WHERE ProvinceNo='{UserService.ProvinceNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddl_shi.DataSource = sdr;
            this.ddl_shi.DataTextField = "CityName";
            this.ddl_shi.DataValueField = "No";
            this.ddl_shi.DataBind();
            this.ddl_shi.Items.Insert(0, "---请选择---");
            con.Close();
        }
        /// <summary>
        /// 县区
        /// </summary>
        public void DropDownList_Country()
        {
            string commandText =
                $@"SELECT * FROM tb_Country WHERE CityNo='{UserService.CityNo}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddl_xian.DataSource = sdr;
            this.ddl_xian.DataTextField = "CountryName";
            this.ddl_xian.DataValueField = "No";
            this.ddl_xian.DataBind();
            this.ddl_xian.Items.Insert(0, "---请选择---");
            con.Close();
        }
        protected void ddl_nation_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserService.NationNo = int.Parse(ddl_nation.SelectedItem.Value);
            ddl_sheng.Items.Clear();
            DropDownList_Province();
            ddl_shi.Items.Clear();
            ddl_xian.Items.Clear();
        }

        protected void ddl_sheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_sheng.SelectedItem.Value != "---请选择---")
            {
                UserService.ProvinceNo = int.Parse(ddl_sheng.SelectedItem.Value);
                ddl_shi.Items.Clear();
                DropDownList_City();
                ddl_xian.Items.Clear();
            }
        }

        protected void ddl_shi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddl_shi.SelectedItem.Value!= "---请选择---")
            {
                UserService.CityNo = int.Parse(ddl_shi.SelectedItem.Value);
                ddl_xian.Items.Clear();
                DropDownList_Country();
            }
        }

        protected void ddl_minzu_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserService.EthnicGroupNo=int.Parse(ddl_minzu.SelectedItem.Value);
        }
        public void DropDownList_minzu()
        {
            string sql = string.Format($@"SELECT * FROM tb_EthnicGroup");
            ddl_minzu.DataSource=UserService.Table(sql);
            ddl_minzu.DataTextField = "EthnicGroupName";
            ddl_minzu.DataValueField = "EthnicGroupNo";
            ddl_minzu.DataBind();
        }
    }
}