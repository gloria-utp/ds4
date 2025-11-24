<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Laboratorio192.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laboratorio 19-2 - Todos los datos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Consumir API - Todos los datos</h1>
            <asp:Button ID="btnGetAll" runat="server" Text="Obtener todos los datos" OnClick="btnGetAll_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>