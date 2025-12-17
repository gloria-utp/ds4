<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Gastos.aspx.cs"
    Inherits="asistente_financiero.Gastos" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Registro de Gastos</h2>

    <table>
        <tr>
            <td>Categoría:</td>
            <td><asp:DropDownList ID="ddlCategoria" runat="server" /></td>
        </tr>

        <tr>
            <td>Monto:</td>
            <td><asp:TextBox ID="txtMonto" runat="server" /></td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Button ID="btnGuardar" runat="server"
                    Text="Guardar"
                    OnClick="btnGuardar_Click" />
            </td>
        </tr>
    </table>

    <br />
    <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" />

</asp:Content>
