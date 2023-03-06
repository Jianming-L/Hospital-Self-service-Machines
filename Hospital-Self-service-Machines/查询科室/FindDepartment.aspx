<%@ Page Title="查询科室" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="FindDepartment.aspx.cs" Inherits="Hospital_Self_service_Machines.查询科室.FindDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .finddepartment{
            Width:400px;
            Height:200px;
            background-color:rgba(192,192,192,0.5);
        }
        .gv_finddepartment{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:3%;padding-top:30px">
        <table>
            <tr>
                <td>
                    <asp:ListBox runat="server" ID="lb_keshidalei" Height="500px" AutoPostBack="true" CssClass="finddepartment" OnSelectedIndexChanged="lb_keshidalei_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td style="width:100px"></td>
                <td>
                    <%--<asp:ListBox runat="server" ID="lb_xiangxikeshi" AutoPostBack="true" CssClass="finddepartment" OnSelectedIndexChanged="lb_xiangxikeshi_SelectedIndexChanged"></asp:ListBox>--%>
                    <asp:GridView runat="server" ID="gv_FindDepartment" CssClass="gv_finddepartment" Width="900px"></asp:GridView>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <asp:Label runat="server" ID="lbl_msg"></asp:Label>
</asp:Content>
