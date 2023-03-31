using Hospital_Self_service_Machines.服务助手;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Self_service_Machines.其它
{
    public partial class OtherFunction : System.Web.UI.Page
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["医院自助服务机"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btn_Find_Click(object sender, EventArgs e)
        {
            ViewState["search"] = this.txb_Name.Text;
            UserService.SearchFlat = 1;
            bind();
        }
        public void bind()
        {
            this.SqlDataSource1.SelectCommand =
                "SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName FROM tb_DoctorInfo AS DI LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo WHERE DI.DepartmentDetailNo<>0 AND DI.DoctorName LIKE '%" + ViewState["search"].ToString() + "%'";
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
            }
            else if(UserService.RestFlat == 2)
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
            }


            //if (theGrid.PageCount > 0)
            //{
            //    theGrid.PageIndex = theGrid.PageCount - 1;   //  将当前显示页的索引转到最后一页    
            //    theGrid.DataBind();         
            //    int lastSize = theGrid.Rows.Count;           //  获得最后一页的行数
            //    if (theGrid.PageCount > 1)     //  如果页数大于1页，则计算出
            //    {                                                       //  总行数=（总页数-1）* 每页行数 +  最后一页的行数
            //        int rowsCount = theGrid.PageSize * (theGrid.PageCount - 1) + lastSize;
            //        UserService.RecordCount = rowsCount;
            //    }
            //    else
            //    {
            //        //lbl_recordcount.Text = lastSize.ToString();   
            //        theGrid.PageIndex = 0;
            //    }
            //}
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
            bind2();
            UserService.RestFlat = 0;
        }
        public void bind2()
        {
            this.SqlDataSource1.SelectCommand =
                "SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName FROM tb_DoctorInfo AS DI LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo WHERE DI.DepartmentDetailNo<>0";
        }
    }
}