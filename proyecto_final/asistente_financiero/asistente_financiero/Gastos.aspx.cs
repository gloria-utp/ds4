using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Gastos : Page
    {
        string con = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarCategorias();
        }

        private void CargarCategorias()
        {
            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Id, Nombre FROM Categorias", cn);

                cn.Open();
                ddlCategoria.DataSource = cmd.ExecuteReader();
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal monto;

            if (!decimal.TryParse(txtMonto.Text, out monto))
                return;

            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Gastos (CategoriaId, Monto) VALUES (@cat, @monto)", cn);

                cmd.Parameters.AddWithValue("@cat", ddlCategoria.SelectedValue);
                cmd.Parameters.AddWithValue("@monto", monto);

                cn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMensaje.Text = "Gasto registrado correctamente";
            txtMonto.Text = "";
        }
    }
}
