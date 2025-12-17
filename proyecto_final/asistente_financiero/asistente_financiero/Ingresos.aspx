<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Ingresos.aspx.cs"
    Inherits="asistente_financiero.Ingresos" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Registro de Ingresos</h2>

    <table>
        <tr>
            <td>Tipo:</td>
            <td>
                <asp:DropDownList ID="ddlTipo" runat="server">
                    <asp:ListItem>Salario</asp:ListItem>
                    <asp:ListItem>Extra</asp:ListItem>
                </asp:DropDownList>
            </td>
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
