using System;

class ClaseBase
{
    public void Test()
    {
    }

    public void MasTests()
    {
    }
}

class ClaseHijo : ClaseBase
{
    public void MasTestsHijo()
    {
    }
}

internal class Program
{
    private static void Main(string[] args)
    {
        ClaseHijo hijo = new ClaseHijo();
        hijo.Test();
        hijo.MasTests();
        hijo.MasTestsHijo();

        Console.WriteLine("Corrio la aplicacion");
        Console.ReadKey();
    }
}