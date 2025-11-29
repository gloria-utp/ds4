
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Laboratorio12
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void lblResultado_Click(object sender, EventArgs e)
        {

        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            if (double.TryParse(txtVelocidad.Text, out double velocidad) &&
                double.TryParse(txtTiempo.Text, out double tiempo))
            {
                Metodos m = new Metodos(); // crear instancia
                double distancia = m.CalcularDistancia(velocidad, tiempo);
                txtDistancia.Text = distancia.ToString();
            }
            else
            {
                MessageBox.Show("Ingresa valores válidos.");
            }
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtVelocidad.Text = "";
            txtTiempo.Text = "";
            txtDistancia.Text = "";
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void txtVelocidad_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtTiempo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
