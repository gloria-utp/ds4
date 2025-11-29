using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Laboratorio123
{
    internal class Calculos
    {

        public double CalcularSemiperimetro(double ladoA, double ladoB, double ladoC)
        {
            double semiperimetro = (ladoA + ladoB + ladoC) / 2;
            return semiperimetro;
        }


        public double CalcularAreaTriangulo(double ladoA, double ladoB, double ladoC)
        {
            double semi = CalcularSemiperimetro(ladoA, ladoB, ladoC);
            double area = Math.Sqrt(semi * (semi - ladoA) * (semi - ladoB) * (semi - ladoC));
            return area;
        }
    }
}