using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Lab17
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Obtener el connectionString
            ConnectionStringSettings connString =
                ConfigurationManager.ConnectionStrings["db.Name"];

            // Crear la conexión
            using (SqlConnection conexion = new SqlConnection(connString.ConnectionString))
            using (SqlCommand cmd = new SqlCommand("SalesByCategory", conexion))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Parámetros
                cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar)
                               .Value = "Seafood";

                conexion.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    GridV.DataSource = reader;
                    GridV.DataBind();
                }
            }
        }
    }
}
