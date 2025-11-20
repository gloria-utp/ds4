using System;
using System.Web.UI;

namespace Lab_15_4
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Convertir los números
            int num1 = int.Parse(TextBox1.Text);
            int num2 = int.Parse(TextBox2.Text);

            // Sumar
            int suma = num1 + num2;

            // Mostrar resultado
            LabelResultado.Text = suma.ToString();
        }
    }
}
