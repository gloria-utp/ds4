<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" 
    Inherits="asistente_financiero.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asistente Financiero</title>
    <style>
        .hero {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
            color: white;
        }
        
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
        .features {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 40px 0;
            flex-wrap: wrap;
        }
        
        .feature {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 3px 15px rgba(0,0,0,0.1);
            width: 300px;
            text-align: center;
        }
        
        .feature h3 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        .btn-large {
            display: inline-block;
            padding: 15px 30px;
            background-color: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            margin-top: 20px;
        }
        
        .btn-large:hover {
            background-color: #219653;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero">
            <h1>💰 Asistente Financiero</h1>
            <p>Sistema de Gestión de Deudas con Proyecciones Inteligentes</p>
            <a href="Pages/Dashboard.aspx" class="btn-large">🚀 Ir al Dashboard</a>
        </div>
        
        <div style="text-align: center; padding: 40px;">
            <h2>✨ Funcionalidades Principales</h2>
            <div class="features">
                <div class="feature">
                    <h3>📊 Dashboard Intuitivo</h3>
                    <p>Visualiza todas tus deudas en un solo lugar con estadísticas claras</p>
                </div>
                
                <div class="feature">
                    <h3>📅 Proyecciones Futuras</h3>
                    <p>Calcula pagos diarios y fechas límite basadas en tu capacidad</p>
                </div>
                
                <div class="feature">
                    <h3>📈 Reportes Detallados</h3>
                    <p>Genera informes de progreso y planes de pago personalizados</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>