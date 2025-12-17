<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Deudas.aspx.cs"
    Inherits="asistente_financiero.Deudas" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Deuda Tarjeta (24%)</h2>

    <table>
        <tr>
            <td>Monto:</td>
            <td><asp:TextBox ID="txtMonto" runat="server" /></td>
        </tr>
        <tr>
            <td>Meses:</td>
            <td><asp:TextBox ID="txtMeses" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnCalcular" runat="server"
                    Text="Calcular"
                    OnClick="btnCalcular_Click" />
            </td>
        </tr>
    </table>

    <br />
    <asp:Label ID="lblResultado" runat="server" Font-Bold="true" />

</asp:Content>
