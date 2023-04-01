using Hospital_Self_service_Machines.其它;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines
{
    public partial class PageOne : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 挂号
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Registered_Click(object sender, EventArgs e)
        {
            Response.Redirect("挂号/GuaHao.aspx");
        }

        protected void btn_FindDepartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("查询科室/FindDepartment.aspx");
        }

        protected void btn_BulidInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("建档/DocumentationOne.aspx");
        }

        protected void btn_OtherFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("专家介绍/OtherFunction.aspx");
        }

        protected void btn_TakeNumber_Click(object sender, EventArgs e)
        {
            Response.Redirect("报告打印/ReportPrinting.aspx");
        }
    }
}