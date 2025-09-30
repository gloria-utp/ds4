using System;

public interface iTemplate
{
    void ponerVariable(string nombre, string var);
    void verHtml(string template);
}

public class Template : iTemplate
{
    public void ponerVariable(string nombre, string var)
    {
        Console.WriteLine($"Metodo poner variable {nombre} : {var}");
    }

    public void verHtml(string template)
    {
        Console.WriteLine(template);
    }
}

internal class Program
{
    private static void Main(string[] args)
    {
        Template templ = new Template();
        templ.ponerVariable("var1", "Valor 1");
        templ.ponerVariable("var2", "Valor 2");
        templ.ponerVariable("var3", "Valor 3");
        templ.verHtml("<br>Texto de Prueba</br>");

        Console.ReadKey();
    }
}