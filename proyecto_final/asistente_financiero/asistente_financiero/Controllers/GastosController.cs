using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Http;

namespace asistente_financiero.Controllers
{
    public class GastosController : ApiController
    {
        string con = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        [HttpGet]
        public List<string> Get()
        {
            List<string> lista = new List<string>();

            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT c.Nombre, g.Monto FROM Gastos g JOIN Categorias c ON g.CategoriaId=c.Id",
                    cn
                );

                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(dr[0] + " - $" + dr[1]);
                }
            }
            return lista;
        }

        [HttpPost]
        public void Post(int categoriaId, decimal monto)
        {
            using (SqlConnection cn = new SqlConnection(con))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Gastos(CategoriaId, Monto) VALUES(@c,@m)",
                    cn
                );
                cmd.Parameters.AddWithValue("@c", categoriaId);
                cmd.Parameters.AddWithValue("@m", monto);
                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
