<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuanLyDanCu.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
        .label1{
            text-align:center;
        }
        .btn{
            border-radius: 10px;
            background:#000;
            border:1px solid #00ffff;
            color: #fff;
            width:100px;
            height:34px;
            margin: 20px 0 0 100px;
        }
    </style>
</head>
<body>
    <div style="display:flex;flex-direction:column; margin-top:50px">
        <h3 style="text-align:center; font-size:26px;">Login</h3>
        <form style="margin:auto; width:300px" id="form1" runat="server">
    <div style="width:100%">
        <label style="width:50px">Username: </label>
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    </div>
    <div style="margin-top:20px">
    <label style="width:50px">Password: </label>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
    </div>
     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Đăng nhập" class="btn" />
</form>
        <asp:Label ID="Label1" runat="server" class="label1"></asp:Label>
    </div>
</body>
</html>
