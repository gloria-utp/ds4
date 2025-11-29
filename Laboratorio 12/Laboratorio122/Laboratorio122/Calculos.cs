using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Laboratorio122
{
    internal class Calculos
    {

        public double CalcularPromedio(double nota1, double nota2, double nota3)
        {
            double promedio = (nota1 + nota2 + nota3) / 3;
            return promedio;
        }

    }
}