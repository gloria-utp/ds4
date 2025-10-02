using System;

internal class Program
{
    private static void Main(string[] args)
    {
        Aleatorios aleatorio = new Aleatorios();

        // Genera un número aleatorio entre 1 y 100
        int numero = aleatorio.GenerarNumero(1, 100);
        Console.WriteLine($"Número aleatorio: {numero}");

        // Genera un arreglo de 10 números aleatorios entre 1 y 100
        int[] arreglo = aleatorio.GenerarArreglo(10, 1, 100);
        Console.WriteLine("Arreglo de números aleatorios:");
        foreach (int n in arreglo)
            Console.Write(n + " ");
        Console.WriteLine();

        // Genera un arreglo de 10 números aleatorios no repetidos entre 1 y 100
        int[] arregloNoRepetidos = aleatorio.GenerarArregloNoRepetidos(10, 1, 100);
        Console.WriteLine("Arreglo de números no repetidos:");
        foreach (int n in arregloNoRepetidos)
            Console.Write(n + " ");
    }
}
