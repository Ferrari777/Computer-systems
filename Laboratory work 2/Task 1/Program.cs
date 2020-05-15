using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1
{
    class Program
    {
        static void Main(string[] args)
        {
            Mult data = new Mult();
            data.GetInputData();
            long result = data.Multiply();
            Console.WriteLine($"\nResult: {result}");

            Console.ReadKey();
        }
    }
}
