<%@ Page Title="兜里修改密码" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="changeUserPwWebForm.aspx.cs" Inherits="DouLiForum.changeUserPwWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="IDPanel" style="margin-left:300px" runat="server">
        
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Panel ID="registerPanel" runat="server" Height="350px" style="margin-left: 300px">
            
            <div style="height: 29px">
                <br />
                <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="账号：" Font-Bold="True" ForeColor="#373737"></asp:Label>
            </div>
            <br />
            <asp:TextBox ID="IDTextBox" runat="server" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="IDRequiredFieldValidator" runat="server" ControlToValidate="IDTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="#333333" Text="原密码：" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
            <asp:TextBox ID="oldPasswordTextBox" runat="server" Height="20px" TextMode="Password" Width="280px"></asp:TextBox>
            <asp:Label ID="IDreLabel" runat="server" ForeColor="Red" Text=" "></asp:Label>
            <asp:RequiredFieldValidator ID="oldPWRequiredFieldValidator0" runat="server" ControlToValidate="oldPasswordTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <div>
                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="新的密码：" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="newPasswordTextBox" runat="server" TextMode="Password" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ControlToValidate="newPasswordTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <div>
                <asp:Label ID="Label4" runat="server" Font-Size="X-Large"  Text="再次输入密码:" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="newPasswordAgainTextBox" runat="server" TextMode="Password" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="passwordAgainRequiredFieldValidator" runat="server" ControlToValidate="newPasswordTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="passwordCompareValidator" runat="server" ControlToCompare="newPasswordTextBox" ControlToValidate="newPasswordAgainTextBox" ErrorMessage="CompareValidator" ForeColor="#FF8080" EnableClientScript="False">*密码错误</asp:CompareValidator>
            <div>
                <asp:Label ID="Label5" runat="server" Font-Size="X-Large"  Text="新的昵称:" Font-Bold="True" ForeColor="#333333"></asp:Label>
            </div>
            <asp:TextBox ID="nickNameTextBox" runat="server" Height="20px" Width="280px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="nickNameRequiredFieldValidator" runat="server" ControlToValidate="nickNameTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080" EnableClientScript="False">*</asp:RequiredFieldValidator>
            <br />
       <asp:DropDownList ID="IDDropDownList" runat="server" AutoPostBack="True" BackColor="#333333" Font-Size="X-Large" ForeColor="White" Height="28px" Width="102px">
            <asp:ListItem>用户</asp:ListItem>
            <asp:ListItem>管理员</asp:ListItem>
        </asp:DropDownList>
            </asp:Panel>
        <asp:Panel ID="submitPanel" runat="server" Height="94px" style="margin-left: 300px; margin-top: 46px;">
            <asp:Button ID="submitButton" runat="server" Text="提交" OnClick="submitButton_Click" BackColor="#333333" BorderColor="#333333" ForeColor="White" Height="43px" Width="98px" Font-Size="X-Large" style="margin-left: 16px" />
            <br />
            <br />
            <asp:PlaceHolder ID="resultPlaceHolder" runat="server"></asp:PlaceHolder>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="changePWPanel" style="margin-left:300px" runat="server">
    </asp:Panel>
</asp:Content>
