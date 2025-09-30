using System;

// Clase abstracta
public abstract class ClaseAbstracta
{
    // Se fuerza la herencia para definir estos métodos
    protected abstract string tomarValor();
    public abstract string prefixValor(string prefix);

    // Método común
    public void printOut()
    {
        Console.WriteLine(tomarValor());
    }
}

// Clase concreta 1
public class ClaseConcretal : ClaseAbstracta
{
    protected override string tomarValor()
    {
        return "ClaseConcretal";
    }

    public override string prefixValor(string prefix)
    {
        return $"{prefix}ClaseConcretal";
    }
}

// Clase concreta 2
public class ClaseConcreta2 : ClaseAbstracta
{
    protected override string tomarValor()
    {
        return "ClaseConcreta2";
    }

    public override string prefixValor(string prefix)
    {
        return $"{prefix}ClaseConcreta2";
    }
}

internal class Program
{
    private static void Main(string[] args)
    {
        ClaseConcretal concretal = new ClaseConcretal();
        concretal.printOut();
        Console.WriteLine(concretal.prefixValor("ES_"));

        ClaseConcreta2 concreta2 = new ClaseConcreta2();
        concreta2.printOut();
        Console.WriteLine(concreta2.prefixValor("ES_"));

        Console.ReadKey();
    }
}