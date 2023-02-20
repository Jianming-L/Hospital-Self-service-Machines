<%@ Page Title="注册" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hospital_Self_service_Machines.个人中心.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS样式/CSS.css" rel="stylesheet" />
    <style type="text/css">
        .div_Register {
            position:absolute;
            top:53%;
            margin-top:-200px;
            left:58%;
            margin-left:-325px;
            background-color:whitesmoke;
            width:350px;
            height:350px;
            border-radius:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_Register">
        <h2 style="margin-left:100px">注册新用户</h2>
        <table>
            <tr style="text-align:right">
                <td>
                    用户名:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txt_UserName"></asp:TextBox>
                </td>
                <td>

                </td>
            </tr>
            <tr style="text-align:right">
                <td>
                    密码:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txt_Password"></asp:TextBox>
                </td>
                <td>

                </td>
            </tr>
            <tr style="text-align:right">
                <td>
                    确认新密码:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txt_ConfirmPassword"></asp:TextBox>
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lbl_msg" Text="*" ForeColor="Red" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Button runat="server" ID="btn_SignUp" Text="确认注册" OnClick="btn_SignUp_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
