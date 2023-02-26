<%@ Page Title="挂号" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="GuaHao.aspx.cs" Inherits="Hospital_Self_service_Machines.挂号.GuaHao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ddl_keshi{
            border-color:darkturquoise;
            float:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10%;width:900px;padding-top:40px">
        <asp:DropDownList ID="ddl_guahao" runat="server" Width="200px" BackColor="transparent" CssClass="ddl_keshi"></asp:DropDownList><br />
        <asp:GridView ID="gv_guahao" runat="server" Width="700px">
        </asp:GridView>
    </div>
</asp:Content>
