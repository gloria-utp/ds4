<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDProductos.aspx.cs" Inherits="Laboratorio20.CRUDProductos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD Productos</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        .container { max-width: 700px; margin: 0 auto; }
        .form-group { margin: 15px 0; }
        label { display: inline-block; width: 100px; font-weight: bold; }
        .toolbar { margin: 20px 0; text-align: center; }
        .button-container { display: inline-block; margin: 0 15px; text-align: center; }
        .icon-button { 
            width: 32px; 
            height: 32px; 
            border: 1px solid #ccc; 
            background: white;
            cursor: pointer;
            padding: 5px;
            border-radius: 5px;
            display: block;
            margin: 0 auto;
        }
        .icon-button:hover { background-color: #f0f0f0; }
        .icon-button:disabled { opacity: 0.5; cursor: not-allowed; }
        .button-image { width: 40px; height: 40px; display: block; margin: 0 auto; }
        .button-label { 
            display: block; 
            margin-top: 5px; 
            font-size: 12px; 
            font-weight: bold;
            text-align: center;
        }
        .search-group { margin: 15px 0; padding: 10px; background: #f8f9fa; border-radius: 5px; }
        .message { padding: 10px; margin: 10px 0; border-radius: 4px; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .form-container { padding: 15px; background: #f0f0f0; border-radius: 5px; }
        .text-box { width: 250px; padding: 5px; margin: 2px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Gestión de Productos - LAPTOPS</h2>
            
            <!-- Mensajes -->
            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="message">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </asp:Panel>

            <!-- Búsqueda -->
            <div class="search-group">
                <strong>Buscar Producto:</strong><br />
                <asp:TextBox ID="txtBuscarId" runat="server" placeholder="Ingrese ID" TextMode="Number" CssClass="text-box"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="🔍 Buscar" OnClick="BtnBuscar_Click" 
                            BackColor="#007bff" ForeColor="White" BorderStyle="None" Padding="8px 15px" />
            </div>

            <!-- Toolbar con iconos usando ImageButton -->
            <div class="toolbar">
                <div class="button-container">
                    <asp:ImageButton ID="btnNuevo" runat="server" CssClass="icon-button" 
                                    ImageUrl="~/Images/ubuntu.png" OnClick="BtnNuevo_Click"
                                    ToolTip="Nuevo Producto" />
                    <span class="button-label">Nuevo</span>
                </div>
                
                <div class="button-container">
                    <asp:ImageButton ID="btnGuardar" runat="server" CssClass="icon-button" 
                                    ImageUrl="~/Images/vtoyiso.png" OnClick="BtnGuardar_Click" Enabled="false"
                                    ToolTip="Guardar Producto" />
                    <span class="button-label">Guardar</span>
                </div>
                
                <div class="button-container">
                    <asp:ImageButton ID="btnCancelar" runat="server" CssClass="icon-button" 
                                    ImageUrl="~/Images/deepin.png" OnClick="BtnCancelar_Click" Enabled="false"
                                    ToolTip="Cancelar Operación" />
                    <span class="button-label">Cancelar</span>
                </div>
                
                <div class="button-container">
                    <asp:ImageButton ID="btnEliminar" runat="server" CssClass="icon-button" 
                                    ImageUrl="~/Images/red-hat.png" OnClick="BtnEliminar_Click" Enabled="false"
                                    ToolTip="Eliminar Producto" 
                                    OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" />
                    <span class="button-label">Eliminar</span>
                </div>
            </div>

            <!-- Campos del formulario -->
            <div class="form-container">
                <div class="form-group">
                    <label for="txtId">ID:</label>
                    <asp:TextBox ID="txtId" runat="server" ReadOnly="true" BackColor="#f8f9fa" CssClass="text-box"></asp:TextBox>
                    &nbsp;<!--  --></div>
                
                <div class="form-group">
                    <label for="txtNombre">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="text-box" placeholder="Nombre del producto"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtPrecio">Precio:</label>
                    <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" step="0.01" CssClass="text-box" placeholder="0.00"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="txtStock">Stock:</label>
                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number" CssClass="text-box" placeholder="0"></asp:TextBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>