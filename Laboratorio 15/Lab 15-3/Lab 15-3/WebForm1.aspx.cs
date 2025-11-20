using System;
using System.Web.UI;

namespace Lab_15_3
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string text = TextBox1.Text;

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg",
                $"alert('Hola {text}');",
                true
            );
        }
    }
}
