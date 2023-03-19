﻿<%@ Page Title="输入个人信息" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="DocumentationOne.aspx.cs" Inherits="Hospital_Self_service_Machines.建档.DocumentationOne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .div_intoinformation{
            position:absolute;
            margin-left:3%;
            margin-top:2%;
            background-color:rgba(255,255,255,0.5);
        }
    </style>
    <script src="../DatePicker/WdatePicker.js"></script>
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
        <table>
            <tr>
                <td>姓名：</td><td style="Width:150px"><asp:Label runat="server" ID="lbl_name" ></asp:Label></td>
                <td>性别：</td><td style="Width:150px"><asp:RadioButton runat="server" ID="rdb_gender_man" Text="男" GroupName="sex"/><asp:RadioButton runat="server" ID="rdb_gender_woman" Text="女" GroupName="sex"/></td>
                <td>出生日期：</td><td style="Width:250px"><asp:TextBox runat="server" class="Wdate" ID="d412" autocomplete="off" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy年MM月dd日 '})" placeholder="点击本框选择出生年月..."></asp:TextBox></td>
                <td>年龄：</td><td><asp:Label runat="server" ID="lbl_age"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
