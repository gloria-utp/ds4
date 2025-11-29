
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.MonthCalendar;

namespace Laboratorio123
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSemiperimetro_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los valores del formulario
                double ladoA = double.Parse(txtLadoA.Text);
                double ladoB = double.Parse(txtLadoB.Text);
                double ladoC = double.Parse(txtLadoC.Text);

                // Crear una instancia de la clase Calculos
                Calculos calc = new Calculos();

                // Llamar al método que hace el cálculo
                double semiperimetro = calc.CalcularSemiperimetro(ladoA, ladoB, ladoC);

                // Mostrar el resultado
                txtSemiperimetro.Text = semiperimetro.ToString("F2");
            }
            catch (FormatException)
            {
                MessageBox.Show("Por favor, ingrese solo números válidos.", "Error de formato");
            }
        }

        private void btnArea_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los valores del formulario
                double ladoA = double.Parse(txtLadoA.Text);
                double ladoB = double.Parse(txtLadoB.Text);
                double ladoC = double.Parse(txtLadoC.Text);

                // Crear una instancia de la clase Calculos
                Calculos calc = new Calculos();

                // Llamar al método que hace el cálculo
                double area = calc.CalcularAreaTriangulo(ladoA, ladoB, ladoC);

                // Mostrar el resultado
                txtArea.Text = area.ToString("F2");
            }
            catch (FormatException)
            {
                MessageBox.Show("Por favor, ingrese solo números válidos.", "Error de formato");
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {

            txtLadoA.Text = "";
            txtLadoB.Text = "";
            txtLadoC.Text = "";
            txtArea.Text = "";
            txtSemiperimetro.Text = "";

        }

        private void btnSalida_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
