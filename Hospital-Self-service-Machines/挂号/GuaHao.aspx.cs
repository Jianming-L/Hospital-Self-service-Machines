﻿using System;
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
            if (Session["UserNo"] == null)
            {
                Response.Write("<script language=javascript>alert('请先登录您的账号！');location.href='../个人中心/Load.aspx'</" + "script>");
            }
            else
            {
                Bind();
            }
        }
        public void Bind()
        {
            string commandText =
                $@"SELECT * FROM tb_Department";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            DataTable dt = new DataTable();
            adsa.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                ddl_guahao.DataSource = dt;
                ddl_guahao.DataValueField = "DepartmentNo";
                ddl_guahao.DataTextField = "DepartmentName";
                ddl_guahao.DataBind();
            }
            else
            {
                ddl_guahao.Text = "暂无此数据";
            }
            string commandText2 =
                $@"SELECT * FROM tb_DepartmentDetail WHERE DepartmentNo='{ddl_guahao.SelectedValue}'";
            SqlDataAdapter adsa2 = new SqlDataAdapter(commandText2, con);
            DataTable dt2=new DataTable();
            adsa2.Fill(dt2);
            if(dt2.Rows.Count > 0)
            {
                ddl_guahaoxiangxi.DataSource = dt2;
                ddl_guahaoxiangxi.DataValueField = "DepartmentDetailNo";
                ddl_guahaoxiangxi.DataTextField = "DepartmentDetailName";
                ddl_guahaoxiangxi.DataBind();
            }
            else
            {
                ddl_guahaoxiangxi.Text = "暂无此数据";
            }
            con.Close();
        }

        protected void ddl_guahao_SelectedIndexChanged(object sender, EventArgs e)
        {
            string DepartmentNo = this.ddl_guahao.SelectedValue;
            SqlConnection con = new SqlConnection(connectionstring);
            string commandText =
                $@"SELECT * FROM tb_DepartmentDetail WHERE DepartmentNo=" + DepartmentNo;
            con.Open();
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddl_guahaoxiangxi.DataSource = sdr;
            this.ddl_guahaoxiangxi.DataTextField = "DepartmentDetailName";
            this.ddl_guahaoxiangxi.DataValueField = "DepartmentDetailNo";
            this.ddl_guahaoxiangxi.DataBind();
            sdr.Close();
            con.Close();
        }
    }
}