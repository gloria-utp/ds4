<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Laboratorio193.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laboratorio 19-3 - Dato específico</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Consumir API - Dato con ID=2</h1>
            <asp:Button ID="btnGetById" runat="server" Text="Obtener dato con ID=2" OnClick="btnGetById_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>