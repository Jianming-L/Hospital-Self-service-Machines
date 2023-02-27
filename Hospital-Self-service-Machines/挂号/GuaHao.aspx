<%@ Page Title="挂号" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="GuaHao.aspx.cs" Inherits="Hospital_Self_service_Machines.挂号.GuaHao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ddl_keshi{
            border-color:darkturquoise;
        }
        .lb_guahao{
            background-color:rgba(255,255,255,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10%;width:900px;padding-top:40px;padding-left:30px">
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="lb_guahao" runat="server" Width="200px" Height="400px" CssClass="lb_guahao"></asp:ListBox>
                    <asp:DropDownList ID="ddl_guahao" runat="server" Width="200px" BackColor="transparent" CssClass="ddl_keshi" OnSelectedIndexChanged="ddl_guahao_SelectedIndexChanged"></asp:DropDownList>
                </td>
                <td style="width:20px"></td>
                <td>
                    <asp:DropDownList ID="ddl_guahaoxiangxi" runat="server" Width="200px" BackColor="transparent" CssClass="ddl_keshi"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
<%--        <asp:GridView ID="gv_guahao" runat="server" Width="700px">
        </asp:GridView>--%>
    </div>
</asp:Content>
