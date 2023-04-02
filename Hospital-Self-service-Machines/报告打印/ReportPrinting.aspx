<%@ Page Title="报告打印" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="ReportPrinting.aspx.cs" Inherits="Hospital_Self_service_Machines.报告打印.ReportPrinting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:1%;">
       <h1 style="text-align:center;font-family:华文行楷;color:crimson">西虹市第一医院检验报告单</h1>
    </div>
    <div style="margin-left:420px">
<%--    cellpadding 是边框与其内容的间隙大小；
        cellspacing 是边框与边框之间的间隙大小--%>
        <table border="1" cellspacing="0" style="background-color:rgb(255,255,255,0.8)">
            <tr>
                <td colspan="4">NO：<asp:Label runat="server" ID="lbl_No" Width="100px"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    姓名：<asp:Label runat="server" ID="lbl_name" Width="100px"></asp:Label>
                </td>
                <td>
                    性别：<asp:Label runat="server" ID="lbl_gender" Width="100px"></asp:Label>
                </td>
                <td>
                    年龄：<asp:Label runat="server" ID="lbl_age" Width="100px"></asp:Label>
                </td>
                <td>
                    科室：<asp:Label runat="server" ID="lbl_department" Width="100px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    备注：<asp:Label runat="server" ID="lbl_beizhu"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    临床诊断：<asp:Label runat="server" ID="lbl_linchuanzhenduan"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="font-family:华文行楷;font-size:30px;text-align:center;height:30px">
                    --->检验详细报告<---
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center">
                    <asp:GridView runat="server" ID="gv_baogaotable" Width="750px" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="NO"><ItemTemplate><asp:Label runat="server" ID="lbl_no" Text='<%# Bind("ItemNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="项目"><ItemTemplate><asp:Label runat="server" ID="lbl_item" Text='<%# Bind("ItemName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="结果"><ItemTemplate><asp:Label runat="server" ID="lbl_result" Text='<%# Bind("ResultScore") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="参考值"><ItemTemplate><asp:Label runat="server" ID="lbl_cankaozhi" Text='<%# Bind("ReferenceValue") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="单位"><ItemTemplate><asp:Label runat="server" ID="lbl_unit" Text='<%# Bind("Unit") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label runat="server" ID="lbl_null"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label runat="server" Text="检测时间："></asp:Label>
                    <asp:Label runat="server" ID="lbl_jianceshijian"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:Label runat="server" Text="检测医生："></asp:Label>
                    <asp:Label runat="server" ID="lbl_jianceyisheng"></asp:Label>
                </td>
            </tr>
        </table>
        <div style="text-align:center">
            <asp:Button runat="server" ID="btn_printing" Text="打印" />
            <asp:Button runat="server" ID="btn_back" Text="返回" OnClick="btn_back_Click" />
        </div>
    </div>
</asp:Content>
