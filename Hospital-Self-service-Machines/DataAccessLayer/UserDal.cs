using Hospital_Self_service_Machines.服务助手;
using Npgsql;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Hospital_Self_service_Machines.DataAccessLayer
{
    public class UserDal
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        public byte[] select()
        {
            string userno = UserService.UserNo;
            //string commandText =
            //    $@"SELECT * FROM public.user WHERE userno=@userno";
            //NpgsqlConnection con = new NpgsqlConnection(conpngsql);
            //NpgsqlCommand cmd = new NpgsqlCommand(commandText, con);
            //cmd.Parameters.AddWithValue("@userno", userno);
            //con.Open();
            //NpgsqlDataReader sqlDataReader = cmd.ExecuteReader();
            string commandText =
                $@"SELECT * FROM tb_User WHERE UserNo=@userno";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@userno", userno);
            con.Open();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            try
            {
                if (sqlDataReader.Read())
                {
                    byte[] password = (byte[])sqlDataReader["Password"];        
                    return password;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlDataReader.Close();
            }
        }
    }
}