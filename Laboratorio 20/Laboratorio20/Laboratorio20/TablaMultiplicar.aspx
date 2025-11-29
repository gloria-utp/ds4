<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TablaMultiplicar.aspx.cs" Inherits="Laboratorio20.TablaMultiplicar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tabla de Multiplicar</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        .container { max-width: 600px; margin: 0 auto; }
        .input-group { margin: 15px 0; }
        .table-container { margin-top: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        .bold-header { font-weight: bold; background-color: #f8f9fa; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Tabla de Multiplicar</h2>
            
            <div class="input-group">
                <asp:Label ID="lblNumero" runat="server" Text="Ingrese un número:"></asp:Label>
                <asp:TextBox ID="txtNumero" runat="server" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnGenerar" runat="server" Text="Generar Tabla" OnClick="BtnGenerar_Click" />
            </div>

            <div class="table-container">
                <asp:Table ID="tblTabla" runat="server" CssClass="table" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell CssClass="bold-header">Multiplicación</asp:TableCell>
                        <asp:TableCell CssClass="bold-header">Resultado</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </form>
</body>
</html>