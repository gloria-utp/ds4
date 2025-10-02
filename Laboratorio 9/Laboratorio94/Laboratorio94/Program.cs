using System;

namespace Laboratorio94
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            Aleatorios aleatorio = new Aleatorios();

            int numero = aleatorio.GenerarNumero(1, 100);
            Console.WriteLine("Número aleatorio entre 1 y 100: " + numero);

            int[] arreglo = aleatorio.GenerarArreglo(5, 10, 50);
            Console.WriteLine("Arreglo de números aleatorios:");
            foreach (var n in arreglo)
            {
                Console.Write(n + " ");
            }

            Console.ReadKey();
        }
    }
}
