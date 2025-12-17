using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarDashboard();
        }

        private void CargarDashboard()
        {
            decimal ingresos = ObtenerTotal("Ingresos");
            decimal gastos = ObtenerTotal("Gastos");

            lblIngresos.Text = "$" + ingresos;
            lblGastos.Text = "$" + gastos;
            lblBalance.Text = "$" + (ingresos - gastos);
        }

        private decimal ObtenerTotal(string tabla)
        {
            using (SqlConnection cn =
                new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
            {
                SqlCommand cmd =
                    new SqlCommand($"SELECT ISNULL(SUM(Monto),0) FROM {tabla}", cn);
                cn.Open();
                return Convert.ToDecimal(cmd.ExecuteScalar());
            }
        }
    }
}
