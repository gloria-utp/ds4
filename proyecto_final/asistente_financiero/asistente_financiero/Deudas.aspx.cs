using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Deudas : Page
    {
        string con = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Nada al cargar
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            decimal monto;
            int meses;

            if (!decimal.TryParse(txtMonto.Text, out monto))
                return;

            if (!int.TryParse(txtMeses.Text, out meses) || meses <= 0)
                return;

            // Interés anual 24%
            decimal interesMensual = 0.24m / 12;

            // Total a pagar (interés simple)
            decimal total = monto + (monto * interesMensual * meses);

            // Cuota mensual
            decimal cuotaMensual = total / meses;

            // Mostrar resultados
            lblResultado.Text =
                "Total a pagar: $" + total.ToString("N2") +
                "<br/>Cuota mensual: $" + cuotaMensual.ToString("N2");

            // Guardar deuda
            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Deudas (Monto, Interes, Meses) VALUES (@m, 24, @mes)", cn);

                cmd.Parameters.AddWithValue("@m", monto);
                cmd.Parameters.AddWithValue("@mes", meses);

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
