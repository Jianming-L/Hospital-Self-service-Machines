using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.建档
{
    public partial class DocumentationThree : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Ishas())
                {
                    UPDATE();
                }
                else
                {
                    string commandText =
                    $@"INSERT INTO tb_DocumentationInformation VALUES('{Session["UserNo"].ToString().Trim()}','{UserService.UserName}',{UserService.Gender},'{UserService.Birthday}','{UserService.NationNo}','{UserService.ProvinceNo}','{UserService.CityNo}','{UserService.CountryNo}','{UserService.EthnicGroupNo}')";
                    SqlConnection con = new SqlConnection(connectionstring);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(commandText, con);
                    int result = cmd.ExecuteNonQuery();
                    if (result == 1)
                    {

                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('建档失败！！！')</" + "script>");
                    }
                    con.Close();
                }
            }
        }
        public bool Ishas()
        {
            string commandText =
                $@"SELECT 1
                    FROM tb_DocumentationInformation
                    WHERE UserNo='{UserService.UserNo.Trim()}'";
            SqlConnection con = new SqlConnection(connectionstring);
            con.Open();
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return true;
                }
                else
                {
                    return false;
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
        public bool UPDATE()
        {
            string commandText = 
                $@"UPDATE tb_DocumentationInformation SET Gender='{UserService.Gender}',Birthday='{UserService.Birthday}',Nation='{UserService.NationNo}',Province='{UserService.ProvinceNo}',City='{UserService.CityNo}',Country='{UserService.CountryNo}',EthnicGroup='{UserService.EthnicGroupNo}'  WHERE UserNo='{Session["UserNo"]}'";
            SqlConnection con = new SqlConnection(connectionstring);
            con.Open();
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    return true;
                }
                else
                {
                    return false;
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
    }
}