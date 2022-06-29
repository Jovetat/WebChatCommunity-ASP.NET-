<%@ Page Title="用户主页" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="userHomePageWebForm.aspx.cs" Inherits="DouLiForum.userHomePageWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="personalHomePanel" runat="server" Visible="False">
        <asp:Panel ID="personalPanel" runat="server">
            <br />
        <br />
        <asp:Image ID="Image1" runat="server" style="margin-left:570px" Height="146px" ImageUrl="~/Image/熊二.png" Width="163px" />
        <br />
        <br />
        <asp:Label ID="userNicknameLabel" style="margin-left:610px"  runat="server" Text="未登录" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="attentionNumButton" style="margin-left:550px" runat="server" Text="gan" Font-Bold="True" Font-Size="Large" BackColor="White" BorderColor="White" BorderStyle="None" Height="40px" Width="60px" />
        <asp:Button ID="fansNumButton" style="margin-left:30px; margin-bottom: 0px;" runat="server" Text="ba" Font-Bold="True" Font-Size="Large" BackColor="White" BorderColor="White" BorderStyle="None" Height="40px" Width="60px" />
        <asp:Button ID="microblogNumButton" style="margin-left:30px" runat="server" Text="de" Font-Bold="True" Font-Size="Large" BackColor="White" BorderColor="White" BorderStyle="None" Height="40px" Width="60px" />
            <br />
            <asp:Label ID="Label2" style="margin-left:560px" runat="server" Text="关注" Font-Bold="True" ForeColor="#333333" Height="30px" Width="40px"></asp:Label>
            <asp:Label ID="Label3" style="margin-left:55px" runat="server" Text="粉丝" Font-Bold="True" ForeColor="#333333" Height="30px" Width="40px"></asp:Label>
            <asp:Label ID="Label4" style="margin-left:55px" runat="server" Text="微博" Font-Bold="True" ForeColor="#333333" Height="30px" Width="40px"></asp:Label>
            
        </asp:Panel>
        <asp:UpdatePanel ID="homePagepdatePanel" runat="server"></asp:UpdatePanel>
        <asp:Panel ID="creatPanel" runat="server" Visible="False">
            <br />
            <br />
            <asp:Image ID="Image2" style="margin-left:200px" runat="server" Height="50px" ImageUrl="~/Image/写.png" Width="50px" />
            <br />
            <asp:TextBox ID="postContentTextBox" style="margin-left:200px" runat="server" Font-Size="Large" Height="85px" MaxLength="100" Width="859px"></asp:TextBox>
            <br />
            <asp:Button ID="releaseButton" style="margin-left:1000px" runat="server" Text="发布" BackColor="#333333" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="40px" OnClick="releaseButton_Click" Width="60px" />
        </asp:Panel>
        <asp:UpdatePanel ID="UpdatePanel1" style="margin-left:150px" runat="server">

            <ContentTemplate>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:PlaceHolder ID="postPlaceHolder" runat="server"></asp:PlaceHolder>
            </ContentTemplate>

        </asp:UpdatePanel>

    </asp:Panel>
</asp:Content>
