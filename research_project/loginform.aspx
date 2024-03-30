<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginform.aspx.cs" Inherits="research_project.Loginform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!DOCTYPE html>
    <title></title>
    <style>
        body{
            background-color: black;
            
        }
        #loginform{
            background-color: white;
            width: 401px;
            height: 300px;
            margin-top: 250px;
            margin-left: auto;
            margin-right: auto;
            
        }
        .auto-style1 {
           border-radius: 5px;
        }
        .container{
            margin-left: 50px;
            height:200px;
            width: 300px;
        }
        .auto-style2 {
            height: 242px;
            width: 342px;
            margin-top: 0px;
           
            
        }
        .auto-style3 {
            background-color: dodgerblue;
            width: 401px;
            height: 61px;
        }

        .auto-style4 {
            width: 421px;
        }

        </style>
</head>
<body>
    <form id ="loginform" runat="server" class="auto-style4"  >
     
        <div class="auto-style2">
    
        <div class="auto-style3" aria-autocomplete="none">
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Login" BorderColor="White" ForeColor="White" Font-Size="X-Large" Font-Bold="true" ></asp:Label>
        </div>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            Username<br />
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="text1" runat="server" Width="308px" Height="29px" CssClass="auto-style1" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px" ></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Password<br />
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="text2" runat="server" Width="308px" Height="29px" CssClass="auto-style1" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Login" runat="server" CssClass="auto-style1" Text="Login" Height="33px" Width="59px" BackColor="DodgerBlue" BorderStyle="None" ForeColor="#CCCCCC" OnClick="Login_Click1" />
            <br />
            <br />
            &nbsp;<asp:Button ID="Button1" runat="server" BackColor="#999999" BorderStyle="None" CssClass="auto-style1" Height="27px" Text="sign up!" Width="68px" PostBackUrl="~/signupform.aspx" />
        </div>

    </form>
 </body>
</html>
