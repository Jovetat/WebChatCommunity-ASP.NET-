<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="postWebUserControl.ascx.cs" Inherits="DouLiForum.postWebUserControl" %>

<asp:Panel ID="Panel2" style="margin-left:20px" runat="server">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/eehei.png" Width="1000px" />
</asp:Panel>
<asp:Button ID="userNickNameButton" style="margin-left:50px" runat="server" BackColor="White" Font-Bold="True" Font-Size="Large" Text="Button" OnClick="userNickNameButton_Click" />

<br />
<asp:Label ID="timeLabel" style="margin-left:200px" runat="server" Text="Label" ForeColor="#FF6666"></asp:Label>

<asp:Panel ID="contentPanel" runat="server">
    <br />
    <asp:Label ID="contentLabel" style="margin-left:100px" runat="server" Text="Label" Font-Names="黑体" Font-Size="Large"></asp:Label>
</asp:Panel>


<asp:Panel ID="toolPanel" runat="server">
    <br />
    <asp:ImageButton ID="attentionImageButton" style="margin-left:200px" runat="server" Height="30px" OnClick="attentionImageButton_Click" />
    <asp:ImageButton ID="commmentImageButton" style="margin-left:100px" runat="server" Height="30px" ImageUrl="~/Image/评论.png" OnClick="commmentImageButton_Click" />
    <asp:ImageButton ID="likeImageButton" style="margin-left:100px" runat="server" Height="30px" ImageUrl="~/Image/未点赞.png" Width="30px" OnClick="likeImageButton_Click" />
</asp:Panel>



<asp:Panel ID="commentPanel" style="margin-left:100px" runat="server" Visible="False">
    <asp:Table ID="commentTable" runat="server">
    </asp:Table>
    <br />
    <asp:Image ID="Image1" runat="server" Height="26px" ImageUrl="~/Image/写点评论.png" Width="26px" />
    <br />
    <asp:Panel ID="writeCommentPanel" runat="server">
        <asp:TextBox ID="commentContentTextBox"  runat="server" Height="50px" Width="600px"></asp:TextBox>
        <br />
        <asp:Button ID="releaseButton" style="margin-left:540px" runat="server" BackColor="#333333" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="30px" OnClick="releaseButton_Click" Text="发布" Width="60px" />
    </asp:Panel>
</asp:Panel>




<asp:Panel ID="Panel1" style="margin-left:20px" runat="server">
    <br />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/endless.png" Width="1000px" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Panel>





