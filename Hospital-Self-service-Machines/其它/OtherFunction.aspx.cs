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
            Bind();
        }

        protected void btn_Find_Click(object sender, EventArgs e)
        {

        }

        protected void gv_FindName_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
            Bind();
        }
        public void Bind()
        {
            string commandText =
                $@"SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName
                    FROM tb_DoctorInfo AS DI
                    LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo
                    WHERE DI.DepartmentDetailNo<>0";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlDataAdapter adsa = new SqlDataAdapter(commandText,con);
            DataSet ds = new DataSet();
            adsa.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                gv_FindName.DataSource = ds;
                gv_FindName.DataBind();
            }
            else
            {
                gv_FindName.DataSource = null;
                gv_FindName.DataBind();
            }
        }
    }
}