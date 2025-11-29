using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratorio20
{
    public partial class CRUDProductos : System.Web.UI.Page
    {
        string connectionString = @"Server=.;Database=Productos;Trusted_Connection=True;";
        bool nuevo = true; // Inicializar como true

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigurarEstadoInicial();
            }
        }

        private void ConfigurarEstadoInicial()
        {
            btnNuevo.Enabled = true;
            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;
            btnEliminar.Enabled = false;
            txtId.ReadOnly = true;
            btnBuscar.Enabled = true;
            txtNombre.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
            LimpiarCampos();
            nuevo = true; Reiniciar a true
        }

        protected void BtnNuevo_Click(object sender, EventArgs e)
        {
            btnNuevo.Enabled = false;
            btnGuardar.Enabled = true;
            btnCancelar.Enabled = true;
            btnEliminar.Enabled = false;
            txtId.ReadOnly = true;
            btnBuscar.Enabled = false;
            txtNombre.Enabled = true;
            txtPrecio.Enabled = true;
            txtStock.Enabled = true;

            LimpiarCampos();
            txtNombre.Focus();
            nuevo = true; // Establecer explícitamente como true
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                if (nuevo)
                {
                    InsertarProducto();
                }
                else
                {
                    // Solo validar ID para actualizar, no para nuevo
                    if (string.IsNullOrEmpty(txtId.Text) || !int.TryParse(txtId.Text, out _))
                    {
                        MostrarMensaje("ID inválido para actualizar", false);
                        return;
                    }
                    ActualizarProducto();
                }
                ConfigurarEstadoInicial();
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            ConfigurarEstadoInicial();
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtId.Text) || !int.TryParse(txtId.Text, out _))
            {
                MostrarMensaje("ID inválido para eliminar", false);
                return;
            }
            EliminarProducto();
            ConfigurarEstadoInicial();
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtBuscarId.Text) || !int.TryParse(txtBuscarId.Text, out _))
            {
                MostrarMensaje("Por favor ingrese un ID válido para buscar", false);
                return;
            }

            BuscarProducto();
        }

        // Métodos auxiliares
        private bool ValidarCampos()
        {
            if (string.IsNullOrEmpty(txtNombre.Text))
            {
                MostrarMensaje("El nombre es obligatorio", false);
                return false;
            }

            if (string.IsNullOrEmpty(txtPrecio.Text) || !decimal.TryParse(txtPrecio.Text, out _))
            {
                MostrarMensaje("El precio debe ser un número válido", false);
                return false;
            }

            if (string.IsNullOrEmpty(txtStock.Text) || !float.TryParse(txtStock.Text, out _))
            {
                MostrarMensaje("El stock debe ser un número válido", false);
                return false;
            }

            return true;
        }

        private void LimpiarCampos()
        {
            txtId.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            txtBuscarId.Text = "";
        }

        private void MostrarMensaje(string mensaje, bool esExito)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = mensaje;
            pnlMessage.CssClass = esExito ? "message success" : "message error";
        }

        private void InsertarProducto()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "INSERT INTO Laptops (nombre, precio, stock) VALUES (@Nombre, @Precio, @Stock)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Precio", decimal.Parse(txtPrecio.Text));
                cmd.Parameters.AddWithValue("@Stock", float.Parse(txtStock.Text));

                con.Open();
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                        MostrarMensaje("Registro ingresado correctamente!", true);
                }
                catch (Exception ex)
                {
                    MostrarMensaje("Error: " + ex.Message, false);
                }
            }
        }

        private void ActualizarProducto()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "UPDATE Laptops SET nombre=@Nombre, precio=@Precio, stock=@Stock WHERE id=@Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Precio", decimal.Parse(txtPrecio.Text));
                cmd.Parameters.AddWithValue("@Stock", float.Parse(txtStock.Text));
                cmd.Parameters.AddWithValue("@Id", int.Parse(txtId.Text));

                con.Open();
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                        MostrarMensaje("Registro actualizado correctamente!", true);
                    else
                        MostrarMensaje("No se pudo actualizar el registro", false);
                }
                catch (Exception ex)
                {
                    MostrarMensaje("Error: " + ex.Message, false);
                }
            }
        }

        private void EliminarProducto()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "DELETE FROM Laptops WHERE id=@Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", int.Parse(txtId.Text));

                con.Open();
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                        MostrarMensaje("Registro eliminado correctamente!", true);
                    else
                        MostrarMensaje("No se pudo eliminar el registro", false);
                }
                catch (Exception ex)
                {
                    MostrarMensaje("Error: " + ex.Message, false);
                }
            }
        }

        private void BuscarProducto()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM Laptops WHERE id=@Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", int.Parse(txtBuscarId.Text));

                con.Open();
                try
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        btnNuevo.Enabled = false;
                        btnGuardar.Enabled = true;
                        btnCancelar.Enabled = true;
                        btnEliminar.Enabled = true;
                        txtId.ReadOnly = true;
                        btnBuscar.Enabled = false;
                        txtNombre.Enabled = true;
                        txtPrecio.Enabled = true;
                        txtStock.Enabled = true;

                        txtId.Text = reader["id"].ToString(); 
                        txtNombre.Text = reader["nombre"].ToString(); 
                        txtPrecio.Text = reader["precio"].ToString(); 
                        txtStock.Text = reader["stock"].ToString(); 

                        nuevo = false; // Establecer como false cuando se busca
                        MostrarMensaje("Producto encontrado", true);
                    }
                    else
                    {
                        MostrarMensaje("Ningún registro encontrado con el ID ingresado!", false);
                        ConfigurarEstadoInicial();
                    }
                }
                catch (Exception ex)
                {
                    MostrarMensaje("Error: " + ex.Message, false);
                }
            }
        }
    }
}