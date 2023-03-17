using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Hospital_Self_service_Machines.服务助手;
using System.Reflection.Emit;
using System.Reflection;
using System.Text.RegularExpressions;

namespace Hospital_Self_service_Machines.挂号
{
    public partial class GuaHao : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        UserService usersrv = new UserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserNo"] == null)
                {
                    Response.Write("<script language=javascript>alert('请先登录您的账号！');location.href='../个人中心/Load.aspx'</" + "script>");
                }
                else
                {
                    listboxBind();
                    DropDownList_Time();
                    //usersrv.deleteyestodaydata(DateTime.Now);
                }
            }
        }
        public void listboxBind()
        {
            string commandText =
                $@"SELECT * FROM tb_Department";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_guahao.Items.Add(sdr["DepartmentName"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_guahao.Items.Add(sdr["DepartmentName"].ToString().Trim());
                }
            }
            else
            {
                lb_guahao.Items.Add("暂无此数据");
            }
            con.Close();
        }

        protected void lb_guahao_SelectedIndexChanged(object sender, EventArgs e)
        {
            lb_guahaoxiangxi.Items.Clear();
            string commandText =
                $@"SELECT * FROM tb_DepartmentDetail WHERE DepartmentNo={lb_guahao.SelectedIndex}";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_guahaoxiangxi.Items.Add(sdr["DepartmentDetailName"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_guahaoxiangxi.Items.Add(sdr["DepartmentDetailName"].ToString().Trim());
                }
            }
            else
            {
                lb_guahaoxiangxi.Items.Add("暂无此数据");
            }
            con.Close();
        }
        //$@"SELECT DD.DepartmentDetailName,S.Symptom
        //    FROM tb_DepartmentDetail AS DD
        //    LEFT JOIN tb_Symptom AS S ON DD.DepartmentDetailNo=S.SuggestDepartmentDetailNo
        //    WHERE DD.DepartmentDetailName='{lb_guahaoxiangxi.SelectedValue.ToString().Trim()}'";
        protected void lb_guahaoxiangxi_SelectedIndexChanged(object sender, EventArgs e)
        {
            FindNumber();
            BindDoctor();
        }
        public void FindNumber()
        {
            string commandText =
                $@"SELECT DepartmentDetailNo
                    FROM tb_DepartmentDetail 
                    WHERE DepartmentDetailName='{lb_guahaoxiangxi.SelectedValue}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["DepartmentDetailNo"] = Int32.Parse(reader["DepartmentDetailNo"].ToString());
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
        //SELECT DISTINCT D.DepartmentName,DD.DepartmentDetailName,IIF(R.SpecificTimePeriod= '{}','是','否') AS IsRegisterd
        //            FROM tb_Department AS D
        //            LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentNo=D.DepartmentNo
        //            LEFT JOIN tb_Registerd AS R ON R.DepartmentDetailNo=DD.DepartmentDetailNo
        //            WHERE DD.DepartmentDetailNo= '{Session["DepartmentDetailNo"]}'

        //            GROUP BY R.UserNo, D.DepartmentName, DD.DepartmentDetailName
        //            HAVING IIF(R.UserNo= '{Session["UserNo"].ToString().Trim()}','是','否')='否'
        public void Bind()
        {
            string commandText =
                $@"SELECT D.DepartmentName,DD.DepartmentDetailName,DI.DoctorName,DI.WorkTime AS WorkTime
                    FROM tb_Department AS D
                    LEFT JOIN tb_DepartmentDetail AS DD ON D.DepartmentNo=DD.DepartmentNo
                    LEFT JOIN tb_DoctorInfo AS DI ON DI.DepartmentDetailNo=DD.DepartmentDetailNo
                    WHERE DD.DepartmentDetailNo= '{Session["DepartmentDetailNo"]}' AND DI.WorkWeekday='{UserService.WeekdayCount}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlConnection con1 = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            SqlCommand cmd = new SqlCommand(commandText, con1);
            SqlDataReader reader;
            try
            {
                con.Open();
                con1.Open();
                DataSet ds = new DataSet();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    UserService.WorkTime = reader["WorkTime"].ToString();
                }
                adsa.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gv_guahao.DataSource = ds;
                    gv_guahao.DataBind();
                    //lbl_null.Text = null;
                }
                else
                {
                    gv_guahao.DataSource = null;
                    gv_guahao.DataBind();
                    //lbl_null.Text = "您已经预约过该科室，明天再来预约吧";
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
                con1.Close();
            }
            Bind1();
        }
        /// <summary>
        /// 第二个gridview，显示您预约成功的时间段
        /// </summary>
        public void Bind1()
        {
            string commandText =
                $@"SELECT D.DepartmentName AS 科室大类,DD.DepartmentDetailName AS 详细科室,R.RegisterTime AS 日期,R.SpecificTimePeriod AS 时间段
                    FROM tb_Department AS D
                    LEFT JOIN tb_DepartmentDetail AS DD ON D.DepartmentNo=DD.DepartmentNo
                    LEFT JOIN tb_Registerd AS R ON R.DepartmentDetailNo=DD.DepartmentDetailNo
                    LEFT JOIN tb_User AS U ON U.UserNo=R.UserNo
                    WHERE DD.DepartmentDetailNo= '{Session["DepartmentDetailNo"]}' AND R.UserNo='{Session["UserNo"]}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText, con);
            try
            {
                con.Open();
                DataSet ds = new DataSet();
                adsa.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    gv_xianshiyuyueshuju.DataSource = ds;
                    gv_xianshiyuyueshuju.DataBind();
                    lbl_myyuyue.Text = "您今天预约成功的科室";
                }
                else
                {
                    gv_xianshiyuyueshuju.DataSource = null;
                    gv_xianshiyuyueshuju.DataBind();
                    lbl_myyuyue.Text = null;
                    //lbl_null.Text = "您已经预约过该科室，明天再来预约吧";
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
        /// 绑定下拉框数据
        /// </summary>
        /// <returns></returns>
        public SqlDataReader DropDownList_Time()
        {
            string commandText =
                $@"SELECT * FROM tb_RegisterdTime";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            return cmd.ExecuteReader();
        }
        protected void gv_guahao_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btn_yuyue")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (lb_guahao.SelectedIndex == 0)
                {
                    Response.Write("<script language=javascript>alert('未选择科室，预约失败')</" + "script>");
                    gv_guahao.DataSource = null;
                    gv_guahao.DataBind();
                }
                else
                {
                    if (((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text != "")
                    {
                        string time = ((DropDownList)gv_guahao.Rows[index].Cells[4].FindControl("ddl_time")).Text;//返回选中的时间
                        if (time.TrimEnd() != "---请选择---")
                        {
                            DateTime starttime = DateTime.Parse(time.Substring(0, 5));
                            DateTime doctorstarttime = DateTime.Parse(UserService.WorkTime.Substring(0,5));
                            DateTime date = DateTime.Parse(((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text);//预约日期
                            if (DateTime.Now.ToLocalTime() <= starttime)
                            {
                                if (usersrv.indoctorworktime(doctorstarttime, starttime))
                                {
                                    if (IsFullRegister((int)Session["DepartmentDetailNo"], DateTime.Parse(((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text), time.Trim()))
                                    {
                                        Response.Write("<script language=javascript>alert('预约失败！！！\\n该时间段预约人数已满！！！\\n请重新选另一时间段')</" + "script>");
                                    }
                                    else
                                    {
                                        validate(index, time);
                                    }
                                }
                                else
                                {
                                    Response.Write("<script language=javascript>alert('请重新选择预约时间段\\n预约时间段不在医生工作时间')</" + "script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script language=javascript>alert('请重新选择预约时间段\\n预约时间段不可早于当前时间\\n请认真看当前时间并比较')</" + "script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('预约时间段不得为空！！！')</" + "script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('预约日期不得为空！！！')</" + "script>");
                    }
                }
            }
        }
        /// <summary>
        /// 验证是否存在用户、是否成功插入数据
        /// </summary>
        /// <param name="index"></param>
        /// <param name="time"></param>
        public void validate(int index, string time)
        {
            if (usersrv.IsHasRegiserd(Session["UserNo"].ToString().Trim(), (int)Session["DepartmentDetailNo"], ((DropDownList)gv_guahao.Rows[index].Cells[4].FindControl("ddl_time")).Text))
            {
                if (usersrv.IsInsertRegister(Session["UserNo"].ToString().Trim(), (int)Session["DepartmentDetailNo"], DateTime.Parse(((TextBox)gv_guahao.Rows[index].Cells[1].FindControl("d412")).Text), time.Trim()))
                {
                    Response.Write("<script language=javascript>alert('预约成功')</" + "script>");
                    Bind();
                }
                else
                {
                    Response.Write("<script language=javascript>alert('预约失败！！！')</" + "script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('您已经预约过该科室，不可重复预约')</" + "script>");
            }
        }
        /// <summary>
        /// 根据科室号、日期、时间段三个判断是否预约人满;若人满返回true，否则返回false
        /// </summary>
        public bool IsFullRegister(int keshihao, DateTime riqi, string shijianduan)
        {
            int flag = 0;
            string commandText =
                $@"SELECT COUNT(R.DepartmentDetailNo) AS PEOSUM,IIF(COUNT(R.DepartmentDetailNo)=(SELECT L.LimitCount FROM tb_LimitCount AS L
																				WHERE L.SpecificTimePeriod='{shijianduan}'),'SHI','FOU') AS ISFULLREGISTER
                FROM tb_Registerd AS R
                LEFT JOIN tb_LimitCount AS L ON L.SpecificTimePeriod=R.SpecificTimePeriod
                GROUP BY R.DepartmentDetailNo,R.RegisterTime,R.SpecificTimePeriod
                HAVING R.DepartmentDetailNo='{keshihao}' AND R.RegisterTime=@RegisterTime AND R.SpecificTimePeriod='{shijianduan}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            cmd.Parameters.AddWithValue("@RegisterTime", riqi);
            cmd.Parameters["@RegisterTime"].SqlDbType = SqlDbType.Date;
            SqlDataReader reader;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                string isfullregister;
                if (reader.Read())
                {
                    isfullregister = reader["ISFULLREGISTER"].ToString();
                    if (isfullregister == "SHI")
                    {
                        flag = 1;
                    }
                    else
                    {
                        flag = 0;
                    }
                }
                else
                {
                    flag = 0;
                    //Response.Write("<script language=javascript>alert('读取数据失败！请联系前台工作员')</" + "script>");
                }
                if (flag == 1)
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

        protected void lb_yisheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind();
            lbl_WorkTime.Text = "请选择相对应的时间段，医生今天在位时间段："+ UserService.WorkTime;
        }
        public void BindDoctor()
        {
            lb_yisheng.Items.Clear();
            string commandText =
                $@"SELECT *
                    FROM tb_DoctorInfo
                    WHERE DepartmentDetailNo='{Session["DepartmentDetailNo"]}' AND WorkWeekday='{UserService.WeekdayCount}'";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand(commandText, con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lb_yisheng.Items.Add(sdr["DoctorName"].ToString().Trim());
                while (sdr.Read())
                {
                    lb_yisheng.Items.Add(sdr["DoctorName"].ToString().Trim());
                }
            }
            else
            {
                lb_yisheng.Items.Add("暂无此数据");
            }
            con.Close();
        }

        protected void gv_xianshiyuyueshuju_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "btn_quxiaoyuyue") 
            {
                int index= Convert.ToInt32(e.CommandArgument);
                Label1.Text = DateTime.Parse(((System.Web.UI.WebControls.Label)gv_xianshiyuyueshuju.Rows[index].Cells[2].Controls[0]).Text)+""+ ((System.Web.UI.WebControls.Label)gv_xianshiyuyueshuju.Rows[index].Cells[3].Controls[0]).Text;
                if (usersrv.isdeleteyuyueshijian(Session["UserNo"].ToString().Trim(), (int)Session["DepartmentDetailNo"], DateTime.Parse(((System.Web.UI.WebControls.Label)gv_xianshiyuyueshuju.Rows[index].Cells[2].Controls[0]).Text), ((System.Web.UI.WebControls.Label)gv_xianshiyuyueshuju.Rows[index].Cells[3].Controls[0]).Text))
                {
                    Response.Write("<script language=javascript>alert('取消预约成功！')</" + "script>");
                    Bind();
                    Bind1();
                }
                else
                {
                    Response.Write("<script language=javascript>alert('取消预约失败！')</" + "script>");
                }
            }
        }
    }
}