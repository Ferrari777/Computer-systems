using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2
{
    class Program
    {
        static void Main(string[] args)
        {
            Division division = new Division();
            division.GetInputData();
            division.Divide();
            Console.WriteLine($"Fraction: {division.Fraction}\nRemainder: {division.Remainder}");

            Console.ReadKey();
        }
    }
}
