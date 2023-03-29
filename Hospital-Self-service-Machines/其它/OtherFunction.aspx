<%@ Page Title="专家查询" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="OtherFunction.aspx.cs" Inherits="Hospital_Self_service_Machines.其它.OtherFunction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style1 {
            width: 80px;
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
                <td><asp:TextBox runat="server" ID="txb_Name" height="20px" Width="300px" placeholder="请输入专家名字"></asp:TextBox></td>
                <td class="auto-style1"><asp:Button runat="server" ID="btn_Find" Width="80px" Height="30px" Text="查询" OnClick="btn_Find_Click" /></td>
            </tr>
        </table>
    </div>
    <div style="margin-left:270px;padding-top:1%;text-align:center">
        <asp:GridView runat="server" ID="gv_FindName" Width="1000px" BackColor="#CCFFFF" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gv_FindName_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="专家"><ItemTemplate><asp:Label runat="server" ID="lbl_name" Text='<%# Bind("DoctorName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="科室"><ItemTemplate><asp:Label runat="server" ID="lbl_keshi" Text='<%# Bind("DepartmentDetailName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <asp:ButtonField Text="查看" HeaderText="操作" />
            </Columns>
            <PagerTemplate>
                当前第:
                <asp:Label runat="server" ID="lbl_CurrentPage" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                页/共:
                <asp:Label runat="server" ID="lbl_PageCount" Text="<%# ((GridView)Container.NamingContainer).PageCount %>" ></asp:Label>
                页
                <asp:LinkButton runat="server" ID="lkb_FirstPage" CommandArgument="First" CommandName="Page" Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="lkb_PreviousPage" CommandArgument="Prev" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                <asp:LinkButton ID="lbk_NextPage" runat="server" CommandArgument="Next" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                <asp:LinkButton ID="lbk_LastPage" runat="server" CommandArgument="Last" CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>           
                转到第：
                <asp:TextBox ID="txb_NewPageIndex" runat="server" Width="30px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                <asp:LinkButton ID="btn_Go" runat="server" CausesValidation="False" CommandArgument="-2" CommandName="Page" Text="GO" />
            </PagerTemplate>
        </asp:GridView>
    </div>
<%--    <a>按科室名称查找，按专家名字查找</a>
    <a>SELECT *
FROM tb_DoctorInfo AS DI
LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo
WHERE DD.Department DetailNo<>0</a>--%>
</asp:Content>
