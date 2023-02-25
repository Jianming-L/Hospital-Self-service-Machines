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
        .zitistyle {
            vertical-align:text-top;text-align:center;
            color:brown; 
            font-size: 30px; 
            font-weight: bolder; 
            -webkit-animation: flicker 1s infinite; 
        }
        @-webkit-keyframes flicker { 
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_backgroud">
        <div class="div_guide"><a class="a_guide">在使用该服务机前，请先看使用说明详细内容确保你能顺利使用该服务机</a>
            <br /><a href="个人中心/InstructionManual.aspx" class="a_FindGuide">点击该处查看详细使用说明</a>
        </div>
        <table style="float:left;margin-top:4px" class="table_button">
            <tr>
                <td><asp:Button runat="server" ID="btn_Registered" Text="" BackColor="#ffcc00" CssClass="btnSize_guahao"/><br /><a  class="zitistyle">挂号</a></td>
                <td style="width:50px"></td>
                <td><asp:Button runat="server" ID="btn_BulidInfo" Text="" BackColor="#66ff66" CssClass="btnSize_jiandang"/></td>
                <td style="width:50px"></td>
                <td><asp:Button runat="server" ID="btn_Payment" Text="" BackColor="#66ffcc" CssClass="btnSize_jiaofei" /></td>
            </tr>
            <tr><td style="height:70px;vertical-align:text-top;text-align:center;" class="zitistyle"></td>
                <td></td>
                <td style="vertical-align:text-top;text-align:center;">建档</td>
                <td></td>
                <td style="vertical-align:text-top;text-align:center;">缴费</td>
            </tr>
            <tr>
                <td><asp:Button runat="server" ID="btn_AppointmentRegistration" Text="" BackColor="#3399ff" CssClass="btnSize_yuyueguahao"/></td>
                <td ></td>
                <td><asp:Button runat="server" ID="btn_TakeNumber" Text="" BackColor="#ff9933" CssClass="btnSize_quhao" /></td>
                <td></td>
                <td><asp:Button runat="server" ID="btn_OtherFunction" Text="" BackColor="#00ff00" CssClass="btnSize_qita"/></td>
            </tr>
        </table>
    </div>
</asp:Content>
