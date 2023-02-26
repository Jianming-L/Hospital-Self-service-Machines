<%@ Page Title="使用说明书" Language="C#" MasterPageFile="~/母版页/FunctionSite.Master" AutoEventWireup="true" CodeBehind="InstructionManual.aspx.cs" Inherits="Hospital_Self_service_Machines.个人中心.InstructionManual" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS样式/CSS.css" rel="stylesheet" />
    <style type="text/css">
        .div_IM {
            background-color:rgba(255,255,255,0.5);
            padding-left:20px;
            padding-bottom:20px;
        }
        .btn_Back_Page{
            margin-left:800px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:19%;width:900px" class="div_IM">
        <h2 style="text-align:center;margin-top:0px"><b>使用自助服务机注意事项</b></h2>
        <h4><b>一、挂号流程：</b></h4>
        <p>1、先登录您的账号，在首页点击挂号</p>
        <p>2、选择您所需的科室</p>
        <p>3、挂号成功</p>
        <h4>二、入院流程</h4>
        <p>1，先挂号找医生看病，确诊是什么病。<br />
           2，医生说给住院，医生写一张住院通知单，<br />
           3，拿这张单去医院收费窗口，填写住院身份证材料，交住院抵押金。<br />
           4，拿着押金收据上指定的住院部病房找护士长。<br />
           5，护士找病房和床位。<br />
           6，住院。<br />
           7，交费算帐出院。</p>
        <h4><b>三、自助机功能介绍：</b></h4>
        <p>当日挂号、办理就诊卡、化验单打印、项目查询、药品查询、缴费、收费明细查询等。</p>
        <h4>四、打印发票：</h4>
        <p>全部诊疗过程结束后，需要发票的病人可以到自助服务机打印发票。<br />注意发票只打印一次，医保卡交费的没有发票</p>
        <br />
        <asp:Button runat="server" ID="btn_Back" Text="返回" CssClass="btn_Back_Page" OnClick="btn_Back_Click"/>
    </div>
</asp:Content>
