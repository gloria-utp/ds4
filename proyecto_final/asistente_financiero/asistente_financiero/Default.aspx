<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Default.aspx.cs"
    Inherits="asistente_financiero.Default" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Dashboard Financiero</h2>

    <table border="1" cellpadding="8">
        <tr>
            <td>Ingresos</td>
            <td><asp:Label ID="lblIngresos" runat="server" /></td>
        </tr>
        <tr>
            <td>Gastos</td>
            <td><asp:Label ID="lblGastos" runat="server" /></td>
        </tr>
        <tr>
            <td>Balance</td>
            <td><asp:Label ID="lblBalance" runat="server" /></td>
        </tr>
    </table>

</asp:Content>
