<%@ Page Title="缴费" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="PayMoney.aspx.cs" Inherits="Hospital_Self_service_Machines.缴费.PayMoney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn_yaopinback{
            margin-left:1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:1%;">
       <h1 style="text-align:center;font-family:华文行楷;color:crimson">--->缴费单<---</h1>
    </div>
    <div style="margin-left:350px;">
        缴费基本信息
        <table style="text-align:center;background-color:rgb(255,255,255,0.8);">
            <tr>
                <td>
                    <asp:GridView runat="server" ID="gv_PayMoney" Width="800px" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="收费项目名称"><ItemTemplate><asp:Label runat="server" ID="lbl_name" Text='<%# Bind("PayItemName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="价格"><ItemTemplate><asp:Label runat="server" ID="lbl_price" Text='<%# Bind("Price") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label runat="server" ID="lbl_null"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align:left"><asp:Label runat="server" ID="lbl_SumPrice"></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Button runat="server" ID="btn_Pay" Text="确定缴费" OnClick="btn_Pay_Click" />
                </td>
            </tr>
        </table>
        <p style="color:red;background-color:rgb(255,255,255,0.8);width:600px">对账单有疑问或乱开药方，请联系卫生行政部门电话12320投诉</p>
    </div>
    <asp:Button runat="server" ID="btn_back" Text="返回" Width="80px" Height="40px" OnClick="btn_back_Click" CssClass="btn_yaopinback" />
</asp:Content>
