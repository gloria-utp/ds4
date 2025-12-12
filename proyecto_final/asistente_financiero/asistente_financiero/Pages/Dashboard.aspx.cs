using System;
using System.Web.UI;

public partial class Dashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Configuración inicial
            Page.Title = "Dashboard - Asistente Financiero";

            // Simular datos
            if (lblDeudas != null)
                lblDeudas.InnerText = "3";

            if (lblMonto != null)
                lblMonto.InnerText = "5,000.00";
        }
    }

    protected void btnCalcular_Click(object sender, EventArgs e)
    {
        // Cálculo simple para demostrar funcionamiento
        decimal monto;
        int plazo;

        // Verificar que los controles existen
        if (txtMonto != null && txtPlazo != null)
        {
            if (decimal.TryParse(txtMonto.Value, out monto) &&
                int.TryParse(txtPlazo.Value, out plazo) && plazo > 0)
            {
                decimal pagoDiario = monto / plazo;

                // Mostrar resultado - SIN string interpolation ($)
                string script = "alert('Pago diario requerido: $' + " +
                               pagoDiario.ToString("N2") + ");";

                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Ingresa valores válidos');", true);
            }
        }
    }
}