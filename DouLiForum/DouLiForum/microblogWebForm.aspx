<%@ Page Title="兜里首页" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="microblogWebForm.aspx.cs" Inherits="DouLiForum.microblogWebForm" %>
<%@ Register src="postWebUserControl.ascx" tagname="postWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Panel ID="postPanel" runat="server">
         <asp:UpdatePanel ID="postUpdatePanel" style="margin-left:100px" runat="server">
                <ContentTemplate>
                    <br />
                    <br />
                    <br />
                    <asp:Panel ID="searchPanel" runat="server">
                        <asp:TextBox ID="searchTextBox" runat="server" style="margin-left:20px" Height="27px" Width="717px"></asp:TextBox>
                        <asp:ImageButton ID="searchImageButton" runat="server" style="margin-left:30px" Height="30px" ImageUrl="~/Image/搜索 (3).png" OnClick="searchImageButton_Click" />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:ImageButton ID="entireImageButton" style="margin-left:20px" runat="server" Height="35px" ImageUrl="~/Image/全部.png" OnClick="entireImageButton_Click" />
                    <asp:ImageButton ID="myAttentionImageButton" runat="server" style="margin-left:40px" Height="35px" ImageUrl="~/Image/我的关注3.png" OnClick="myAttentionImageButton_Click" />
                    <br />
                    <asp:Label ID="entireLabel" runat="server" style="margin-left:20px" Font-Bold="True" ForeColor="#2f4f4f" Text="全部"></asp:Label>
                    <asp:Label ID="myattentionLabel" runat="server" style="margin-left:28px" Text="我的关注" Font-Bold="True" ForeColor="#2f4f4f"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:PlaceHolder ID="postPlaceHolder" runat="server"></asp:PlaceHolder>
                    <br />
                    <asp:Timer ID="postRefreshTimer" runat="server" Interval="30000">
                    </asp:Timer>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
    </asp:Panel>
   
    
</asp:Content>
