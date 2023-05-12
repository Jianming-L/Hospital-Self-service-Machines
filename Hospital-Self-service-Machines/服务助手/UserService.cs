using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Data;
using System.Web.Services.Description;

namespace Hospital_Self_service_Machines.服务助手
{
    public class UserService
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        static string conns = "Data Source=(Local);Initial Catalog=医院自助服务机;Integrated Security=True;";
        //Hospital_Self_service_MachinesDataContext db = new Hospital_Self_service_MachinesDataContext();
        /// <summary>
        /// 返回用户账号
        /// </summary>
        public static string UserNo { get; set; }
        /// <summary>
        /// 返回星期(int)
        /// </summary>
        public static int WeekdayCount { get; set; }
        /// <summary>
        /// 返回医生工作时间段
        /// </summary>
        public static string WorkTime { get; set; }
        /// <summary>
        /// 返回医生编号
        /// </summary>
        public static string DoctorNo { get; set; }
        /// <summary>
        /// 返回用户姓名
        /// </summary>
        public static string UserName { get; set; }
        /// <summary>
        /// 返回国籍编号
        /// </summary>
        public static int NationNo { get; set; }
        /// <summary>
        /// 返回省编号
        /// </summary>
        public static int ProvinceNo { get; set; }
        /// <summary>
        /// 返回市区编号
        /// </summary>
        public static int CityNo { get; set; }
        /// <summary>
        /// 返回县区编号
        /// </summary>
        public static int CountryNo { get; set; }
        /// <summary>
        /// 返回民族编号
        /// </summary>
        public static int EthnicGroupNo { get; set; }
        /// <summary>
        /// 返回性别
        /// </summary>
        public static int Gender { get; set; }
        /// <summary>
        /// 返回出生日期
        /// </summary>
        public static DateTime Birthday { get; set; }
        /// <summary>
        /// 返回国籍
        /// </summary>
        public static string NationName { get; set; }
        /// <summary>
        /// 返回省
        /// </summary>
        public static string ProvinceName { get; set; }
        /// <summary>
        /// 返回市区
        /// </summary>
        public static string CityName { get; set; }
        /// <summary>
        /// 返回县区
        /// </summary>
        public static string CountryName { get; set; }
        /// <summary>
        /// 返回民族
        /// </summary>
        public static string EthnicGroupName { get; set; }
        /// <summary>
        /// 返回总数
        /// </summary>
        public static int RecordCount { get; set; }
        /// <summary>
        /// 返回是否点击搜索进行分页的标志
        /// </summary>
        public static int SearchFlat { get; set; }
        /// <summary>
        /// 返回是否点击重置gridview的标志
        /// </summary>
        public static int RestFlat { get; set; }
        /// <summary>
        /// 返回医生姓名
        /// </summary>
        public static string DoctorName { get; set; }
        /// <summary>
        /// 返回详细科室
        /// </summary>
        public static string DepartmentDetial { get; set; }
        /// <summary>
        /// 返回缴费总数
        /// </summary>
        public static decimal PayCount { get; set; }
        /// <summary>
        /// 返回缴费项目数量
        /// </summary>
        public static int PayItemCount { get; set; }
        /// <summary>
        /// 返回总价格
        /// </summary>
        public static decimal SumPrice { get; set; }
        /// <summary>
        /// 登录失败次数
        /// </summary>
        public static int LogInFailCount = 0;
        /// <summary>
        /// 是否冻结
        /// </summary>
        public static int IsActivated=0;
        public bool IsSignUp(string userno,string usename,string password)
        {
            string commandText =
                $@"INSERT INTO tb_User(UserNo,UserName,Password) VALUES(@UserNo,@UserName,HASHBYTES('MD2',@Password))";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@UserNo", userno);
            cmd.Parameters.AddWithValue("@UserName", usename);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters["@Password"].SqlDbType = SqlDbType.VarChar;
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
                $@"SELECT 1 FROM tb_User WHERE UserNo=@userno";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@UserNo", userno);
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
        public bool IsSucceedLoad(string userno, string password)
        {
            Hospital_Self_service_MachinesModel db = new Hospital_Self_service_MachinesModel(); 
            var users = (from u in db.User
                        where u.UserNo == userno
                        select u).First();
            string IsHasActivated;
            string commandText =
                $@"SELECT * FROM tb_User WHERE UserNo=@userno AND Password=HASHBYTES('MD2',@Password)";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@UserNo", userno);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters["@Password"].SqlDbType = SqlDbType.VarChar;
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    IsHasActivated = reader["IsActivated"].ToString();
                    if (IsHasActivated =="False")
                    {
                        //UserName = reader["UserName"].ToString();
                        UserName=users.UserName;
                        return true;
                    }
                    else
                    {
                        IsActivated = 1;
                        return false;
                    }
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
        public string LogInFailMax(string userno, string password)
        {
            if (LogInFailCount >= 3)
            {
                IsHasActivated(userno, password);
                string message = "密码错误已达上限,您的账号已被冻结\\n请联系前台进行解封！";
                return message;
            }
            else
            {
                return null;
            }
        }
        public string LogInFail()
        {
            if (LogInFailCount > 0 && LogInFailCount < 3)
            {
                string message = $"密码错误，请重新输入！\\n您还有{3 - LogInFailCount}次机会！";
                return message;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 对账号进行冻结
        /// </summary>
        /// <param name="userno"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool IsHasActivated(string userno, string password)
        {
            string commandText =
                $@"UPDATE tb_User SET IsActivated=1,LoginFailCount='{LogInFailCount}' WHERE UserNo=@UserNo";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@UserNo", userno);
            try
            {
                con.Open();
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

        public bool IsInsertRegister(string userno,int xiangxikeshi,DateTime yuyueshijian,string jutishijianduan)
        {
            string commandText =
                $@"INSERT INTO tb_Registerd VALUES('{userno}',{xiangxikeshi},@RegisterTime,'{jutishijianduan}')";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@RegisterTime", yuyueshijian);
            cmd.Parameters["@RegisterTime"].SqlDbType = SqlDbType.SmallDateTime;
            try
            {
                con.Open();
                int rowAffect = cmd.ExecuteNonQuery();
                if (rowAffect == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        /// <summary>
        /// 避免重复预约同一科室
        /// </summary>
        /// <param name="userno"></param>
        /// <param name="keshidalei"></param>
        /// <param name="xiangxikeshi"></param>
        /// <returns></returns>
        public bool IsHasRegiserd(string userno, int xiangxikeshi,string dateTime)
        {
            string commandText =
                $@"SELECT * FROM tb_Registerd WHERE UserNo='{userno}' AND DepartmentDetailNo={xiangxikeshi} AND SpecificTimePeriod='{dateTime}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        /// <summary>
        /// 预约时间在医生工作时间范围之内
        /// </summary>
        /// <param name="doctorworktime"></param>
        /// <param name="starttime"></param>
        /// <returns></returns>
        public bool indoctorworktime(DateTime doctorworktime,DateTime starttime)
        {
            if(doctorworktime<= starttime)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool isdeleteyuyueshijian(string userno, int departmentno, DateTime riqi, string shijianduan)
        {
            string commandText =
                $@"DELETE tb_Registerd 
                    WHERE UserNo='{userno}' AND DepartmentDetailNo='{departmentno}' AND RegisterTime='{riqi}' AND SpecificTimePeriod='{shijianduan}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    if (ishasintableRegisterdCancelCount(userno))
                    {
                        issucceedupdate(userno);
                    }
                    else
                    {
                        isinserttableRegisterdCancelCount(userno);
                    }
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
        /// <summary>
        /// 是否存在用户
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool ishasintableRegisterdCancelCount(string userno)
        {
            string commandText =
                $@"SELECT *
                    FROM tb_RegisterdCancelCount
                    WHERE UserNo='{userno}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader= cmd.ExecuteReader();
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
        /// <summary>
        /// 初始插入数据
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool isinserttableRegisterdCancelCount(string userno)
        {
            string commandText =
                $@"INSERT INTO tb_RegisterdCancelCount VALUES('{userno}',1) ";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
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
        /// <summary>
        /// 当取消预约时，该用户爽约会记过一次
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool issucceedupdate(string userno)
        {
            string commandText =
                $@"UPDATE tb_RegisterdCancelCount SET Count+=1
                    WHERE UserNo='{userno}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
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
        public static DataTable Table(string sql)
        {
            using (SqlConnection con = new SqlConnection(conns))
            {
                SqlDataAdapter adsa = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                adsa.Fill(dt);
                return dt;
            }
        }
        /// <summary>
        /// 判断该用户是否已经建档
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool IsHasBuildInfo(string userno)
        {
            string commandText =
                $@"SELECT *
                    FROM tb_DocumentationInformation
                    WHERE UserNo='{userno}'";
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
        /// <summary>
        /// 是否已经缴费
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool IsHasPayment(string userno)
        {
            string commandText =
                $@"UPDATE tb_Payment SET PayTime='{DateTime.Now.ToString("d")}',Flat=1
                    WHERE UserNo='{userno}' AND Flat=0";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == UserService.PayItemCount)
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

        public bool IsHasPaymentTime(string userno)
        {
            string commandText =
                $@"UPDATE tb_Payment SET PayTime='{DateTime.Now.ToString("d")}'
                    WHERE UserNo='{userno}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            try
            {
                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == UserService.PayItemCount)
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
        /// <summary>
        /// 判断提交还是未提交
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool IsSubmitPayment(string userno)
        {
            string commandText =
                $@"SELECT COUNT(*) AS A
                    FROM tb_Payment
                    WHERE UserNo='{userno}' AND Flat=0";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    int result = int.Parse(reader["A"].ToString());
                    if (result == 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                return false;
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
        /// <summary>
        /// 是否存在该用户
        /// </summary>
        /// <param name="userno"></param>
        /// <returns></returns>
        public bool IsHasUser(string userno)
        {
            string commandText =
                $@"SELECT * FROM tb_User WHERE UserNo LIKE '%{userno}%'";
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

        //public bool deleteyestodaydata(DateTime dateTime)
        //{
        //    string commandText =
        //        $@"DELETE tb_Registerd WHERE (SELECT DATEADD(SS,-1,DATEADD(DD,1,CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),20))))) <= '{dateTime}'";
        //    SqlConnection con = new SqlConnection(connectionstring);
        //    SqlCommand cmd = new SqlCommand(commandText, con);
        //    try
        //    {
        //        con.Open();
        //        int result=cmd.ExecuteNonQuery();
        //        if (result != 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}
    }
}