<%@ Page Title="挂号" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="GuaHao.aspx.cs" Inherits="Hospital_Self_service_Machines.挂号.GuaHao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ddl_keshi{
            border-color:darkturquoise;
        }
        .lb_guahao{
            background-color:rgba(192,192,192,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10%;width:900px;padding-top:40px;padding-left:60px">
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="lb_guahao" runat="server" Width="400px" Height="200px" SelectionMode="Single" CssClass="lb_guahao" OnSelectedIndexChanged="lb_guahao_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td style="width:50px"></td>
                <td>
                    <asp:ListBox ID="lb_guahaoxiangxi" runat="server" Width="400px" Height="200px" CssClass="lb_guahao"></asp:ListBox>
                </td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
<%--        <asp:GridView ID="gv_guahao" runat="server" Width="700px">
        </asp:GridView>--%>
    </div>
</asp:Content>
