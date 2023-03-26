<%@ Page Title="正在建档中" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="DocumentationThree.aspx.cs" Inherits="Hospital_Self_service_Machines.建档.DocumentationThree" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS样式/loading.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:10px;padding-top:10px;">
        <table>
            <tr>
                <td>
                    <span style="background-color:white">>>>输入个人信息</span>
                </td>
                <td>
                    <span style="background-color:white">>>>确认信息</span>
                </td>
                <td>
                    <span style="background-color:aqua;font-size:30px">>>>正在建档中</span>
                </td>
                <td>
                    <span style="background-color:white">>>>完成</span>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <p style="text-align:center;font-size:40px;font-family:Architects Daughter,cursive;">正在建档中</p>
    <div class="grid">
        <div class="loader" >
            <div id="ld4">
                <div>
                </div>
                <div>
                </div>
                <div>
                </div>
                <div>
                </div>
             </div>
         </div>
    </div>
    <script type="text/javascript">
        var i = 5;
        // 获取登录事件，并处理自动跳转
        window.onload = function JumpPage() {
/*            document.getElementById("time").innerText = i;*/
            // 计时为0后，立即跳转
            i--;
            if (i < 0) {
                location.replace("DocumentationFour.aspx");
            }
            setTimeout(JumpPage, 1000);
        }
    </script>
</asp:Content>
