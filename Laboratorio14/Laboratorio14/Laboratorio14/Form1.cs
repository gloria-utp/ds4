using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace Laboratorio14
{
    public partial class FrmProductos : Form
    {
        public FrmProductos()
        {
            InitializeComponent();
            tsbNuevo.Enabled = true;
            tsbGuardar.Enabled = false;
            tsbCancelar.Enabled = false;
            tsbEliminar.Enabled = false;
            txtId.Enabled = false;
            tsbBuscar.Enabled = true;
            txtNombre.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
           
        }
        string connectionString = @"Server=.\sqlexpress;Database=Productos;Trusted_Connection=True;";
        bool nuevo;
 
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void tbsNuevo_Click(object sender, EventArgs e)
        {
            tsbNuevo.Enabled = false;
            tsbGuardar.Enabled = true;
            tsbCancelar.Enabled = true;
            tsbEliminar.Enabled = false;
            txtId.Enabled = false;
            tsbBuscar.Enabled = false;
            txtNombre.Enabled = true;
            txtPrecio.Enabled = true;
            txtStock.Enabled = true;
            txtNombre.Focus();
            nuevo = true;

        }

        private void tbsGuardar_Click(object sender, EventArgs e)
        {
            if (nuevo)
            {
                string sql = "INSERT INTO LAPTOPS (NOMBRE, PRECIO, STOCK) " +
                    "VALUES ('" + txtNombre.Text + "' , '" + txtPrecio.Text + "', '" + txtStock.Text + "')";

                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                        MessageBox.Show("Registro insertado correctamente !");
                    }
                catch (Exception ex)
                {
                    MessageBox.Show("Error  " + ex.ToString());
                }
                finally
                {
                    con.Close();
                }

            }
            else
            {
                string sql = "UPDATE LAPTOPS SET NOMBRE='" + txtNombre.Text + 
                    "', PRECIO='" + txtPrecio.Text + "', STOCK='" + 
                    txtStock.Text + "' WHERE ID=" + txtId.Text + "";

                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                        MessageBox.Show("Registro actualizado correctamente !");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error  " + ex.ToString());
                }
                finally
                {
                    con.Close();
                }
            }
            tsbNuevo.Enabled = true;
            tsbGuardar.Enabled = false;
            tsbCancelar.Enabled = false;
            tsbEliminar.Enabled = false;
            txtId.Enabled = true;
            tsbBuscar.Enabled = true;
            txtNombre.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
            txtId.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";

        }

        private void tbsCancelar_Click(object sender, EventArgs e)
        {
            tsbNuevo.Enabled = true;
            tsbGuardar.Enabled = false;
            tsbCancelar.Enabled = false;
            tsbEliminar.Enabled = false;
            txtId.Enabled = true;
            tsbBuscar.Enabled = true;
            txtNombre.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
            txtId.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = ""; 

        }

        private void tbsEliminar_Click(object sender, EventArgs e)
        {
            string sql = "delete from LAPTOPS where id=" + this.txtId.Text + "";
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            try
            {
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                    MessageBox.Show("Registro eliminado correctamente !");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error  " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
            tsbNuevo.Enabled = true;
            tsbGuardar.Enabled = false;
            tsbCancelar.Enabled = false;
            tsbEliminar.Enabled = false;
            txtId.Enabled = true;
            tsbBuscar.Enabled = true;
            txtNombre.Enabled = false;
            txtPrecio.Enabled = false;
            txtStock.Enabled = false;
            txtId.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";

        }

        private void tstId_TextChanged(object sender, EventArgs e)
        {

        }

        private void tsbBuscar_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM LAPTOPS WHERE ID=" + tstId.Text;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            SqlDataReader reader;
            con.Open();
            try
            {
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    tsbNuevo.Enabled = false;
                    tsbGuardar.Enabled = true;
                    tsbCancelar.Enabled = true;
                    tsbEliminar.Enabled = true;
                    txtId.Enabled = false;
                    tsbBuscar.Enabled = false;
                    txtNombre.Enabled = true;
                    txtPrecio.Enabled = true;
                    txtStock.Enabled = true;
                    txtNombre.Focus();
                    txtId.Text = reader[0].ToString();
                    txtNombre.Text = reader[1].ToString();
                    txtPrecio.Text = reader[2].ToString();
                    txtStock.Text = reader[3].ToString();
                    nuevo = false;
                }
                else
                {
                    MessageBox.Show("Ningun registro encontrado con el Id ingreasado !");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error  " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
            tstId.Text = "";

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtId_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void txtPrecio_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtStock_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();

        }
    }
}
