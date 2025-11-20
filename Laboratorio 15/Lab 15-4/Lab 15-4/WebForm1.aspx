<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab_15_4.WebForm1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Suma de números</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Suma de dos números</h2>

        <p>
            Número 1:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>

        <p>
            Número 2:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>

        <p>
            <asp:Button ID="Button1" runat="server" Text="Sumar" OnClick="Button1_Click" />
        </p>

        <p>
            Resultado:
            <asp:Label ID="LabelResultado" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
