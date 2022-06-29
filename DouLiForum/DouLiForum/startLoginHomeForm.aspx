<%@ Page Title="兜里登录页面" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="startLoginHomeForm.aspx.cs" Inherits="DouLiForum.startLoginHomeForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="98px" style="margin-left: 595px">
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Size="XX-Large" ForeColor="#373737" Text="欢迎登录兜里"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="dengluPanel" runat="server" Height="123px" style="margin-left: 611px">
            
            <div style="height: 29px">
                <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="账号：" Font-Bold="True" ForeColor="#373737"></asp:Label>
            </div>
            <asp:TextBox ID="userIDTextBox" runat="server" Height="20px" Width="280px"></asp:TextBox>
            <div>
                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="密码：" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="userPasswordTextBox" runat="server" TextMode="Password" Height="20px" Width="280px"></asp:TextBox>
            <asp:Label ID="userPasswordLabel" runat="server" ForeColor="Red" Text=" "></asp:Label>
        </asp:Panel>
        <asp:Panel ID="submitPanel" runat="server" Height="67px" style="margin-left: 654px; margin-top: 46px;">
            <asp:Button ID="submitButton" runat="server" Text="提交" OnClick="submitButton_Click" BackColor="#333333" BorderColor="#333333" ForeColor="White" Height="43px" Width="100px" Font-Size="X-Large" style="margin-left: 16px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" BackColor="#333333" Font-Size="Medium" ForeColor="White" Height="43px" OnClick="adminSubmitButton_Click" Text="管理员登录" Width="100px" />
        </asp:Panel>
</asp:Content>
