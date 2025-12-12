using System;
using System.Web.UI;

namespace asistente_financiero
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Configuración simple - sin referencia a SiteMaster
            if (!IsPostBack)
            {
                Page.Title = "Inicio - Asistente Financiero";
            }
        }
    }
}