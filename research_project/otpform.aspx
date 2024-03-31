<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="otpform.aspx.cs" Inherits="research_project.otpform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title></title>
    <style>
        body{
            background-color: white;

        }
        #form1{
            background-color: white;
            width: 1200px;
            height: 400px;
            margin-top: 150px;
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
            margin-left: 33px;
            height: 748px;
            width: 1030px;
            margin-top: 0px;
            
            
        }
        .auto-style3 {
            background-color: dodgerblue;
            width: 1065px;
            height: 64px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .auto-style4 {
            width: 1147px;
            height: 522px;
            margin-left: 0px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:DropDownList ID="ddlLength" runat="server">
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="8" Value="8" />
                    <asp:ListItem Text="10" Value="10" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RadioButtonList ID="rbType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Alphanumeric" Value="1" Selected="True" />
                    <asp:ListItem Text="Numeric" Value="2" />
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Button ID="btnGenerate" Text="Generate OTP" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                OTP:
                <asp:Label ID="lblOTP" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    </form>
</body>
</html>
