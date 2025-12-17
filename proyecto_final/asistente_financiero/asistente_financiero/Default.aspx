<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Site.Master"
    CodeBehind="Default.aspx.cs"
    Inherits="asistente_financiero.Default" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Dashboard Financiero</h2>

    <!-- CONTENEDOR PRINCIPAL -->
    <div style="display:flex; gap:30px; align-items:flex-start;">

        <!-- COLUMNA IZQUIERDA -->
        <div style="width:300px;">

            <!-- TABLA -->
            <table border="1" cellpadding="6" style="width:100%; font-size:14px;">
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

            <!-- GRÁFICO PASTEL -->
            <canvas id="chartResumen" width="220" height="220"></canvas>
        </div>

        <!-- COLUMNA DERECHA -->
        <div style="width:450px;">
            <h4 style="margin-top:0;">Gastos por Categoría</h4>
            <canvas id="chartCategorias" width="450" height="250"></canvas>
        </div>

    </div>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // ===== PASTEL: INGRESOS VS GASTOS =====
        new Chart(document.getElementById('chartResumen'), {
            type: 'doughnut',
            data: {
                labels: ['Ingresos', 'Gastos'],
                datasets: [{
                    data: [<%= IngresosJS %>, <%= GastosJS %>]
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });

        // ===== BARRAS: GASTOS POR CATEGORÍA =====
        new Chart(document.getElementById('chartCategorias'), {
            type: 'bar',
            data: {
                labels: [<%= CategoriasJS %>],
                datasets: [{
                    label: 'Monto',
                    data: [<%= MontosCategoriasJS %>]
                }]
            },
            options: {
                responsive: false,
                scales: {
                    y: { beginAtZero: true }
                },
                plugins: {
                    legend: { display: false }
                }
            }
        });
    </script>

</asp:Content>
