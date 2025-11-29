<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatrizDiagonal.aspx.cs" Inherits="Laboratorio20.MatrizDiagonal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Matriz Diagonal Inversa</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .input-group { margin: 15px 0; }
        .matrix-container { margin-top: 20px; overflow-x: auto; }
        .matrix-table { border-collapse: collapse; }
        .matrix-table td { width: 30px; height: 30px; text-align: center; border: 1px solid #000; }
        .one { background-color: #007bff; color: white; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Matriz Diagonal Inversa</h2>
            
            <div class="input-group">
                <asp:Label ID="lblDimension" runat="server" Text="Ingrese la dimensión N:"></asp:Label>
                <asp:TextBox ID="txtDimension" runat="server" TextMode="Number" min="1" max="20"></asp:TextBox>
                <asp:Button ID="btnGenerarMatriz" runat="server" Text="Generar Matriz" OnClick="BtnGenerarMatriz_Click" />
            </div>

            <div class="matrix-container">
                <asp:Panel ID="pnlMatriz" runat="server" Visible="false">
                    <h3>Matriz <%= txtDimension.Text %>x<%= txtDimension.Text %></h3>
                    <asp:Table ID="tblMatriz" runat="server" CssClass="matrix-table"></asp:Table>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>