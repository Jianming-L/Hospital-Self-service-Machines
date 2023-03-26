<%@ Page Title="完成" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="DocumentationFour.aspx.cs" Inherits="Hospital_Self_service_Machines.建档.DocumentationFour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:10px;padding-top:10px;">
        <table>
            <tr>
                <td>
                    <span style="background-color:white">>>>输入个人信息</span>
                </td>
                <td>
                    <span style="background-color:white">>>>确认信息</span>
                </td>
                <td>
                    <span style="background-color:white">>>>正在建档中</span>
                </td>
                <td>
                    <span style="background-color:aqua;font-size:30px">>>>完成</span>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style="margin-left:45%;margin-top:8%">
        <asp:Button runat="server" ID="btn_back" Width="80" Height="40" Text="完成" OnClick="btn_back_Click" />
    </div>
</asp:Content>
