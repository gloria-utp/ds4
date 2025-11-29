using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Laboratorio13
{
    public partial class Form1 : Form
    {
        private readonly string connectionString = @"Server=.;Database=Northwind;TrustServerCertificate=True;Integrated Security=SSPI;";

        public Form1()
        {
            InitializeComponent();
        }

        private void BtnConectarSQL_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                try
                {
                    // Abrir conexión
                    conexion.Open();
                    MessageBox.Show("Se abrió la conexión con el servidor SQL Server y se seleccionó la base de datos");

                    // Consulta para obtener los productos
                    string query = "SELECT ProductName FROM Products";
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        // Ejecutar y leer resultados
                        using (SqlDataReader reader = comando.ExecuteReader())
                        {
                            // Limpiar el ListBox antes de llenarlo
                            ListProducts.Items.Clear();

                            // Leer los datos fila por fila
                            while (reader.Read())
                            {
                                ListProducts.Items.Add(reader["ProductName"].ToString());
                            }
                        }
                    }

                    // Mostrar mensaje de éxito
                    MessageBox.Show($"Se cargaron {ListProducts.Items.Count} productos correctamente");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error al conectar con la base de datos: {ex.Message}",
                                    "Error",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Error);
                }
            }

            MessageBox.Show("Se cerró la conexión");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           
        }
    }
}