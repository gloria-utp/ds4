using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Ingresos : Page
    {
        string con = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal monto;
            if (!decimal.TryParse(txtMonto.Text, out monto))
                return;

            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Ingresos (Tipo, Monto) VALUES (@t,@m)", cn);

                cmd.Parameters.AddWithValue("@t", ddlTipo.SelectedValue);
                cmd.Parameters.AddWithValue("@m", monto);

                cn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMensaje.Text = "Ingreso guardado correctamente";
            txtMonto.Text = "";
        }
    }
}
