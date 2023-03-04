<%@ Page Title="首页" Language="C#" MasterPageFile="~/母版页/PageSite.Master" AutoEventWireup="true" CodeBehind="PageOne.aspx.cs" Inherits="Hospital_Self_service_Machines.PageOne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
/*        .btnSize {
            height: 200px;
            width: 300px;
            border-radius: 20px;
        }*/
        .div_backgroud {
            background: url(image/Doctor.png) no-repeat;
            background-size: cover;
            background-attachment: fixed;
            width: 100%;
            height: 100%;
        }
        .div_backgroud img {
            object-fit: cover;
            height: 200%;
            width: 100%;
        }
        .div_guide {
            float:left;
            margin-top: 550px;
        }
        .a_guide {
            margin-left: 10px;
        }
        .a_FindGuide {
            margin-left: 200px;
            font-size: 22px;
            font-weight: 400;
        }
/*        span{
            float:left;
            text-align:center;
            display:block
        }*/
        .zitistyle {
            display:block;
            color:deepskyblue; 
            font-size: 30px; 
            font-weight: bolder; 
/*            -webkit-animation: flicker 1s infinite; */
        }
/*        @-webkit-keyframes flicker { 
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
            100% {
                opacity: 1;
            }
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_backgroud">
        <div class="div_guide"><a class="a_guide">在使用该服务机前，请先看使用说明详细内容确保你能顺利使用该服务机</a>
            <br /><a href="使用说明/InstructionManual.aspx" class="a_FindGuide">点击该处查看详细使用说明</a>
        </div>
        <table style="float:left;margin-top:4px;margin-left:100px;" class="table_button">
            <tr>
                <td class="auto-style1"><asp:Button runat="server" ID="btn_Registered" Text="" BackColor="transparent" CssClass="btnSize_guahao" OnClick="btn_Registered_Click"/><br /><span class="zitistyle">挂号</span></td>
                <td class="auto-style2"></td>
                <td class="auto-style1"><asp:Button runat="server" ID="btn_BulidInfo" Text="" BackColor="transparent" CssClass="btnSize_jiandang"/><vr></vr><span class="zitistyle">建档</span></td>
                <td class="auto-style2"></td>
                <td class="auto-style1"><asp:Button runat="server" ID="btn_Payment" Text="" BackColor="transparent" CssClass="btnSize_jiaofei" /><br /><span class="zitistyle">缴费</span></td>
            </tr>
            <tr><td style="height:40px"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><asp:Button runat="server" ID="btn_FindDepartment" Text="" BackColor="transparent" CssClass="btnSize_findkeshi" OnClick="btn_FindDepartment_Click"/><span class="zitistyle">查询科室</span></td>
                <td ></td>
                <td><asp:Button runat="server" ID="btn_TakeNumber" Text="" BackColor="transparent" CssClass="btnSize_quhao" /><span class="zitistyle">取号</span></td>
                <td></td>
                <td><asp:Button runat="server" ID="btn_OtherFunction" Text="" BackColor="transparent" CssClass="btnSize_qita"/><span class="zitistyle">其它</span></td>
            </tr>
        </table>
    </div>
</asp:Content>
