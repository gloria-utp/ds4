using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Laboratorio122
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtener los valores del formulario
                double nota1 = double.Parse(txtNota1.Text);
                double nota2 = double.Parse(txtNota2.Text);
                double nota3 = double.Parse(txtNota3.Text);

                // Crear una instancia de la clase Calculos
                Calculos calc = new Calculos();

                // Llamar al método que hace el cálculo
                double promedio = calc.CalcularPromedio(nota1, nota2, nota3);

                // Mostrar el resultado
                txtPromedio.Text = promedio.ToString("F2");
            }
            catch (FormatException)
            {
                MessageBox.Show("Por favor, ingrese solo números válidos.", "Error de formato");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            txtNota1.Text = "";
            txtNota2.Text = "";
            txtNota3.Text = "";
            txtPromedio.Text = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}