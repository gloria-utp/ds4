using System;

internal class Program
{
    private static void Main(string[] args)
    {
        try
        {
            Console.Write("Ingrese el precio del producto (valor positivo): ");
            double precio = double.Parse(Console.ReadLine());

            if (precio <= 0)
            {
                Console.WriteLine("El precio debe ser mayor que 0.");
                return;
            }

            Console.Write("Ingrese la forma de pago (efectivo/tarjeta): ");
            string formaPago = Console.ReadLine().ToLower();

            if (formaPago == "tarjeta")
            {
                Console.Write("Ingrese el número de cuenta (16 dígitos): ");
                string cuenta = Console.ReadLine();

                if (cuenta.Length == 16 && long.TryParse(cuenta, out _))
                    Console.WriteLine($"Compra registrada con tarjeta. Precio: {precio}, Cuenta: {cuenta}");
                else
                    Console.WriteLine("Número de cuenta inválido.");
            }
            else if (formaPago == "efectivo")
            {
                Console.WriteLine($"Compra registrada en efectivo. Precio: {precio}");
            }
            else
            {
                Console.WriteLine("Método de pago inválido.");
            }
        }
        catch (FormatException)
        {
            Console.WriteLine("Formato de número inválido.");
        }

        Console.ReadKey();
    }
}
