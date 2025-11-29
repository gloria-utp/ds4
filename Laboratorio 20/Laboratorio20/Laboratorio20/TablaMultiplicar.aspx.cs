using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratorio20
{
    public partial class TablaMultiplicar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnGenerar_Click(object sender, EventArgs e) // Cambiado a PascalCase
        {
            if (int.TryParse(txtNumero.Text, out int numero))
            {
                GenerarTablaMultiplicar(numero);
                tblTabla.Visible = true;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor ingrese un número válido');", true);
            }
        }

        private void GenerarTablaMultiplicar(int numero)
        {
            tblTabla.Rows.Clear();

            // Encabezado - CORREGIDO: Font-Bold se aplica diferente en Web Forms
            TableRow headerRow = new TableRow();

            TableCell cell1 = new TableCell();
            cell1.Text = "Multiplicación";
            cell1.Font.Bold = true; // Forma correcta

            TableCell cell2 = new TableCell();
            cell2.Text = "Resultado";
            cell2.Font.Bold = true; // Forma correcta

            headerRow.Cells.Add(cell1);
            headerRow.Cells.Add(cell2);
            tblTabla.Rows.Add(headerRow);

            // Filas de la tabla
            for (int i = 1; i <= 25; i++)
            {
                TableRow row = new TableRow();

                TableCell cellMulti = new TableCell();
                cellMulti.Text = $"{numero} x {i}";

                TableCell cellResult = new TableCell();
                cellResult.Text = (numero * i).ToString();

                row.Cells.Add(cellMulti);
                row.Cells.Add(cellResult);
                tblTabla.Rows.Add(row);
            }
        }
    }
}