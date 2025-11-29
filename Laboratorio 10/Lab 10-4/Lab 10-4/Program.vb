Imports System

Public Module Program
    Public Sub Main(args As String())
        Dim perrito As Perro = New Perro("Chizu", "Pastor Aleman", 0.7)
        Console.WriteLine(perrito.comer("Carne"))

        Dim perrito2 As Perro = New Perro("Lasy", "", 0.6)
        Console.WriteLine(perrito2.comer("Pollo"))

        Dim perrito3 As Perro = New Perro("Peluchin", "Poodle", 0.5)
        Console.WriteLine(perrito3.comer("Pan"))
    End Sub
End Module
