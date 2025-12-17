using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Default : Page
    {
        public decimal IngresosJS { get; set; }
        public decimal GastosJS { get; set; }

        // NUEVOS (categorías)
        public string CategoriasJS { get; set; }
        public string MontosCategoriasJS { get; set; }

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

            IngresosJS = ingresos;
            GastosJS = gastos;

            CargarGastosPorCategoria();
        }

        private decimal ObtenerTotal(string tabla)
        {
            using (SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
            {
                SqlCommand cmd =
                    new SqlCommand($"SELECT ISNULL(SUM(Monto),0) FROM {tabla}", cn);

                cn.Open();
                return Convert.ToDecimal(cmd.ExecuteScalar());
            }
        }

        private void CargarGastosPorCategoria()
        {
            StringBuilder categorias = new StringBuilder();
            StringBuilder montos = new StringBuilder();

            using (SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["DB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT c.Nombre, SUM(g.Monto) Total
                    FROM Gastos g
                    INNER JOIN Categorias c ON g.CategoriaId = c.Id
                    GROUP BY c.Nombre", cn);

                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    categorias.Append("'" + dr["Nombre"] + "',");
                    montos.Append(dr["Total"] + ",");
                }
            }

            CategoriasJS = categorias.ToString().TrimEnd(',');
            MontosCategoriasJS = montos.ToString().TrimEnd(',');
        }
    }
}
