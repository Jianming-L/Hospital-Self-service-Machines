<%@ Page Title="注册" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hospital_Self_service_Machines.个人中心.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS样式/CSS.css" rel="stylesheet" />
    <style type="text/css">
        .cuw_Register {
            position:absolute;
            top:53%;
            margin-top:-200px;
            left:58%;
            margin-left:-325px;
            background-color:whitesmoke;
            width:400px;
            height:350px;
            border-radius:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:CreateUserWizard ID="cuw_Register" runat="server" CssClass="cuw_Register" autocomplete="off" OnCreatedUser="cuw_Register_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>

</asp:Content>
