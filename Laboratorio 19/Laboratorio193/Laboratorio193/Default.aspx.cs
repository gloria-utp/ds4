using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.UI;

namespace Laboratorio193
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGetById_Click(object sender, EventArgs e)
        {
            GetItem(2); 
        }

        private static void GetItem(int id)
        {
            var url = $"https://localhost:44322/api/Values/Get/{id}"; 
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json";
            request.Accept = "application/json";

            try
            {
                using (WebResponse response = request.GetResponse())
                {
                    using (Stream strReader = response.GetResponseStream())
                    {
                        if (strReader == null) return;
                        using (StreamReader objReader = new StreamReader(strReader))
                        {
                            string responseBody = objReader.ReadToEnd();
                            // Do something with responseBody
                            // En web forms necesitamos mostrar en la página
                            HttpContext.Current.Response.Write($"<script>alert('Respuesta: {responseBody}');</script>");
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                // Handle error
                HttpContext.Current.Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}