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
    .div_backgroud{
        background:url(image/Doctor.png) no-repeat;
        position:fixed;
        width:99%;
        height:100%;
    }
    .div_backgroud img{
        object-fit:cover;
        height:200%;
        width:100%;
    }
    .div_guide{
        float:left;
        margin-top:550px;
    }
        .a_guide{
            margin-left:10px;
        }
            .a_FindGuide{
                margin-left:200px;
                font-size:22px;
                font-weight:400;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_backgroud">
        <div class="div_guide"><a class="a_guide">在使用该服务机前，请先看使用说明详细内容确保你能顺利使用该服务机</a>
            <br /><a class="a_FindGuide">点击该处文字查看使用说明</a>
        </div>
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
               <td><asp:Button runat="server" ID="btn_TakeNumber" Text="取号" BackColor="#ff9933" CssClass="btnSize" />
               </td>
               <td><asp:Button runat="server" ID="btn_OtherFunction" Text="其它" BackColor="#00ff00" CssClass="btnSize"/></td>
            </tr>
        </table>
    </div>
</asp:Content>
