using System;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.Write("Ingrese lado 1: ");
        double a = double.Parse(Console.ReadLine());
        Console.Write("Ingrese lado 2: ");
        double b = double.Parse(Console.ReadLine());
        Console.Write("Ingrese lado 3: ");
        double c = double.Parse(Console.ReadLine());

        if (a + b > c && a + c > b && b + c > a)
        {
            if (a == b && b == c)
                Console.WriteLine("Triángulo Equilátero");
            else if (a == b || a == c || b == c)
                Console.WriteLine("Triángulo Isósceles");
            else
                Console.WriteLine("Triángulo Escaleno");
        }
        else
        {
            Console.WriteLine("Los valores no forman un triángulo válido.");
        }

        Console.ReadKey();
    }
}
