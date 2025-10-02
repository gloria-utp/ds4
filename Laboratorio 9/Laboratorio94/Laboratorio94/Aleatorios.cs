using System;
using System.Collections.Generic;

namespace Laboratorio94
{
    public class Aleatorios
    {
        private Random random;

        public Aleatorios()
        {
            random = new Random();
        }

        // Genera un número entre dos números
        public int GenerarNumero(int min, int max)
        {
            return random.Next(min, max + 1);
        }

        // Genera un arreglo de números entre dos números aleatorios
        public int[] GenerarArreglo(int cantidad, int min, int max)
        {
            int[] arreglo = new int[cantidad];
            for (int i = 0; i < cantidad; i++)
            {
                arreglo[i] = GenerarNumero(min, max);
            }
            return arreglo;
        }
    }
}
