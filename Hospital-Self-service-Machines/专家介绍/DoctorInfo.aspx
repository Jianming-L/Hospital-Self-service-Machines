<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorInfo.aspx.cs" Inherits="Hospital_Self_service_Machines.其它.DoctorInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .a_close{
            text-decoration:none;
            width:80px;
            height:50px;
            color:black;
            border:solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:200px;padding-top:10px">
            <h2><asp:Label runat="server" ID="lbl_name"></asp:Label></h2>
        </div>
        <div style="margin-left:200px;">
            <asp:Label runat="server" ID="lbl_doctorinfo"></asp:Label>
        </div>
        <div style="margin-left:600px;padding-top:100px">
            <a href="javascript:window.opener=null;window.open('','_self');window.close();" class="a_close">关闭</a>
        </div>
    </form>
</body>
</html>
