<%@ Page Title="登录" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="Load.aspx.cs" Inherits="Hospital_Self_service_Machines.个人中心.Load" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS样式/CSS.css" rel="stylesheet" />
    <style type="text/css">
        .div_Load {
            position:absolute;
            top:53%;
            margin-top:-200px;
            left:58%;
            margin-left:-325px;
            background-color:whitesmoke;
            width:450px;
            height:350px;
            border-radius:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_Load">
        <h2 style="margin-left:180px">登录</h2>
        <table autocomplete="off">
            <tr style="text-align:right">
                <td style="width:100px">
                    账号:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txt_UserNo" autocomplete="off"></asp:TextBox>
                </td>
                <td style="text-align:left">
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txt_UserNo" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="text-align:right">
                <td>
                    密码:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txt_Password" autocomplete="off"></asp:TextBox>
                </td>
                <td style="text-align:left">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*" ControlToValidate="txt_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td><asp:Label runat="server" ID="lbl_msg"></asp:Label></td></tr>
            <tr>
                <td></td>
                <td style="text-align:center">
                    <asp:Button runat="server" ID="btn_SignUp" Text="登录" OnClick="btn_SignUp_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
