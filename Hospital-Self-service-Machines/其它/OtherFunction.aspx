<%@ Page Title="" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="OtherFunction.aspx.cs" Inherits="Hospital_Self_service_Machines.其它.OtherFunction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a>按科室名称查找，按专家名字查找</a>
    <a>SELECT *
FROM tb_DoctorInfo AS DI
LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentDetailNo=DI.DepartmentDetailNo
WHERE DD.DepartmentDetailNo<>0</a>
</asp:Content>
