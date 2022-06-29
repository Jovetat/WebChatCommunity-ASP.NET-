<%@ Page Title="兜里注册用户" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="registerUserWebForm.aspx.cs" Inherits="DouLiForum.registerUserWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="98px" style="margin-left: 595px">
            <div>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Size="XX-Large" ForeColor="#373737" Text="欢迎注册兜里"></asp:Label>
            </div>
        </asp:Panel>
        <asp:Panel ID="registerPanel" runat="server" Height="229px" style="margin-left: 611px">
            
            <div style="height: 29px">
                <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="账号：" Font-Bold="True" ForeColor="#373737"></asp:Label>
            </div>
            <asp:TextBox ID="IDTextBox" runat="server" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="IDRequiredFieldValidator" runat="server" ControlToValidate="IDTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <asp:Label ID="IDreLabel" runat="server" ForeColor="Red" Text=" "></asp:Label>
            <div>
                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="密码：" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False" EnableTheming="True">*</asp:RequiredFieldValidator>
            <div>
                <asp:Label ID="Label4" runat="server" Font-Size="X-Large"  Text="再次输入密码:" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="passwordAgainTextBox" runat="server" TextMode="Password" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordAgainRequiredFieldValidator" runat="server" ControlToValidate="passwordAgainTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="passwordCompareValidator" runat="server" ControlToCompare="passwordTextBox" ControlToValidate="passwordAgainTextBox" ErrorMessage="CompareValidator" ForeColor="#FF8080" EnableClientScript="False">*密码错误</asp:CompareValidator>
            <div>
                <asp:Label ID="Label5" runat="server" Font-Size="X-Large"  Text="昵称:" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="nickNameTextBox" runat="server" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="nickNameRequiredFieldValidator" runat="server" ControlToValidate="nickNameTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
        </asp:Panel>
        <asp:Panel ID="submitPanel" runat="server" Height="67px" style="margin-left: 654px; margin-top: 46px;">
            <asp:Button ID="submitButton" runat="server" Text="提交" OnClick="submitButton_Click" BackColor="#333333" BorderColor="#333333" ForeColor="White" Height="43px" Width="98px" Font-Size="X-Large" style="margin-left: 16px" />
        </asp:Panel>
</asp:Content>
