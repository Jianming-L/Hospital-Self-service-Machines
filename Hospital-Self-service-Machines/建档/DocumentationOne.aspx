<%@ Page Title="输入个人信息" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="DocumentationOne.aspx.cs" Inherits="Hospital_Self_service_Machines.建档.DocumentationOne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .div_intoinformation{
            position:absolute;
            margin-left:45%;
            margin-top:5%;
            background-color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:10px;padding-top:10px;">
        <table>
            <tr>
                <td>
                    <span style="background-color:aqua;font-size:30px">>>>输入个人信息</span>
                </td>
                <td>
                    <span style="background-color:white">>>>确认信息</span>
                </td>
                <td>
                    <span style="background-color:white">>>>正在建档</span>
                </td>
                <td>
                    <span style="background-color:white">>>>完成</span>
                </td>
            </tr>
        </table>
    </div>
    <div class="div_intoinformation">
        <p>输入您的个人信息</p>

    </div>
</asp:Content>
