<%@ Page Title="专家查询" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="OtherFunction.aspx.cs" Inherits="Hospital_Self_service_Machines.其它.OtherFunction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .lkb{
            color:white;
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:1%;text-align:center">
        <h1 style="font-family:华文行楷;color:crimson">-->专家介绍<--</h1>
    </div>
    <div style="margin-left:560px;">
        <table>
            <tr>
                <td><asp:TextBox runat="server" ID="txb_Name" height="20px" Width="300px" placeholder="模糊查询专家名字"></asp:TextBox></td>
                <td><asp:Button runat="server" ID="btn_Find" Width="80px" Height="30px" Text="查询" OnClick="btn_Find_Click" /></td>
                <td><asp:Button runat="server" ID="btn_Rest" Width="80px" Height="30px" Text="重置" OnClick="btn_Rest_Click" /></td>
            </tr>
        </table>
    </div>
    <div style="margin-left:270px;padding-top:1%;text-align:center">
        <table>
            <tr>
                <td rowspan="4">
                    <asp:GridView runat="server" ID="gv_FindName" DataSourceID="sqlDataSource1" Width="1000px" AllowPaging="True" AutoPostBack=true AutoGenerateColumns="False" OnRowCommand="gv_FindName_RowCommand" OnPageIndexChanged="gv_FindName_PageIndexChanged" OnPageIndexChanging="gv_FindName_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="专家"><ItemTemplate><asp:Label runat="server" ID="lbl_name" Text='<%# Bind("DoctorName") %>'></asp:Label>
                                </ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="科室"><ItemTemplate><asp:Label runat="server" ID="lbl_keshi" Text='<%# Bind("DepartmentDetailName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:Button ID="btn_Find" runat="server" Text="查看" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <PagerTemplate>
            <%--                总共:
                            <asp:Label runat="server" ID="lbl_Count"></asp:Label>条--%>
                             当前第:
                            <asp:Label runat="server" ID="lbl_CurrentPage" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                            页/共:
                            <asp:Label runat="server" ID="lbl_PageCount" Text="<%# ((GridView)Container.NamingContainer).PageCount %>" ></asp:Label>
                            页
                            <asp:LinkButton runat="server" ID="lkb_FirstPage" CssClass="lkb" CommandArgument="First" CommandName="Page" Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lkb_PreviousPage" CssClass="lkb" CommandArgument="Prev" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                            <asp:LinkButton ID="lbk_NextPage" runat="server" CssClass="lkb" CommandArgument="Next" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                            <asp:LinkButton ID="lbk_LastPage" runat="server" CssClass="lkb" CommandArgument="Last" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>           
                            转到第：
                            <asp:TextBox ID="txb_NewPageIndex" runat="server" Width="30px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                            <asp:LinkButton ID="btn_Go" runat="server" CssClass="lkb" CausesValidation="False" CommandArgument="-2" CommandName="Page" Text="GO" />
                        </PagerTemplate>
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td style="height:125px"></td>
            </tr>
            <tr><td style="height:125px"></td></tr>
            <tr><td style="height:125px"></td></tr>
            <tr>
                <td><asp:Button runat="server" ID="btn_Back" Text="返回" Width="80" Height="50" OnClick="btn_Back_Click" /></td>
            </tr>
        </table>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1"
            ConnectionString="<%$ ConnectionStrings:医院自助服务机 %>"
            SelectCommand="SELECT DISTINCT DI.DoctorName,DD.DepartmentDetailName FROM tb_DoctorInfo AS DI LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo WHERE DI.DepartmentDetailNo<>0">
        </asp:SqlDataSource>
        
    </div>
    <asp:Label runat="server" ID="lbl_msg"></asp:Label>
</asp:Content>
