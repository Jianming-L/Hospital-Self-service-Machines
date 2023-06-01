using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace Hospital_Self_service_Machines.其它
{
    public partial class OtherFunction : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //lbl_msg.Text = UserService.RecordCount.ToString();
            }
        }

        protected void btn_Find_Click(object sender, EventArgs e)
        {
            UserService.RestFlat = 0;
            ViewState["search"] = this.txb_Name.Text;
            UserService.SearchFlat = 1;
            bind();
        }
        public void bind()
        {
            DoctorNameFindModel db = new DoctorNameFindModel();
            string searchs = ViewState["search"].ToString();
            var query = (from d in db.DoctorInfo
                         join dp in db.DepartmentDetail on d.DepartmentDetailNo equals dp.DepartmentDetailNo
                         where d.DepartmentDetailNo != 0 && d.DoctorName.Contains(searchs)
                         select new
                         {
                             DoctorName = d.DoctorName.Trim(),
                             DepartmentDetailName = dp.DepartmentDetailName.Trim()
                         }).ToList();
            var result = query.ToList().Select(x => $"SELECT '{x.DoctorName}' AS DoctorName,'{x.DepartmentDetailName}' AS DepartmentDetailName");
            SqlDataSource1.SelectCommand = "SELECT DoctorName, DepartmentDetailName FROM (" + String.Join(" UNION ", result) + ") AS t";
            gv_FindName.DataSourceID = "SqlDataSource1";
            gv_FindName.DataBind();
            //this.SqlDataSource1.SelectCommand =
            //    "SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName FROM tb_DoctorInfo AS DI LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo WHERE DI.DepartmentDetailNo<>0 AND DI.DoctorName LIKE '%" + ViewState["search"].ToString() + "%'";
        }

        protected void gv_FindName_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (UserService.SearchFlat == 1)
            {
                bind();
                GridView theGrid = sender as GridView;
                int newPageIndex = 0;
                if (e.NewPageIndex == -3)
                {
                    TextBox txb_NewPageIndex = null;
                    GridViewRow pagerRow = theGrid.BottomPagerRow;
                    if (pagerRow != null)
                    {
                        txb_NewPageIndex = pagerRow.FindControl("txb_NewPageIndex") as TextBox;
                    }
                    if (txb_NewPageIndex != null)
                    {
                        newPageIndex = int.Parse(txb_NewPageIndex.Text) - 1;
                    }
                }
                else
                {
                    newPageIndex = e.NewPageIndex;
                }
                newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
                newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;
                theGrid.PageIndex = newPageIndex;
                if (theGrid.PageCount > 0)
                {
                    theGrid.PageIndex = theGrid.PageCount - 1;   //  将当前显示页的索引转到最后一页    
                    theGrid.DataBind();
                    int lastSize = theGrid.Rows.Count;           //  获得最后一页的行数
                    if (theGrid.PageCount > 1)     //  如果页数大于1页，则计算出
                    {                                                       //  总行数=（总页数-1）* 每页行数 +  最后一页的行数
                        int rowsCount = theGrid.PageSize * (theGrid.PageCount - 1) + lastSize;
                        UserService.RecordCount = rowsCount;
                    }
                    else
                    {
                        //lbl_recordcount.Text = lastSize.ToString();
                        theGrid.PageIndex = 0;
                    }
                }
            }
            else if (UserService.RestFlat == 2)
            {
                bind2();
                GridView theGrid = sender as GridView;
                int newPageIndex = 0;
                if (e.NewPageIndex == -3)
                {
                    TextBox txb_NewPageIndex = null;
                    GridViewRow pagerRow = theGrid.BottomPagerRow;
                    if (pagerRow != null)
                    {
                        txb_NewPageIndex = pagerRow.FindControl("txb_NewPageIndex") as TextBox;
                    }
                    if (txb_NewPageIndex != null)
                    {
                        newPageIndex = int.Parse(txb_NewPageIndex.Text) - 1;
                    }
                }
                else
                {
                    newPageIndex = e.NewPageIndex;
                }
                newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
                newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;
                theGrid.PageIndex = newPageIndex;
            }
            else
            {
                GridView theGrid = sender as GridView;
                int newPageIndex = 0;
                if (e.NewPageIndex == -3)
                {
                    TextBox txb_NewPageIndex = null;
                    GridViewRow pagerRow = theGrid.BottomPagerRow;
                    if (pagerRow != null)
                    {
                        txb_NewPageIndex = pagerRow.FindControl("txb_NewPageIndex") as TextBox;
                    }
                    if (txb_NewPageIndex != null)
                    {
                        newPageIndex = int.Parse(txb_NewPageIndex.Text) - 1;
                    }
                }
                else
                {
                    newPageIndex = e.NewPageIndex;
                }
                newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
                newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;
                theGrid.PageIndex = newPageIndex;
                if (theGrid.PageCount > 0)
                {
                    theGrid.PageIndex = theGrid.PageCount - 1;   //  将当前显示页的索引转到最后一页    
                    theGrid.DataBind();
                    int lastSize = theGrid.Rows.Count;           //  获得最后一页的行数
                    if (theGrid.PageCount > 1)     //  如果页数大于1页，则计算出
                    {                                                       //  总行数=（总页数-1）* 每页行数 +  最后一页的行数
                        int rowsCount = theGrid.PageSize * (theGrid.PageCount - 1) + lastSize;
                        UserService.RecordCount = rowsCount;
                    }
                    else
                    {
                        //lbl_recordcount.Text = lastSize.ToString();
                        theGrid.PageIndex = 0;
                    }
                }
            }
        }

        protected void gv_FindName_PageIndexChanged(object sender, EventArgs e)
        {
            //lbl_msg.Text = UserService.RecordCount.ToString();
        }

        protected void btn_Rest_Click(object sender, EventArgs e)
        {
            UserService.SearchFlat = 0;
            UserService.RestFlat = 2;
            txb_Name.Text = null;
            gv_FindName.DataSource = null;
            bind2();
        }
        public void bind2()
        {
            this.SqlDataSource1.SelectCommand =
                "SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName FROM tb_DoctorInfo AS DI LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo WHERE DI.DepartmentDetailNo<>0";
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("../PageOne.aspx");
        }

        protected void gv_FindName_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "btn_FindDocInfo")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                UserService.DoctorName = ((System.Web.UI.WebControls.Label)gv_FindName.Rows[index].Cells[2].FindControl("lbl_name")).Text;
                UserService.DepartmentDetial= ((System.Web.UI.WebControls.Label)gv_FindName.Rows[index].Cells[1].FindControl("lbl_keshi")).Text;
                //lbl_msg.Text = ((System.Web.UI.WebControls.Label)gv_FindName.Rows[index].Cells[2].FindControl("lbl_name")).Text +((System.Web.UI.WebControls.Label)gv_FindName.Rows[index].Cells[1].FindControl("lbl_keshi")).Text;
            }
        }

        protected void btn_FindDocInfo_Click(object sender, EventArgs e)
        {
            
        }
        /// <summary>
        ///  GridView 控件之前，必须先为该控件中的每一行创建一个 GridViewRow 对象。
        ///  在创建 GridView 控件中的每一行时，将引发 RowCreated 事件。
        ///  这使我们可以提供一个这样的事件处理方法，即每次发生此事件时都执行一个自定义例程（如在行中添加自定义内容，当然也可以添加e.CommandArgument属性为模版列里的LinkButton）。
        ///  GridViewRowEventArgs 对象将被传给事件处理方法，随之我们可以访问正在创建的行的属性。
        ///  若要访问行中的特定单元格，可以使用 GridViewRowEventArgs 对象的 Cells 属性。
        ///  使用 RowType 属性可确定正在创建的是哪一种行类型（标题行、数据行等等）。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gv_FindName_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button Button1 = (Button)e.Row.FindControl("btn_FindDocInfo");
                Button1.CommandArgument = e.Row.RowIndex.ToString();
            }
        }
    }
}