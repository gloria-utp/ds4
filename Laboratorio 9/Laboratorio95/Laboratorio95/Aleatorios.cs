using System;

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

    // Genera un arreglo de números entre dos números
    public int[] GenerarArreglo(int cantidad, int min, int max)
    {
        int[] arreglo = new int[cantidad];
        for (int i = 0; i < cantidad; i++)
            arreglo[i] = GenerarNumero(min, max);
        return arreglo;
    }

    // Genera un arreglo de números no repetidos entre dos números
    public int[] GenerarArregloNoRepetidos(int cantidad, int min, int max)
    {
        if (cantidad > (max - min + 1))
            throw new ArgumentException("Cantidad mayor al rango de números disponibles.");

        int[] arreglo = new int[cantidad];
        int i = 0;

        while (i < cantidad)
        {
            int num = GenerarNumero(min, max);
            bool existe = false;
            for (int j = 0; j < i; j++)
                if (arreglo[j] == num)
                    existe = true;

            if (!existe)
            {
                arreglo[i] = num;
                i++;
            }
        }
        return arreglo;
    }
}
