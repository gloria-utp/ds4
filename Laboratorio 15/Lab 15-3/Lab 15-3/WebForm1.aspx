<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab_15_3.WebForm1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Saludo</title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Introduzca un Texto"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Enviar Saludo" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
