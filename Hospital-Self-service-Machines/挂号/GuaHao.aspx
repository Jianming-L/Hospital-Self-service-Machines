<%@ Page Title="挂号" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="GuaHao.aspx.cs" Inherits="Hospital_Self_service_Machines.挂号.GuaHao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ddl_keshi{
            border-color:darkturquoise;
        }
        .lb_guahao{
            background-color:rgba(192,192,192,0.5);
        }
        .btn_yuyue{
            text-decoration:none;
            background-color:red;
        }
        .gv_yuyue {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:15%;width:900px;padding-top:40px;padding-left:60px">
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="lb_guahao" runat="server" Width="400px" Height="200px" SelectionMode="Single" CssClass="lb_guahao" AutoPostBack=true OnSelectedIndexChanged="lb_guahao_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td style="width:50px"></td>
                <td>
                    <asp:ListBox ID="lb_guahaoxiangxi" runat="server" Width="400px" Height="200px" CssClass="lb_guahao" AutoPostBack=true OnSelectedIndexChanged="lb_guahaoxiangxi_SelectedIndexChanged" ></asp:ListBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gv_guahao" runat="server" Width="900px" CssClass="gv_yuyue" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gv_guahao_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="科室"><ItemTemplate><asp:Label runat="server" ID="lbl_keshi" Text='<%# Bind("DepartmentDetailName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="典型症状参考"><ItemTemplate><asp:Label runat="server" ID="lbl_dianxingzhengzhuangcankao" Text='<%# Bind("Symptom") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="是否已经预约"></asp:TemplateField>
                <asp:ButtonField HeaderText="操作" Text="预约" CommandName="btn_yuyue" ControlStyle-CssClass="btn_yuyue" >
<ControlStyle CssClass="btn_yuyue"></ControlStyle>
                </asp:ButtonField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>
