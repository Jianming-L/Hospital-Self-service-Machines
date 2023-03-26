<%@ Page Title="" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="TreatmentProcess.aspx.cs" Inherits="Hospital_Self_service_Machines.使用说明.TreatmentProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:450px;padding-top:10px">
        <h1 style="font-family:华文行楷">--->>>就诊流程<<<---</h1>
    </div>
    <div>
        <img src="../image/就诊流程.png" style="margin-left:200px;border-radius:10%" width="1000" height="400" />
    </div>
    <div style="margin-left:900px">
        <asp:Button runat="server" ID="btn_back" Text="返回" Width="80px" Height="40px" OnClick="btn_back_Click" />
    </div>
</asp:Content>
