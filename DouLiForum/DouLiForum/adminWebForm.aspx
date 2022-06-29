<%@ Page Title="兜里管理员主页" Language="C#" MasterPageFile="~/DouliForumSite.Master" AutoEventWireup="true" CodeBehind="adminWebForm.aspx.cs" Inherits="DouLiForum.adminWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <asp:Panel ID="textPanel" runat="server">
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="showLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="用户无权访问管理员页面！"></asp:Label>
    </asp:Panel>

    <asp:UpdatePanel ID="adminUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="adminShowPanel" runat="server" Visible="False">
                <asp:Panel ID="userMessagePanel" runat="server" style="margin-left:300px">
            <br />
                    &nbsp;<br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" style="margin-left:250px" Text="用户信息"></asp:Label>
            <br />
            <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="user_ID" DataSourceID="userLinqDataSource" GridLines="None" PageSize="20" Width="553px">
                        <Columns>
                            <asp:BoundField DataField="user_ID" HeaderText="user_ID" ReadOnly="True" SortExpression="user_ID" />
                            <asp:BoundField DataField="user_nickname" HeaderText="user_nickname" SortExpression="user_nickname" />
                            <asp:BoundField DataField="user_password" HeaderText="user_password" SortExpression="user_password" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="adminMessagePanel" runat="server" style="margin-left:300px">
            <br />
                    &nbsp;<br /><asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" style="margin-left:250px" Text="管理员信息"></asp:Label>
            <br />
            <br />
                    <asp:GridView ID="adminGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="admin_ID" DataSourceID="adminLinqDataSource" PageSize="6" Width="553px">
                        <Columns>
                            <asp:BoundField DataField="admin_ID" HeaderText="admin_ID" ReadOnly="True" SortExpression="admin_ID" />
                            <asp:BoundField DataField="admin_nickname" HeaderText="admin_nickname" SortExpression="admin_nickname" />
                            <asp:BoundField DataField="admin_password" HeaderText="admin_password" SortExpression="admin_password" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="addAdminPanel" runat="server" style="margin-left:300px">
            <br />
            <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="管理员注册"></asp:Label>
            <br />
            <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#373737" Text="账号："></asp:Label>
                    <asp:TextBox ID="IDTextBox" runat="server" Height="20px" style="margin-left:20px" Width="280px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="IDRequiredFieldValidator" runat="server" ControlToValidate="IDTextBox" EnableClientScript="False" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080">*</asp:RequiredFieldValidator>
                    <asp:Label ID="IDreLabel" runat="server" ForeColor="Red" Text=" "></asp:Label>
                    <div>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#333333" Text="密码："></asp:Label>
                        <asp:TextBox ID="passwordTextBox" runat="server" Height="20px" style="margin-left:20px" TextMode="Password" Width="280px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ControlToValidate="passwordTextBox" EnableClientScript="False" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080">*</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#333333" Text="昵称："></asp:Label>
                        <asp:TextBox ID="nickNameTextBox" runat="server" Height="20px" style="margin-left:20px" Width="280px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nickNameRequiredFieldValidator" runat="server" ControlToValidate="nickNameTextBox" EnableClientScript="False" ErrorMessage="RequiredFieldValidator" ForeColor="#FF8080">*</asp:RequiredFieldValidator>
                <br />
                <br />
                        <asp:Button ID="addAdminButton" runat="server" BackColor="#333333" BorderColor="#333333" ForeColor="White" Height="29px" OnClick="addAdminButton_Click" style="margin-left:300px" Text="注册管理员" Width="86px" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="postPanel" runat="server" style="margin-left:300px">
            <br />
            <br />
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" style="margin-left:250px" Text="微博管理"></asp:Label>
            <br />
            <br />
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="post_ID" DataSourceID="postLinqDataSource" ForeColor="#333333" GridLines="None" PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="post_ID" HeaderText="post_ID" ReadOnly="True" SortExpression="post_ID" />
                            <asp:BoundField DataField="post_user_ID" HeaderText="post_user_ID" SortExpression="post_user_ID" />
                            <asp:BoundField DataField="post_content" HeaderText="post_content" SortExpression="post_content" />
                            <asp:BoundField DataField="post_time" HeaderText="post_time" SortExpression="post_time" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="commentPanel" runat="server" style="margin-left:300px">
            <br />
        <br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" style="margin-left:250px" Text="回复消息管理"></asp:Label>
            <br />
            <br />
            <br />
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="comment_ID" DataSourceID="commentLinqDataSource" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="comment_ID" HeaderText="comment_ID" ReadOnly="True" SortExpression="comment_ID" />
                            <asp:BoundField DataField="comment_post_ID" HeaderText="comment_post_ID" SortExpression="comment_post_ID" />
                            <asp:BoundField DataField="comment_user_ID" HeaderText="comment_user_ID" SortExpression="comment_user_ID" />
                            <asp:BoundField DataField="comment_content" HeaderText="comment_content" SortExpression="comment_content" />
                            <asp:BoundField DataField="comment_time" HeaderText="comment_time" SortExpression="comment_time" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="attentionPanel" runat="server" style="margin-left:300px">
            <br />
            <br />
            <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" style="margin-left:250px" Text="关注列表"></asp:Label>
            <br />
            <br />
            <br />
                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="attention_ID" DataSourceID="attentionLinqDataSource" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="attention_ID" HeaderText="attention_ID" ReadOnly="True" SortExpression="attention_ID" />
                            <asp:BoundField DataField="userID_attention_CL" HeaderText="userID_attention_CL" SortExpression="userID_attention_CL" />
                            <asp:BoundField DataField="user_attention_to_ID" HeaderText="user_attention_to_ID" SortExpression="user_attention_to_ID" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </asp:Panel>
                <asp:LinqDataSource ID="userLinqDataSource" runat="server" ContextTypeName="DouLiForum.DouliForumDataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="user_Table">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="adminLinqDataSource" runat="server" ContextTypeName="DouLiForum.DouliForumDataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="admin_Table">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="postLinqDataSource" runat="server" ContextTypeName="DouLiForum.DouliForumDataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="post_Table">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="commentLinqDataSource" runat="server" ContextTypeName="DouLiForum.DouliForumDataClassesDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="comment_Table">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="attentionLinqDataSource" runat="server" ContextTypeName="DouLiForum.DouliForumDataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="attent_Table">
                </asp:LinqDataSource>
            </asp:Panel>
        </ContentTemplate>

    </asp:UpdatePanel>
    </asp:Content>
