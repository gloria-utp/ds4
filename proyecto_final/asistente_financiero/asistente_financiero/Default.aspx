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

    <br />

    <!-- GRÁFICO PEQUEÑO -->
    <canvas id="chartResumen" width="300" height="300"></canvas>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        const ingresos = <%= IngresosJS %>;
        const gastos = <%= GastosJS %>;

        new Chart(document.getElementById('chartResumen'), {
            type: 'doughnut',
            data: {
                labels: ['Ingresos', 'Gastos'],
                datasets: [{
                    data: [ingresos, gastos]
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    </script>

</asp:Content>
