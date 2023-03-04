<%@ Page Title="查询科室" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="FindDepartment.aspx.cs" Inherits="Hospital_Self_service_Machines.查询科室.FindDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .finddepartment{
            Width:400px;
            Height:200px;
            background-color:rgba(192,192,192,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10%;padding-top:30px">
        <table>
            <tr>
                <td>
                    <asp:ListBox runat="server" ID="lb_keshidalei" CssClass="finddepartment"></asp:ListBox>
                </td>
                <td style="width:50px"></td>
                <td>
                    <asp:ListBox runat="server" ID="lb_xiangxikeshi" CssClass="finddepartment"></asp:ListBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" Width="1000px"></asp:GridView>
    </div>
</asp:Content>
