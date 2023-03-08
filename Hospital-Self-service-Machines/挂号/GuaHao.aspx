<%@ Page Title="挂号" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="GuaHao.aspx.cs" Inherits="Hospital_Self_service_Machines.挂号.GuaHao" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ddl_keshi{
            border-color:darkturquoise;
        }
        .lb_guahao{
            background-color:rgba(192,192,192,0.5);
        }
        .btn_yuyue{
            text-decoration:none;
            background-color:red;
            color:white;
        }
        .gv_yuyue {
            text-align: center;
        }
    </style>
    <script src="../DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:10%;width:1200px;padding-top:40px;padding-left:20px">
        <asp:Label runat="server" ID="lbl_msg" ForeColor="Red" Text="***注意预约时间范围：当天7：00-21：00可预约，其余时间或其它日期不可预约；预约时间段只能在当前时间下一个时间段"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="lb_guahao" runat="server" Width="400px" Height="200px" SelectionMode="Single" CssClass="lb_guahao" AutoPostBack=true OnSelectedIndexChanged="lb_guahao_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td style="width:200px"></td>
                <td>
                    <asp:ListBox ID="lb_guahaoxiangxi" runat="server" Width="400px" Height="200px" CssClass="lb_guahao" AutoPostBack=true OnSelectedIndexChanged="lb_guahaoxiangxi_SelectedIndexChanged" ></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td rowspan="1" colspan="3">
                    <asp:GridView ID="gv_guahao" runat="server" Width="1000px" CssClass="gv_yuyue" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gv_guahao_RowCommand">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="科室大类"><ItemTemplate><asp:Label runat="server" ID="lbl_keshi" Text='<%# Bind("DepartmentName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                    <asp:TemplateField HeaderText="详细科室"><ItemTemplate><asp:Label runat="server" ID="lbl_xiangxikeshi" Text='<%# Bind("DepartmentDetailName") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                    <asp:TemplateField HeaderText="是否预约"><ItemTemplate><asp:Label runat="server" ID="lbl_shifouyuyue" Text='<%# Bind("IsRegisterd") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                    <asp:TemplateField HeaderText="确认预约日期"><ItemTemplate><asp:TextBox runat="server" class="Wdate" ID="d412" autocomplete="off" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd ',minDate:'%y-%M-%d',maxDate:'%y-%M-%d'})" placeholder="点击本框选择预约时间..."></asp:TextBox></ItemTemplate></asp:TemplateField>
                                    <asp:TemplateField HeaderText="确认时间段"><ItemTemplate><asp:DropDownList runat="server" ID="ddl_time" DataSource='<%# DropDownList_Time() %>' DataValueField="RegisterTime" DataTextField="RegisterTime" Width="150px" ></asp:DropDownList></ItemTemplate></asp:TemplateField>
                                    <asp:ButtonField HeaderText="请点击预约" Text="预约" CommandName="btn_yuyue" ControlStyle-CssClass="btn_yuyue" >
                        <ControlStyle CssClass="btn_yuyue"></ControlStyle>
                                    </asp:ButtonField>
                                </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="padding-top:20px;text-align:right">
                    <asp:Button runat="server" ID="btn_Back" Text="返回" Width="80" Height="40" OnClick="btn_Back_Click" />
                </td>
            </tr>
        </table>
        <br />
    </div>
    <asp:Label runat="server" ID="lbl"></asp:Label>
    <asp:Label runat="server" ID="Label1"></asp:Label>
</asp:Content>
