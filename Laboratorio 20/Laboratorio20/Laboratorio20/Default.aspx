<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Laboratorio20.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laboratorio 20</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .menu { list-style: none; padding: 0; }
        .menu li { margin: 10px 0; }
        .menu a { display: block; padding: 10px 15px; background: #007bff; color: white; 
                  text-decoration: none; border-radius: 4px; width: 200px; }
        .menu a:hover { background: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Laboratorio 20 - Problemas Varios en C# WebApps</h1>
            <ul class="menu">
                <li><a href="TablaMultiplicar.aspx">1. Tabla de Multiplicar</a></li>
                <li><a href="MatrizDiagonal.aspx">2. Matriz Diagonal Inversa</a></li>
                <li><a href="CRUDProductos.aspx">3. CRUD Productos</a></li>
            </ul>
        </div>
    </form>
</body>
</html>