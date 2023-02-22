<%@ Page Title="首页" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="PageOne.aspx.cs" Inherits="Hospital_Self_service_Machines.PageOne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
/*    .auto-style1 {
        height: 620px;
        width: 1435px;
        float:left;
    }*/
    .btnSize{
        height:200px;
        width:300px;
        border-radius:20px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="float:right">
        <tr>
            <td><asp:Button runat="server" ID="btn_Registered" Text="挂号" BackColor="#ffcc00" CssClass="btnSize" /></td>
            <td><asp:Button runat="server" ID="btn_BulidInfo" Text="建档" BackColor="#66ff66" CssClass="btnSize"/></td>
        </tr>
        <tr>
            <td><asp:Button runat="server" ID="btn_Payment" Text="缴费" BackColor="#66ffcc" CssClass="btnSize" /></td>
            <td><asp:Button runat="server" ID="btn_AppointmentRegistration" Text="预约挂号" BackColor="#3399ff" CssClass="btnSize"/></td>
        </tr>
        <tr>
            <td><asp:Button runat="server" ID="btn_TakeNumber" Text="取号" BackColor="#ff9933" CssClass="btnSize" /></td>
            <td><asp:Button runat="server" ID="btn_OtherFunction" Text="其它" BackColor="#00ff00" CssClass="btnSize"/></td>
        </tr>
    </table>
</asp:Content>
