<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Load.aspx.cs" Inherits="Hospital_Self_service_Machines.个人中心.Load1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../CSS样式/CSS.css" rel="stylesheet" />
    <link href="../CSS样式/virtualkeyboard.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.3.min.js"></script>
    <script src="../JS文件/virtualkeyboard.js"></script>
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="div_Load">
                <h2 style="margin-left:200px">登录</h2>
                <table style="margin:40px">
                    <tr style="text-align:right">
                        <td style="width:100px">
                            账号:
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txb_UserNo" autocomplete="off" ></asp:TextBox>
                        </td>
                        <td style="text-align:left">
                            <asp:RequiredFieldValidator ID="rfvNo" runat="server" ErrorMessage="*" ControlToValidate="txb_UserNo" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="text-align:right">
                        <td>
                            密码:
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txb_Password" autocomplete="off" ></asp:TextBox>
                        </td>
                        <td style="text-align:left">
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*" ControlToValidate="txb_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td><asp:Label runat="server" ID="lbl_msg"></asp:Label></td></tr>
                    <tr><td style="height:30px"></td></tr>
                    <tr>
                        <td></td>
                        <td style="margin-left:290px">
                            <asp:Button runat="server" ID="btn_SignUp" Text="登录" OnClick="btn_SignUp_Click" Width="80px" Height="40px" />
                        </td>
                    </tr>
                </table>
            </div>
            <script type="text/javascript">
                $("#txb_UserNo").virtualkeyboard();
                $("#txb_Password").virtualkeyboard();
            </script>
    </form>
</body>
</html>
