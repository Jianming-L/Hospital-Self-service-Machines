<%@ Page Title="输入个人信息" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="DocumentationOne.aspx.cs" Inherits="Hospital_Self_service_Machines.建档.DocumentationOne" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .div_intoinformation{
            position:absolute;
            margin-left:10%;
            margin-top:5%;
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
                    <span style="background-color:white">>>>正在建档中</span>
                </td>
                <td>
                    <span style="background-color:white">>>>完成</span>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="div_intoinformation">
        <table>
            <tr>
                <td>姓名：</td><td><asp:Label runat="server" ID="lbl_name" Width="150" ></asp:Label></td>
                <td>性别：</td><td style="Width:150px"><asp:RadioButton runat="server" ID="rdb_gender_man" Text="男" GroupName="sex"/><asp:RadioButton runat="server" ID="rdb_gender_woman" Text="女" GroupName="sex"/></td>
                <td>出生日期：</td><td><asp:TextBox runat="server" class="Wdate" ID="d412" autocomplete="off" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy年MM月dd日 '})" placeholder="点击本框选择出生年月..."></asp:TextBox></td>
                <td>国籍：</td><td style="Width:150px"><asp:DropDownList runat="server" ID="ddl_nation" Width="150px" AutoPostBack=true OnSelectedIndexChanged="ddl_nation_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
            <tr style="height:20px"></tr>
            <tr>
                <td>出生地：</td><td><asp:DropDownList runat="server" ID="ddl_sheng" Width="150" AutoPostBack=true OnSelectedIndexChanged="ddl_sheng_SelectedIndexChanged">
                </asp:DropDownList></td>
                <td>省(区、市)</td>
                <td><asp:DropDownList runat="server" ID="ddl_shi" Width="150" AutoPostBack=true OnSelectedIndexChanged="ddl_shi_SelectedIndexChanged"></asp:DropDownList></td>
                <td>市</td><td><asp:DropDownList runat="server" ID="ddl_xian" Width="180" AutoPostBack=true></asp:DropDownList>县</td>
                <td>民族：</td><td><asp:DropDownList runat="server" ID="ddl_minzu" Width="150" AutoPostBack=true OnSelectedIndexChanged="ddl_minzu_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
        </table>
    </div>
    <div style="margin-left:50%;margin-top:20%">
        <asp:Button runat="server" ID="btn_submit" Width="80" Height="40" Text="下一步" OnClick="btn_submit_Click" />
        <asp:Button runat="server" ID="btn_back" Width="80" Height="40" Text="返回" OnClick="btn_back_Click" />
    </div>
<%--    <asp:Label runat="server" ID="lbl_msg"></asp:Label>
    <asp:Label runat="server" ID="lbl_msd"></asp:Label>--%>
</asp:Content>
