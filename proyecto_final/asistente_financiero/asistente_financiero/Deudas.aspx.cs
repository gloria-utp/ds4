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

            if (!int.TryParse(txtMeses.Text, out meses))
                return;

            decimal interesMensual = 0.24m / 12;
            decimal total = monto + (monto * interesMensual * meses);

            lblResultado.Text = "Total a pagar: $" + total;

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
