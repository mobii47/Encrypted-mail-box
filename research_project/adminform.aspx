<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminform.aspx.cs" Inherits="research_project.adminform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
     </script>
    <title></title>
    <style type="text/css">


        .auto-style1 {
           border-radius: 5px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="user" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="serial" ShowHeaderWhenEmpty="true"

                OnRowCommand="user_RowCommand" OnRowEditing="user_RowEditing" OnRowCancelingEdit="user_RowCancelingEdit"
                OnRowUpdating="user_RowUpdating" OnRowDeleting="user_RowDeleting"

                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="329px" Width="1233px" OnSelectedIndexChanged="user_SelectedIndexChanged"> 
                <%-- Theme Properties --%>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
               <%--<SortedAscendingCellStyle BackColor="#F1F1F1" />
              <<SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />--%>
                
                <Columns>
                     <asp:TemplateField HeaderText="serial number">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("serial") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtserial" Text='<%# Eval("serial") %>' runat="server" />
                        </EditItemTemplate>
                       <%-- <FooterTemplate>
                            <asp:TextBox ID="txtserialFooter" runat="server" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("fname") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("fname") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFirstNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("lname") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("lname") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLastNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("email") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail" Text='<%# Eval("email") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtemailFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("contact") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" Text='<%# Eval("contact") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtContactFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserName">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("username") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtusername" Text='<%# Eval("username") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtusernameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("pass") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpass" Text='<%# Eval("pass") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtpassFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/NewFolder1/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/NewFolder1/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/NewFolder1/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/NewFolder1/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/NewFolder1/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            &nbsp;<asp:Button ID="logoutbutton" runat="server" CssClass="auto-style1" Text="Logout" Height="38px" Width="89px" BackColor="#0099CC" BorderStyle="None" ForeColor="#CCCCCC" OnClick="logoutbutton_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

        </div>
    </form>
</body>
</html>
