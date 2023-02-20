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
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机ConnectionString"].ConnectionString;
        public bool IsSignUp(string userno,string password)
        {
            string commandText =
                $@"INSERT INTO tb_User(UserNo,UserName,Password) VALUES(UserNo='@userno' AND U.PASSWORD=HASHBYTES('MD2','@password'))";
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
    }
}