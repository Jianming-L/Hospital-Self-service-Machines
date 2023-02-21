using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace Hospital_Self_service_Machines.服务助手
{
    public class UserService
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        public bool IsSignUp(string userno,string usename,string password)
        {
            string commandText =
                $@"INSERT INTO tb_User(UserNo,UserName,Password) VALUES('{userno}','{usename}',HASHBYTES('MD2','{password}'))";
            //$@"INSERT INTO tb_User(UserNo,UserName,Password) VALUES(UserNo='@userno',UserName='@usename',PASSWORD=HASHBYTES('MD2','@password'))";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
                int rowAffect=cmd.ExecuteNonQuery();
                if (rowAffect == 1)
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
        public bool IsHasUserRecord(string userno)
        {
            string commandText =
                $@"SELECT 1 FROM tb_User WHERE UserNo='{userno}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
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
    }
}