<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sistema Legal GM - Todo en Uno</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
        
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        
        <!-- SISTEMA DE LOGIN -->
        <asp:Panel ID="pnlLogin" runat="server" Visible="true">
            <div class="login-box">
                <h2 style="text-align: center; color: #6a11cb; margin-bottom: 30px;">⚖️ SISTEMA LEGAL GM</h2>
                
                <div class="input-group">
                    <label>Usuario:</label>
                    <asp:TextBox ID="txtUsuario" runat="server" placeholder="admin"></asp:TextBox>
                </div>
                
                <div class="input-group">
                    <label>Contraseña:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="123"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" 
                    CssClass="btn btn-primary" OnClick="btnLogin_Click" style="width: 100%;"/>
                
                <asp:Label ID="lblLoginError" runat="server" Text="" 
                    style="color: red; margin-top: 10px; display: block; text-align: center;"></asp:Label>
            </div>
        </asp:Panel>
        
        <!-- SISTEMA PRINCIPAL -->
        <asp:Panel ID="pnlSistema" runat="server" Visible="false">
            <div class="container">
                <!-- HEADER -->
                <div class="header">
                    <h1><span>⚖️</span> Sistema Legal GM - <asp:Label ID="lblBienvenida" runat="server" Text=""></asp:Label></h1>
                    <asp:Button ID="btnLogout" runat="server" Text="Cerrar Sesión" 
                        CssClass="btn btn-danger" OnClick="btnLogout_Click" />
                </div>
                
                <!-- TABS -->
                <div class="tabs">
                    <asp:Button ID="btnTabMenu" runat="server" Text="🏠 Menú Principal" 
                        CssClass="tab active" OnClick="CambiarTab" CommandArgument="menu" />
                    <asp:Button ID="btnTabCasos" runat="server" Text="📁 Casos" 
                        CssClass="tab" OnClick="CambiarTab" CommandArgument="casos" />
                    <asp:Button ID="btnTabAbogados" runat="server" Text="👨‍⚖️ Abogados" 
                        CssClass="tab" OnClick="CambiarTab" CommandArgument="abogados" />
                    <asp:Button ID="btnTabCalendario" runat="server" Text="📅 Calendario" 
                        CssClass="tab" OnClick="CambiarTab" CommandArgument="calendario" />
                </div>
                
                <!-- MENÚ PRINCIPAL -->
                <asp:Panel ID="pnlMenu" runat="server" CssClass="content active">
                    <h2>📊 Dashboard</h2>
                    
                    <div class="card">
                        <h3>Resumen del Sistema</h3>
                        <div class="form-row">
                            <div>
                                <h4>📁 Casos Activos: <asp:Label ID="lblCasosActivos" runat="server" Text="0"></asp:Label></h4>
                            </div>
                            <div>
                                <h4>👨‍⚖️ Abogados: <asp:Label ID="lblTotalAbogados" runat="server" Text="0"></asp:Label></h4>
                            </div>
                            <div>
                                <h4>📅 Eventos Hoy: <asp:Label ID="lblEventosHoy" runat="server" Text="0"></asp:Label></h4>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <h3>Acciones Rápidas</h3>
                        <div class="toolbar">
                            <asp:Button ID="btnNuevoCaso" runat="server" Text="➕ Nuevo Caso" 
                                CssClass="btn btn-primary" OnClick="btnNuevoCaso_Click" />
                            <asp:Button ID="btnNuevoAbogado" runat="server" Text="➕ Nuevo Abogado" 
                                CssClass="btn btn-primary" OnClick="btnNuevoAbogado_Click" />
                            <asp:Button ID="btnVerEventos" runat="server" Text="📅 Ver Calendario" 
                                CssClass="btn btn-success" OnClick="btnVerEventos_Click" />
                        </div>
                    </div>
                    
                    <div class="card">
                        <h3>📅 Eventos del Día</h3>
                        <asp:GridView ID="gvEventosHoy" runat="server" AutoGenerateColumns="false" 
                            CssClass="table" GridLines="None" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="Hora" HeaderText="Hora" />
                                <asp:BoundField DataField="Evento" HeaderText="Evento" />
                                <asp:BoundField DataField="Caso" HeaderText="Caso" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="padding: 20px; text-align: center; color: #666;">
                                    No hay eventos para hoy
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </asp:Panel>
                
                <!-- CASOS -->
                <asp:Panel ID="pnlCasos" runat="server" CssClass="content">
                    <h2>📁 Gestión de Casos</h2>
                    
                    <!-- Mensajes -->
                    <asp:Panel ID="pnlMsgCasos" runat="server" Visible="false" CssClass="message">
                        <asp:Label ID="lblMsgCasos" runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    
                    <!-- Formulario CRUD -->
                    <div class="card">
                        <h3>📝 Datos del Caso</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>ID:</label>
                                <asp:TextBox ID="txtCasoID" runat="server" ReadOnly="true" BackColor="#f8f9fa"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Número de Caso:</label>
                                <asp:TextBox ID="txtNumeroCaso" runat="server" placeholder="C-2024-001"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Título:</label>
                                <asp:TextBox ID="txtTituloCaso" runat="server" placeholder="Título del caso"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label>Cliente:</label>
                                <asp:TextBox ID="txtCliente" runat="server" placeholder="Nombre del cliente"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Abogado:</label>
                                <asp:DropDownList ID="ddlAbogadoCaso" runat="server">
                                    <asp:ListItem Value="">-- Seleccionar --</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Estado:</label>
                                <asp:DropDownList ID="ddlEstadoCaso" runat="server">
                                    <asp:ListItem>En Proceso</asp:ListItem>
                                    <asp:ListItem>En Audiencia</asp:ListItem>
                                    <asp:ListItem>Investigación</asp:ListItem>
                                    <asp:ListItem>Cerrado</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label>Fecha Inicio:</label>
                                <asp:TextBox ID="txtFechaInicio" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Fecha Vencimiento:</label>
                                <asp:TextBox ID="txtFechaVencimiento" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Palabra Clave 1:</label>
                                <asp:TextBox ID="txtPalabra1" runat="server" placeholder="Contrato"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Descripción:</label>
                            <asp:TextBox ID="txtDescripcionCaso" runat="server" TextMode="MultiLine" 
                                Rows="3" placeholder="Descripción del caso..."></asp:TextBox>
                        </div>
                        
                        <div class="toolbar">
                            <asp:Button ID="btnNuevoCasoCRUD" runat="server" Text="➕ Nuevo" 
                                CssClass="btn btn-primary" OnClick="btnNuevoCasoCRUD_Click" />
                            <asp:Button ID="btnGuardarCaso" runat="server" Text="💾 Guardar" 
                                CssClass="btn btn-success" OnClick="btnGuardarCaso_Click" Enabled="false" />
                            <asp:Button ID="btnCancelarCaso" runat="server" Text="❌ Cancelar" 
                                CssClass="btn btn-warning" OnClick="btnCancelarCaso_Click" Enabled="false" />
                            <asp:Button ID="btnEliminarCaso" runat="server" Text="🗑️ Eliminar" 
                                CssClass="btn btn-danger" OnClick="btnEliminarCaso_Click" Enabled="false" 
                                OnClientClick="return confirm('¿Eliminar este caso?');" />
                        </div>
                    </div>
                    
                    <!-- Buscar -->
                    <div class="card">
                        <h3>🔍 Buscar Casos</h3>
                        <div style="display: flex; gap: 10px;">
                            <asp:TextBox ID="txtBuscarCaso" runat="server" placeholder="Buscar por título, cliente..." 
                                style="flex-grow: 1;"></asp:TextBox>
                            <asp:Button ID="btnBuscarCaso" runat="server" Text="Buscar" 
                                CssClass="btn btn-primary" OnClick="btnBuscarCaso_Click" />
                            <asp:Button ID="btnTodosCasos" runat="server" Text="Mostrar Todos" 
                                CssClass="btn btn-secondary" OnClick="btnTodosCasos_Click" />
                        </div>
                    </div>
                    
                    <!-- Lista de Casos -->
                    <div class="card">
                        <h3>📋 Lista de Casos</h3>
                        <div class="table-container">
                            <asp:GridView ID="gvCasos" runat="server" AutoGenerateColumns="false"
                                CssClass="table" OnRowCommand="gvCasos_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="CasoID" HeaderText="ID" />
                                    <asp:BoundField DataField="NumeroCaso" HeaderText="Número" />
                                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                                    <asp:BoundField DataField="ClienteNombre" HeaderText="Cliente" />
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button ID="btnSeleccionarCaso" runat="server" Text="Seleccionar" 
                                                CommandName="Seleccionar" CommandArgument='<%# Eval("CasoID") %>'
                                                CssClass="btn btn-primary" style="padding: 5px 10px; font-size: 12px;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="padding: 20px; text-align: center; color: #666;">
                                        No hay casos registrados
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>
                
                <!-- ABOGADOS -->
                <asp:Panel ID="pnlAbogados" runat="server" CssClass="content">
                    <h2>👨‍⚖️ Gestión de Abogados</h2>
                    
                    <!-- Mensajes -->
                    <asp:Panel ID="pnlMsgAbogados" runat="server" Visible="false" CssClass="message">
                        <asp:Label ID="lblMsgAbogados" runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    
                    <!-- Formulario CRUD -->
                    <div class="card">
                        <h3>📝 Datos del Abogado</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>ID:</label>
                                <asp:TextBox ID="txtAbogadoID" runat="server" ReadOnly="true" BackColor="#f8f9fa"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Nombre:</label>
                                <asp:TextBox ID="txtNombreAbogado" runat="server" placeholder="Nombre completo"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Especialidad:</label>
                                <asp:TextBox ID="txtEspecialidad" runat="server" placeholder="Penal, Civil, Laboral"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label>Email:</label>
                                <asp:TextBox ID="txtEmailAbogado" runat="server" TextMode="Email" placeholder="abogado@bufete.com"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Teléfono:</label>
                                <asp:TextBox ID="txtTelefonoAbogado" runat="server" placeholder="555-0101"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Estado:</label>
                                <asp:DropDownList ID="ddlEstadoAbogado" runat="server">
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                    <asp:ListItem>Vacaciones</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <div class="toolbar">
                            <asp:Button ID="btnNuevoAbogadoCRUD" runat="server" Text="➕ Nuevo" 
                                CssClass="btn btn-primary" OnClick="btnNuevoAbogadoCRUD_Click" />
                            <asp:Button ID="btnGuardarAbogado" runat="server" Text="💾 Guardar" 
                                CssClass="btn btn-success" OnClick="btnGuardarAbogado_Click" Enabled="false" />
                            <asp:Button ID="btnCancelarAbogado" runat="server" Text="❌ Cancelar" 
                                CssClass="btn btn-warning" OnClick="btnCancelarAbogado_Click" Enabled="false" />
                            <asp:Button ID="btnEliminarAbogado" runat="server" Text="🗑️ Eliminar" 
                                CssClass="btn btn-danger" OnClick="btnEliminarAbogado_Click" Enabled="false" 
                                OnClientClick="return confirm('¿Eliminar este abogado?');" />
                        </div>
                    </div>
                    
                    <!-- Buscar -->
                    <div class="card">
                        <h3>🔍 Buscar Abogados</h3>
                        <div style="display: flex; gap: 10px;">
                            <asp:TextBox ID="txtBuscarAbogado" runat="server" placeholder="Buscar por nombre..." 
                                style="flex-grow: 1;"></asp:TextBox>
                            <asp:Button ID="btnBuscarAbogado" runat="server" Text="Buscar" 
                                CssClass="btn btn-primary" OnClick="btnBuscarAbogado_Click" />
                            <asp:Button ID="btnTodosAbogados" runat="server" Text="Mostrar Todos" 
                                CssClass="btn btn-secondary" OnClick="btnTodosAbogados_Click" />
                        </div>
                    </div>
                    
                    <!-- Lista de Abogados -->
                    <div class="card">
                        <h3>📋 Lista de Abogados</h3>
                        <div class="table-container">
                            <asp:GridView ID="gvAbogados" runat="server" AutoGenerateColumns="false"
                                CssClass="table" OnRowCommand="gvAbogados_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="AbogadoID" HeaderText="ID" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                            <asp:Button ID="btnSeleccionarAbogado" runat="server" Text="Seleccionar" 
                                                CommandName="Seleccionar" CommandArgument='<%# Eval("AbogadoID") %>'
                                                CssClass="btn btn-primary" style="padding: 5px 10px; font-size: 12px;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="padding: 20px; text-align: center; color: #666;">
                                        No hay abogados registrados
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </asp:Panel>
                
                <!-- CALENDARIO -->
                <asp:Panel ID="pnlCalendario" runat="server" CssClass="content">
                    <h2>📅 Calendario de Eventos</h2>
                    
                    <div class="card">
                        <h3>Calendario del Mes</h3>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                            <asp:Button ID="btnMesAnterior" runat="server" Text="◀ Mes Anterior" 
                                CssClass="btn btn-secondary" OnClick="btnMesAnterior_Click" />
                            <h3><asp:Label ID="lblMesAnio" runat="server" Text="Abril 2024"></asp:Label></h3>
                            <asp:Button ID="btnMesSiguiente" runat="server" Text="Mes Siguiente ▶" 
                                CssClass="btn btn-secondary" OnClick="btnMesSiguiente_Click" />
                        </div>
                        
                        <div class="calendar">
                            <div class="calendar-header">Lun</div>
                            <div class="calendar-header">Mar</div>
                            <div class="calendar-header">Mie</div>
                            <div class="calendar-header">Jue</div>
                            <div class="calendar-header">Vie</div>
                            <div class="calendar-header">Sab</div>
                            <div class="calendar-header">Dom</div>
                            
                            <asp:Literal ID="litCalendario" runat="server"></asp:Literal>
                        </div>
                    </div>
                    
                    <div class="card">
                        <h3>Eventos del Día</h3>
                        <asp:GridView ID="gvEventosDia" runat="server" AutoGenerateColumns="false"
                            CssClass="table" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="Hora" HeaderText="Hora" />
                                <asp:BoundField DataField="Evento" HeaderText="Evento" />
                                <asp:BoundField DataField="Caso" HeaderText="Caso" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="padding: 20px; text-align: center; color: #666;">
                                    No hay eventos para este día
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </asp:Panel>
    </form>
    
    <script>
        // JavaScript simple para manejar tabs
        function cambiarTab(tabId) {
            // Oculta todos los contenidos
            var contents = document.querySelectorAll('.content');
            contents.forEach(function(content) {
                content.classList.remove('active');
            });
            
            // Quita activo de todos los tabs
            var tabs = document.querySelectorAll('.tab');
            tabs.forEach(function(tab) {
                tab.classList.remove('active');
            });
            
            // Muestra el contenido seleccionado
            document.getElementById(tabId).classList.add('active');
            
            // Activa el tab correspondiente
            event.target.classList.add('active');
        }
    </script>
</body>
</html>

<script runat="server">
    // VARIABLES GLOBALES
    string connectionString = @"Server=.;Database=GloriaMoreno;Trusted_Connection=True;";
    bool modoNuevoCaso = true;
    bool modoNuevoAbogado = true;
    DateTime fechaCalendario = DateTime.Now;

    // ============ EVENTOS DE PÁGINA ============
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InicializarSistema();
        }
    }

    // ============ SISTEMA DE LOGIN ============
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string usuario = txtUsuario.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (usuario == "admin" && password == "123")
        {
            Session["Usuario"] = usuario;
            Session["Rol"] = "Administrador";
            MostrarSistema();
        }
        else if (usuario == "abogado" && password == "123")
        {
            Session["Usuario"] = usuario;
            Session["Rol"] = "Abogado";
            MostrarSistema();
        }
        else
        {
            lblLoginError.Text = "Usuario o contraseña incorrectos";
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        pnlLogin.Visible = true;
        pnlSistema.Visible = false;
    }

    // ============ INICIALIZACIÓN ============
    private void InicializarSistema()
    {
        if (Session["Usuario"] != null)
        {
            MostrarSistema();
        }
        else
        {
            pnlLogin.Visible = true;
            pnlSistema.Visible = false;
        }
    }

    private void MostrarSistema()
    {
        pnlLogin.Visible = false;
        pnlSistema.Visible = true;
        lblBienvenida.Text = Session["Usuario"].ToString();
        CargarEstadisticas();
        CargarAbogadosCombo();
        CargarCasosGrid();
        CargarAbogadosGrid();
        GenerarCalendario();
        CargarEventosHoy();
    }

    // ============ MANEJO DE TABS ============
    protected void CambiarTab(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string tab = btn.CommandArgument;

        // Quitar activo de todos los tabs
        btnTabMenu.CssClass = btnTabMenu.CssClass.Replace(" active", "");
        btnTabCasos.CssClass = btnTabCasos.CssClass.Replace(" active", "");
        btnTabAbogados.CssClass = btnTabAbogados.CssClass.Replace(" active", "");
        btnTabCalendario.CssClass = btnTabCalendario.CssClass.Replace(" active", "");

        // Ocultar todos los contenidos
        pnlMenu.Visible = false;
        pnlCasos.Visible = false;
        pnlAbogados.Visible = false;
        pnlCalendario.Visible = false;

        // Activar tab seleccionado
        switch (tab)
        {
            case "menu":
                btnTabMenu.CssClass += " active";
                pnlMenu.Visible = true;
                break;
            case "casos":
                btnTabCasos.CssClass += " active";
                pnlCasos.Visible = true;
                break;
            case "abogados":
                btnTabAbogados.CssClass += " active";
                pnlAbogados.Visible = true;
                break;
            case "calendario":
                btnTabCalendario.CssClass += " active";
                pnlCalendario.Visible = true;
                break;
        }
    }

    // ============ BOTONES DEL MENÚ ============
    protected void btnNuevoCaso_Click(object sender, EventArgs e)
    {
        CambiarTab(btnTabCasos, null);
        btnTabCasos.CommandArgument = "casos";
    }

    protected void btnNuevoAbogado_Click(object sender, EventArgs e)
    {
        CambiarTab(btnTabAbogados, null);
        btnTabAbogados.CommandArgument = "abogados";
    }

    protected void btnVerEventos_Click(object sender, EventArgs e)
    {
        CambiarTab(btnTabCalendario, null);
        btnTabCalendario.CommandArgument = "calendario";
    }

    // ============ FUNCIONES DE BASE DE DATOS ============
    private void CrearBaseDeDatos()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(@"Server=.;Trusted_Connection=True;"))
            {
                con.Open();
                string sql = @"
                    IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'GloriaMoreno')
                    BEGIN
                        CREATE DATABASE GloriaMoreno;
                        PRINT 'Base de datos creada';
                    END";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Tabla Abogados
                string sqlAbogados = @"
                    IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'GM_Abogados')
                    BEGIN
                        CREATE TABLE GM_Abogados (
                            AbogadoID INT PRIMARY KEY IDENTITY(1,1),
                            Nombre VARCHAR(100) NOT NULL,
                            Especialidad VARCHAR(100),
                            Email VARCHAR(100),
                            Telefono VARCHAR(20),
                            Estado VARCHAR(20) DEFAULT 'Activo'
                        );
                        INSERT INTO GM_Abogados (Nombre, Especialidad, Email, Telefono) VALUES
                        ('Carlos Rodríguez', 'Penal', 'carlos@bufete.com', '555-0101'),
                        ('Ana Martínez', 'Civil', 'ana@bufete.com', '555-0102'),
                        ('Luis González', 'Laboral', 'luis@bufete.com', '555-0103');
                        PRINT 'Tabla Abogados creada y datos insertados';
                    END";

                // Tabla Casos
                string sqlCasos = @"
                    IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'GM_Casos')
                    BEGIN
                        CREATE TABLE GM_Casos (
                            CasoID INT PRIMARY KEY IDENTITY(1,1),
                            NumeroCaso VARCHAR(50) UNIQUE NOT NULL,
                            Titulo VARCHAR(200) NOT NULL,
                            Descripcion TEXT,
                            AbogadoID INT,
                            ClienteNombre VARCHAR(100),
                            FechaInicio DATE,
                            FechaVencimiento DATE,
                            Estado VARCHAR(50) DEFAULT 'En Proceso',
                            PalabraClave1 VARCHAR(50),
                            PalabraClave2 VARCHAR(50),
                            PalabraClave3 VARCHAR(50)
                        );
                        INSERT INTO GM_Casos (NumeroCaso, Titulo, Descripcion, AbogadoID, ClienteNombre, 
                                            FechaInicio, FechaVencimiento, Estado, PalabraClave1) VALUES
                        ('C-2024-001', 'Demanda Contractual', 'Caso de incumplimiento', 1, 'Empresa ABC',
                         '2024-01-15', '2024-06-30', 'En Proceso', 'Contrato'),
                        ('C-2024-002', 'Divorcio', 'Proceso de divorcio', 2, 'María López',
                         '2024-02-10', '2024-05-20', 'En Audiencia', 'Divorcio'),
                        ('C-2024-003', 'Despido', 'Demanda laboral', 3, 'Juan Pérez',
                         '2024-03-05', '2024-07-15', 'Investigación', 'Laboral');
                        PRINT 'Tabla Casos creada y datos insertados';
                    END";

                // Tabla Calendario
                string sqlCalendario = @"
                    IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'GM_Calendario')
                    BEGIN
                        CREATE TABLE GM_Calendario (
                            EventoID INT PRIMARY KEY IDENTITY(1,1),
                            CasoID INT,
                            TituloEvento VARCHAR(200) NOT NULL,
                            Descripcion TEXT,
                            FechaHora DATETIME,
                            TipoEvento VARCHAR(50)
                        );
                        INSERT INTO GM_Calendario (CasoID, TituloEvento, FechaHora, TipoEvento) VALUES
                        (1, 'Audiencia Preliminar', '2024-04-15 09:00:00', 'Audiencia'),
                        (2, 'Reunión con Cliente', '2024-04-20 14:30:00', 'Reunión'),
                        (3, 'Vencimiento de Plazo', '2024-04-25 23:59:59', 'Plazo');
                        PRINT 'Tabla Calendario creada y datos insertados';
                    END";

                SqlCommand cmd1 = new SqlCommand(sqlAbogados, con);
                SqlCommand cmd2 = new SqlCommand(sqlCasos, con);
                SqlCommand cmd3 = new SqlCommand(sqlCalendario, con);

                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error creando BD: " + ex.Message, false, "casos");
        }
    }

    // ============ CASOS ============
    protected void btnNuevoCasoCRUD_Click(object sender, EventArgs e)
    {
        LimpiarFormularioCaso();
        HabilitarFormularioCaso(true);
        btnGuardarCaso.Enabled = true;
        btnCancelarCaso.Enabled = true;
        btnEliminarCaso.Enabled = false;
        modoNuevoCaso = true;
        txtNumeroCaso.Focus();
    }

    protected void btnGuardarCaso_Click(object sender, EventArgs e)
    {
        if (ValidarCaso())
        {
            if (modoNuevoCaso)
            {
                InsertarCaso();
            }
            else
            {
                ActualizarCaso();
            }
            LimpiarFormularioCaso();
            HabilitarFormularioCaso(false);
            btnGuardarCaso.Enabled = false;
            btnCancelarCaso.Enabled = false;
            CargarCasosGrid();
            CargarEstadisticas();
        }
    }

    protected void btnCancelarCaso_Click(object sender, EventArgs e)
    {
        LimpiarFormularioCaso();
        HabilitarFormularioCaso(false);
        btnGuardarCaso.Enabled = false;
        btnCancelarCaso.Enabled = false;
        btnEliminarCaso.Enabled = false;
    }

    protected void btnEliminarCaso_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtCasoID.Text))
        {
            EliminarCaso();
            LimpiarFormularioCaso();
            HabilitarFormularioCaso(false);
            CargarCasosGrid();
            CargarEstadisticas();
        }
    }

    protected void btnBuscarCaso_Click(object sender, EventArgs e)
    {
        BuscarCasos();
    }

    protected void btnTodosCasos_Click(object sender, EventArgs e)
    {
        txtBuscarCaso.Text = "";
        CargarCasosGrid();
    }

    protected void gvCasos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Seleccionar")
        {
            int casoID = Convert.ToInt32(e.CommandArgument);
            CargarCaso(casoID);
        }
    }

    // ============ ABOGADOS ============
    protected void btnNuevoAbogadoCRUD_Click(object sender, EventArgs e)
    {
        LimpiarFormularioAbogado();
        HabilitarFormularioAbogado(true);
        btnGuardarAbogado.Enabled = true;
        btnCancelarAbogado.Enabled = true;
        btnEliminarAbogado.Enabled = false;
        modoNuevoAbogado = true;
        txtNombreAbogado.Focus();
    }

    protected void btnGuardarAbogado_Click(object sender, EventArgs e)
    {
        if (ValidarAbogado())
        {
            if (modoNuevoAbogado)
            {
                InsertarAbogado();
            }
            else
            {
                ActualizarAbogado();
            }
            LimpiarFormularioAbogado();
            HabilitarFormularioAbogado(false);
            btnGuardarAbogado.Enabled = false;
            btnCancelarAbogado.Enabled = false;
            CargarAbogadosGrid();
            CargarAbogadosCombo();
            CargarEstadisticas();
        }
    }

    protected void btnCancelarAbogado_Click(object sender, EventArgs e)
    {
        LimpiarFormularioAbogado();
        HabilitarFormularioAbogado(false);
        btnGuardarAbogado.Enabled = false;
        btnCancelarAbogado.Enabled = false;
        btnEliminarAbogado.Enabled = false;
    }

    protected void btnEliminarAbogado_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtAbogadoID.Text))
        {
            EliminarAbogado();
            LimpiarFormularioAbogado();
            HabilitarFormularioAbogado(false);
            CargarAbogadosGrid();
            CargarAbogadosCombo();
            CargarEstadisticas();
        }
    }

    protected void btnBuscarAbogado_Click(object sender, EventArgs e)
    {
        BuscarAbogados();
    }

    protected void btnTodosAbogados_Click(object sender, EventArgs e)
    {
        txtBuscarAbogado.Text = "";
        CargarAbogadosGrid();
    }

    protected void gvAbogados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Seleccionar")
        {
            int abogadoID = Convert.ToInt32(e.CommandArgument);
            CargarAbogado(abogadoID);
        }
    }

    // ============ CALENDARIO ============
    protected void btnMesAnterior_Click(object sender, EventArgs e)
    {
        fechaCalendario = fechaCalendario.AddMonths(-1);
        GenerarCalendario();
    }

    protected void btnMesSiguiente_Click(object sender, EventArgs e)
    {
        fechaCalendario = fechaCalendario.AddMonths(1);
        GenerarCalendario();
    }

    // ============ MÉTODOS AUXILIARES CASOS ============
    private bool ValidarCaso()
    {
        if (string.IsNullOrEmpty(txtNumeroCaso.Text))
        {
            MostrarMensaje("El número de caso es obligatorio", false, "casos");
            return false;
        }
        if (string.IsNullOrEmpty(txtTituloCaso.Text))
        {
            MostrarMensaje("El título es obligatorio", false, "casos");
            return false;
        }
        return true;
    }

    private void LimpiarFormularioCaso()
    {
        txtCasoID.Text = "";
        txtNumeroCaso.Text = "";
        txtTituloCaso.Text = "";
        txtCliente.Text = "";
        ddlAbogadoCaso.SelectedIndex = 0;
        ddlEstadoCaso.SelectedIndex = 0;
        txtFechaInicio.Text = "";
        txtFechaVencimiento.Text = "";
        txtPalabra1.Text = "";
        txtDescripcionCaso.Text = "";
    }

    private void HabilitarFormularioCaso(bool habilitar)
    {
        txtNumeroCaso.Enabled = habilitar;
        txtTituloCaso.Enabled = habilitar;
        txtCliente.Enabled = habilitar;
        ddlAbogadoCaso.Enabled = habilitar;
        ddlEstadoCaso.Enabled = habilitar;
        txtFechaInicio.Enabled = habilitar;
        txtFechaVencimiento.Enabled = habilitar;
        txtPalabra1.Enabled = habilitar;
        txtDescripcionCaso.Enabled = habilitar;
    }

    // ============ MÉTODOS AUXILIARES ABOGADOS ============
    private bool ValidarAbogado()
    {
        if (string.IsNullOrEmpty(txtNombreAbogado.Text))
        {
            MostrarMensaje("El nombre es obligatorio", false, "abogados");
            return false;
        }
        return true;
    }

    private void LimpiarFormularioAbogado()
    {
        txtAbogadoID.Text = "";
        txtNombreAbogado.Text = "";
        txtEspecialidad.Text = "";
        txtEmailAbogado.Text = "";
        txtTelefonoAbogado.Text = "";
        ddlEstadoAbogado.SelectedIndex = 0;
    }

    private void HabilitarFormularioAbogado(bool habilitar)
    {
        txtNombreAbogado.Enabled = habilitar;
        txtEspecialidad.Enabled = habilitar;
        txtEmailAbogado.Enabled = habilitar;
        txtTelefonoAbogado.Enabled = habilitar;
        ddlEstadoAbogado.Enabled = habilitar;
    }

    // ============ OPERACIONES BD CASOS ============
    private void InsertarCaso()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO GM_Casos (NumeroCaso, Titulo, Descripcion, AbogadoID, 
                              ClienteNombre, FechaInicio, FechaVencimiento, Estado, PalabraClave1) 
                              VALUES (@NumeroCaso, @Titulo, @Descripcion, @AbogadoID, 
                              @ClienteNombre, @FechaInicio, @FechaVencimiento, @Estado, @PalabraClave1)";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@NumeroCaso", txtNumeroCaso.Text);
                cmd.Parameters.AddWithValue("@Titulo", txtTituloCaso.Text);
                cmd.Parameters.AddWithValue("@Descripcion", txtDescripcionCaso.Text);
                cmd.Parameters.AddWithValue("@AbogadoID", ddlAbogadoCaso.SelectedValue);
                cmd.Parameters.AddWithValue("@ClienteNombre", txtCliente.Text);
                cmd.Parameters.AddWithValue("@FechaInicio", txtFechaInicio.Text);
                cmd.Parameters.AddWithValue("@FechaVencimiento", txtFechaVencimiento.Text);
                cmd.Parameters.AddWithValue("@Estado", ddlEstadoCaso.SelectedValue);
                cmd.Parameters.AddWithValue("@PalabraClave1", txtPalabra1.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                MostrarMensaje("Caso creado exitosamente", true, "casos");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "casos");
        }
    }

    private void ActualizarCaso()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE GM_Casos SET 
                              NumeroCaso = @NumeroCaso,
                              Titulo = @Titulo,
                              Descripcion = @Descripcion,
                              AbogadoID = @AbogadoID,
                              ClienteNombre = @ClienteNombre,
                              FechaInicio = @FechaInicio,
                              FechaVencimiento = @FechaVencimiento,
                              Estado = @Estado,
                              PalabraClave1 = @PalabraClave1
                              WHERE CasoID = @CasoID";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@CasoID", txtCasoID.Text);
                cmd.Parameters.AddWithValue("@NumeroCaso", txtNumeroCaso.Text);
                cmd.Parameters.AddWithValue("@Titulo", txtTituloCaso.Text);
                cmd.Parameters.AddWithValue("@Descripcion", txtDescripcionCaso.Text);
                cmd.Parameters.AddWithValue("@AbogadoID", ddlAbogadoCaso.SelectedValue);
                cmd.Parameters.AddWithValue("@ClienteNombre", txtCliente.Text);
                cmd.Parameters.AddWithValue("@FechaInicio", txtFechaInicio.Text);
                cmd.Parameters.AddWithValue("@FechaVencimiento", txtFechaVencimiento.Text);
                cmd.Parameters.AddWithValue("@Estado", ddlEstadoCaso.SelectedValue);
                cmd.Parameters.AddWithValue("@PalabraClave1", txtPalabra1.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                    MostrarMensaje("Caso actualizado exitosamente", true, "casos");
                else
                    MostrarMensaje("No se encontró el caso", false, "casos");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "casos");
        }
    }

    private void EliminarCaso()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "DELETE FROM GM_Casos WHERE CasoID = @CasoID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@CasoID", txtCasoID.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                    MostrarMensaje("Caso eliminado exitosamente", true, "casos");
                else
                    MostrarMensaje("No se encontró el caso", false, "casos");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "casos");
        }
    }

    private void CargarCaso(int casoID)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM GM_Casos WHERE CasoID = @CasoID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@CasoID", casoID);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                if (reader.Read())
                {
                    HabilitarFormularioCaso(true);
                    btnGuardarCaso.Enabled = true;
                    btnCancelarCaso.Enabled = true;
                    btnEliminarCaso.Enabled = true;

                    txtCasoID.Text = reader["CasoID"].ToString();
                    txtNumeroCaso.Text = reader["NumeroCaso"].ToString();
                    txtTituloCaso.Text = reader["Titulo"].ToString();
                    txtCliente.Text = reader["ClienteNombre"].ToString();
                    ddlAbogadoCaso.SelectedValue = reader["AbogadoID"].ToString();
                    ddlEstadoCaso.SelectedValue = reader["Estado"].ToString();
                    txtFechaInicio.Text = Convert.ToDateTime(reader["FechaInicio"]).ToString("yyyy-MM-dd");
                    txtFechaVencimiento.Text = Convert.ToDateTime(reader["FechaVencimiento"]).ToString("yyyy-MM-dd");
                    txtPalabra1.Text = reader["PalabraClave1"].ToString();
                    txtDescripcionCaso.Text = reader["Descripcion"].ToString();

                    modoNuevoCaso = false;
                }
                reader.Close();
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error cargando caso: " + ex.Message, false, "casos");
        }
    }

    private void CargarCasosGrid()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT c.*, a.Nombre as AbogadoNombre 
                              FROM GM_Casos c 
                              LEFT JOIN GM_Abogados a ON c.AbogadoID = a.AbogadoID 
                              ORDER BY c.FechaInicio DESC";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                gvCasos.DataSource = dt;
                gvCasos.DataBind();
            }
        }
        catch (Exception)
        {
            // Si hay error, probablemente la BD no existe, la creamos
            CrearBaseDeDatos();
            CargarCasosGrid();
        }
    }

    private void BuscarCasos()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT c.*, a.Nombre as AbogadoNombre 
                              FROM GM_Casos c 
                              LEFT JOIN GM_Abogados a ON c.AbogadoID = a.AbogadoID 
                              WHERE c.Titulo LIKE @Busqueda 
                                 OR c.ClienteNombre LIKE @Busqueda 
                                 OR c.NumeroCaso LIKE @Busqueda 
                              ORDER BY c.FechaInicio DESC";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Busqueda", "%" + txtBuscarCaso.Text + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                gvCasos.DataSource = dt;
                gvCasos.DataBind();
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error buscando: " + ex.Message, false, "casos");
        }
    }

    // ============ OPERACIONES BD ABOGADOS ============
    private void InsertarAbogado()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO GM_Abogados (Nombre, Especialidad, Email, Telefono, Estado) 
                              VALUES (@Nombre, @Especialidad, @Email, @Telefono, @Estado)";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", txtNombreAbogado.Text);
                cmd.Parameters.AddWithValue("@Especialidad", txtEspecialidad.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailAbogado.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefonoAbogado.Text);
                cmd.Parameters.AddWithValue("@Estado", ddlEstadoAbogado.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                MostrarMensaje("Abogado creado exitosamente", true, "abogados");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "abogados");
        }
    }

    private void ActualizarAbogado()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE GM_Abogados SET 
                              Nombre = @Nombre,
                              Especialidad = @Especialidad,
                              Email = @Email,
                              Telefono = @Telefono,
                              Estado = @Estado
                              WHERE AbogadoID = @AbogadoID";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@AbogadoID", txtAbogadoID.Text);
                cmd.Parameters.AddWithValue("@Nombre", txtNombreAbogado.Text);
                cmd.Parameters.AddWithValue("@Especialidad", txtEspecialidad.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailAbogado.Text);
                cmd.Parameters.AddWithValue("@Telefono", txtTelefonoAbogado.Text);
                cmd.Parameters.AddWithValue("@Estado", ddlEstadoAbogado.SelectedValue);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                    MostrarMensaje("Abogado actualizado exitosamente", true, "abogados");
                else
                    MostrarMensaje("No se encontró el abogado", false, "abogados");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "abogados");
        }
    }

    private void EliminarAbogado()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "DELETE FROM GM_Abogados WHERE AbogadoID = @AbogadoID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@AbogadoID", txtAbogadoID.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                    MostrarMensaje("Abogado eliminado exitosamente", true, "abogados");
                else
                    MostrarMensaje("No se encontró el abogado", false, "abogados");
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error: " + ex.Message, false, "abogados");
        }
    }

    private void CargarAbogado(int abogadoID)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM GM_Abogados WHERE AbogadoID = @AbogadoID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@AbogadoID", abogadoID);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                if (reader.Read())
                {
                    HabilitarFormularioAbogado(true);
                    btnGuardarAbogado.Enabled = true;
                    btnCancelarAbogado.Enabled = true;
                    btnEliminarAbogado.Enabled = true;

                    txtAbogadoID.Text = reader["AbogadoID"].ToString();
                    txtNombreAbogado.Text = reader["Nombre"].ToString();
                    txtEspecialidad.Text = reader["Especialidad"].ToString();
                    txtEmailAbogado.Text = reader["Email"].ToString();
                    txtTelefonoAbogado.Text = reader["Telefono"].ToString();
                    ddlEstadoAbogado.SelectedValue = reader["Estado"].ToString();

                    modoNuevoAbogado = false;
                }
                reader.Close();
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error cargando abogado: " + ex.Message, false, "abogados");
        }
    }

    private void CargarAbogadosGrid()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM GM_Abogados ORDER BY Nombre";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                gvAbogados.DataSource = dt;
                gvAbogados.DataBind();
            }
        }
        catch (Exception)
        {
            CrearBaseDeDatos();
        }
    }

    private void CargarAbogadosCombo()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT AbogadoID, Nombre FROM GM_Abogados WHERE Estado = 'Activo' ORDER BY Nombre";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                ddlAbogadoCaso.DataSource = dt;
                ddlAbogadoCaso.DataTextField = "Nombre";
                ddlAbogadoCaso.DataValueField = "AbogadoID";
                ddlAbogadoCaso.DataBind();
                ddlAbogadoCaso.Items.Insert(0, new ListItem("-- Seleccionar --", ""));
            }
        }
        catch (Exception)
        {
            CrearBaseDeDatos();
        }
    }

    private void BuscarAbogados()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT * FROM GM_Abogados 
                              WHERE Nombre LIKE @Busqueda 
                                 OR Especialidad LIKE @Busqueda 
                              ORDER BY Nombre";
                
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Busqueda", "%" + txtBuscarAbogado.Text + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                gvAbogados.DataSource = dt;
                gvAbogados.DataBind();
            }
        }
        catch (Exception ex)
        {
            MostrarMensaje("Error buscando: " + ex.Message, false, "abogados");
        }
    }

    // ============ CALENDARIO ============
    private void GenerarCalendario()
    {
        lblMesAnio.Text = fechaCalendario.ToString("MMMM yyyy");
        
        DateTime primerDia = new DateTime(fechaCalendario.Year, fechaCalendario.Month, 1);
        int diasMes = DateTime.DaysInMonth(fechaCalendario.Year, fechaCalendario.Month);
        int diaSemana = (int)primerDia.DayOfWeek;
        if (diaSemana == 0) diaSemana = 7; // Domingo = 7
        
        string html = "";
        
        // Días vacíos al inicio
        for (int i = 1; i < diaSemana; i++)
        {
            html += "<div class='calendar-day'></div>";
        }
        
        // Días del mes
        for (int dia = 1; dia <= diasMes; dia++)
        {
            DateTime fechaActual = new DateTime(fechaCalendario.Year, fechaCalendario.Month, dia);
            string clase = "calendar-day";
            
            if (fechaActual.Date == DateTime.Today)
            {
                clase += " today";
            }
            
            // Verificar si hay eventos
            if (TieneEventos(fechaActual))
            {
                clase += " event";
            }
            
            html += $"<div class='{clase}'>{dia}</div>";
        }
        
        litCalendario.Text = html;
        CargarEventosDia(DateTime.Today);
    }

    private bool TieneEventos(DateTime fecha)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT COUNT(*) FROM GM_Calendario WHERE CONVERT(DATE, FechaHora) = @Fecha";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Fecha", fecha.Date);
                
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }

    private void CargarEventosDia(DateTime fecha)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT c.TituloEvento, c.FechaHora, c.TipoEvento, ca.NumeroCaso 
                              FROM GM_Calendario c 
                              LEFT JOIN GM_Casos ca ON c.CasoID = ca.CasoID 
                              WHERE CONVERT(DATE, c.FechaHora) = @Fecha 
                              ORDER BY c.FechaHora";
                
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.Parameters.AddWithValue("@Fecha", fecha.Date);
                
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);
                
                // Crear estructura para GridView
                System.Data.DataTable dtEventos = new System.Data.DataTable();
                dtEventos.Columns.Add("Hora");
                dtEventos.Columns.Add("Evento");
                dtEventos.Columns.Add("Caso");
                
                foreach (System.Data.DataRow row in dt.Rows)
                {
                    DataRow newRow = dtEventos.NewRow();
                    newRow["Hora"] = Convert.ToDateTime(row["FechaHora"]).ToString("HH:mm");
                    newRow["Evento"] = row["TituloEvento"].ToString() + " (" + row["TipoEvento"].ToString() + ")";
                    newRow["Caso"] = row["NumeroCaso"].ToString();
                    dtEventos.Rows.Add(newRow);
                }
                
                gvEventosDia.DataSource = dtEventos;
                gvEventosDia.DataBind();
            }
        }
        catch (Exception)
        {
            // Ignorar errores
        }
    }

    private void CargarEventosHoy()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = @"SELECT c.TituloEvento, c.FechaHora, c.TipoEvento, ca.NumeroCaso 
                              FROM GM_Calendario c 
                              LEFT JOIN GM_Casos ca ON c.CasoID = ca.CasoID 
                              WHERE CONVERT(DATE, c.FechaHora) = CONVERT(DATE, GETDATE())
                              ORDER BY c.FechaHora";
                
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);
                
                // Crear estructura para GridView
                System.Data.DataTable dtEventos = new System.Data.DataTable();
                dtEventos.Columns.Add("Hora");
                dtEventos.Columns.Add("Evento");
                dtEventos.Columns.Add("Caso");
                
                foreach (System.Data.DataRow row in dt.Rows)
                {
                    DataRow newRow = dtEventos.NewRow();
                    newRow["Hora"] = Convert.ToDateTime(row["FechaHora"]).ToString("HH:mm");
                    newRow["Evento"] = row["TituloEvento"].ToString();
                    newRow["Caso"] = row["NumeroCaso"].ToString();
                    dtEventos.Rows.Add(newRow);
                }
                
                gvEventosHoy.DataSource = dtEventos;
                gvEventosHoy.DataBind();
            }
        }
        catch (Exception)
        {
            // Ignorar errores
        }
    }

    // ============ ESTADÍSTICAS ============
    private void CargarEstadisticas()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                
                // Casos activos
                string sqlCasos = "SELECT COUNT(*) FROM GM_Casos WHERE Estado = 'En Proceso'";
                SqlCommand cmdCasos = new SqlCommand(sqlCasos, con);
                lblCasosActivos.Text = cmdCasos.ExecuteScalar().ToString();
                
                // Total abogados
                string sqlAbogados = "SELECT COUNT(*) FROM GM_Abogados";
                SqlCommand cmdAbogados = new SqlCommand(sqlAbogados, con);
                lblTotalAbogados.Text = cmdAbogados.ExecuteScalar().ToString();
                
                // Eventos hoy
                string sqlEventos = "SELECT COUNT(*) FROM GM_Calendario WHERE CONVERT(DATE, FechaHora) = CONVERT(DATE, GETDATE())";
                SqlCommand cmdEventos = new SqlCommand(sqlEventos, con);
                lblEventosHoy.Text = cmdEventos.ExecuteScalar().ToString();
            }
        }
        catch (Exception)
        {
            // Valores por defecto si hay error
            lblCasosActivos.Text = "3";
            lblTotalAbogados.Text = "3";
            lblEventosHoy.Text = "2";
        }
    }

    // ============ UTILIDADES ============
    private void MostrarMensaje(string mensaje, bool esExito, string seccion)
    {
        if (seccion == "casos")
        {
            pnlMsgCasos.Visible = true;
            lblMsgCasos.Text = mensaje;
            pnlMsgCasos.CssClass = esExito ? "message success" : "message error";
        }
        else if (seccion == "abogados")
        {
            pnlMsgAbogados.Visible = true;
            lblMsgAbogados.Text = mensaje;
            pnlMsgAbogados.CssClass = esExito ? "message success" : "message error";
        }
    }
</script>