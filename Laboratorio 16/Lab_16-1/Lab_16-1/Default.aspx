<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab_16_1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculadora - Lab 16-1</title>
    <style type="text/css">
        .calculator {
            position: absolute;
            top: 50px;
            left: 150px;
            right: 400px;
            height: 600px;
            bottom: 100px;
            background-color: dodgerblue;
            padding: 20px;
        }
        .display {
            width: 335px;
            height: 41px;
            font-size: 20px;
            text-align: right;
            margin-bottom: 20px;
        }
        .btn {
            height: 37px;
            width: 57px;
            font-size: 16px;
            margin: 2px;
        }
        .title {
            font-size: 25px;
            font-weight: bold;
            color: white;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="calculator">
            <div class="title">BASIC CALCULATOR - LAB 16-1</div>
            
            <asp:TextBox ID="txtDisplay" runat="server" CssClass="display"></asp:TextBox>
            <br />
            
            <!-- Fila 1 -->
            <asp:Button ID="btn7" Text="7" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn8" Text="8" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn9" Text="9" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btnAdd" Text="+" runat="server" CssClass="btn" OnClick="Operator_Click" />
            <br />
            
            <!-- Fila 2 -->
            <asp:Button ID="btn4" Text="4" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn5" Text="5" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn6" Text="6" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btnSubtract" Text="-" runat="server" CssClass="btn" OnClick="Operator_Click" />
            <br />
            
            <!-- Fila 3 -->
            <asp:Button ID="btn1" Text="1" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn2" Text="2" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btn3" Text="3" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btnMultiply" Text="*" runat="server" CssClass="btn" OnClick="Operator_Click" />
            <br />
            
            <!-- Fila 4 -->
            <asp:Button ID="btn0" Text="0" runat="server" CssClass="btn" OnClick="Number_Click" />
            <asp:Button ID="btnClear" Text="C" runat="server" CssClass="btn" OnClick="btnClear_Click" />
            <asp:Button ID="btnEquals" Text="=" runat="server" CssClass="btn" OnClick="btnEquals_Click" />
            <asp:Button ID="btnDivide" Text="/" runat="server" CssClass="btn" OnClick="Operator_Click" />
        </div>
    </form>
</body>
</html>