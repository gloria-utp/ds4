using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratorio20
{
    public partial class MatrizDiagonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnGenerarMatriz_Click(object sender, EventArgs e) // PascalCase
        {
            if (int.TryParse(txtDimension.Text, out int n) && n > 0)
            {
                GenerarMatrizDiagonal(n);
                pnlMatriz.Visible = true;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor ingrese una dimensión válida (1-20)');", true);
            }
        }

        private void GenerarMatrizDiagonal(int n)
        {
            tblMatriz.Rows.Clear();

            for (int i = 0; i < n; i++)
            {
                TableRow row = new TableRow();

                for (int j = 0; j < n; j++)
                {
                    TableCell cell = new TableCell();

                    // Diagonal inversa: cuando i + j = n - 1
                    if (i + j == n - 1)
                    {
                        cell.Text = "1";
                        cell.CssClass = "one";
                    }
                    else
                    {
                        cell.Text = "0";
                    }

                    row.Cells.Add(cell);
                }

                tblMatriz.Rows.Add(row);
            }
        }
    }
}