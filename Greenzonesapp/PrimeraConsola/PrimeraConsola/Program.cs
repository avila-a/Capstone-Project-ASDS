using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;



namespace PrimeraConsola2
{
    class Program
    {
        static void Main(string[] args)
        {
            string key_raw = Console.ReadLine();
            string salt_raw = Console.ReadLine();
            Console.WriteLine(new Rfc2898DeriveBytes(key_raw, Encoding.ASCII.GetBytes(salt_raw)));
        }
    }
}