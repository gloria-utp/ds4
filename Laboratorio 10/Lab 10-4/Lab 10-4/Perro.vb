Public Class Perro
    Public nombre As String
    Public raza As String
    Public altura As Double

    Public Sub New()
        Me.nombre = "Desconocido"
        Me.raza = "Desconocida"
        Me.altura = 0.0
    End Sub

    Public Sub New(nombre As String, raza As String, altura As Double)
        Me.nombre = nombre
        Me.raza = raza
        Me.altura = altura
    End Sub

    Public Function comer(carne As String) As String
        Return nombre & " mide " & altura.ToString("0.00") & " metros y comerá " & carne
    End Function

    Public Sub dormir()
    End Sub

    Public Sub ladrar()
    End Sub

    Public Function calcularCosto(costo As Double, impuesto As Double) As Double
        Dim preciototal As Double
        preciototal = costo + (costo * impuesto)
        Return preciototal
    End Function
End Class
