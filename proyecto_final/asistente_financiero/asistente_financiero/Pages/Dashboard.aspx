<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" 
    Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body { font-family: Arial; padding: 20px; }
        .card { background: #f0f0f0; padding: 20px; margin: 10px; border-radius: 5px; }
        .btn { padding: 10px 20px; background: #007bff; color: white; border: none; cursor: pointer; }
    </style>
    
    <h1>📊 Dashboard Funcional</h1>
    
    <div class="card">
        <h3>Estadísticas</h3>
        <p>Deudas activas: <span id="lblDeudas" runat="server">0</span></p>
        <p>Monto total: $<span id="lblMonto" runat="server">0</span></p>
    </div>
    
    <div class="card">
        <h3>Calculadora</h3>
        <p>Monto: <input type="text" id="txtMonto" runat="server" /></p>
        <p>Plazo: <input type="text" id="txtPlazo" runat="server" value="30" /></p>
        <asp:Button ID="btnCalcular" runat="server" Text="Calcular" OnClick="btnCalcular_Click" CssClass="btn" />
    </div>
    
    <p><a href="../Default.aspx">← Volver al inicio</a></p>
</asp:Content>