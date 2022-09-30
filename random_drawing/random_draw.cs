using System;
using System.Collections.Generic;
using System.Linq;
 
namespace Randomizer
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            var random = new Random();
            string[] candidatesArray =
            {
                "Milena Sroka", "Paweł Adamiak", "Szymon Gatkowski", "Mateusz Bednarczyk",
				"Gabriel Grot", "Sara Małź", "Szymon Gruszka", "Mariusz Paluszkiewicz",
				"Jacek Adach", "Emilka Głuszak", "Maciek Gniewosz", "Dominika Wołyniec",
				"Milena Natalia Kruczek", "Mateusz Rozbicki", "Maciej Patoka", "Kuba Starzyński",
				"Michał Beczka", "Michał Król", "Dawid Filipiak", "Kuba Nabiałek",
				"Jarosław Hołub", "Maciek Krasnobembski", "Jacek Gladysiak", "Kuba Słupik",
				"Piotr Padamczyk", "Kacper Wasiak", "Jasiek Karasek", "Dominika Zelińska",
				 "Karol Kumorek", "Marcel Proskura", "Jakub Wesołek", "Weronika Szukalska",
				"Olek Kłosowski", "Olaf Dzienkowski", "Paweł Piojda", "Paweł Pelc",
				"Carek Kuźnicki", "Jakub Chromik", "Damian Wierzbicki", "Adi Ambroziak",
				"Eryk Ormanty", "Wiktoria Ostrowska", "Klaudia Janeczek", "Bartosz Gembalczyk",
				 "Hanna Świerzbin", "Olaf Porzucek", "Anita Wiszowata", "Maks Spychalski",
				 "Hubert Glinski", "Łużek Podłoga Yd"
            };
            var resultList = new List<string>();
 
            for (var r = 0; r < 1000; r++) resultList.Add(candidatesArray[random.Next(candidatesArray.Length)]);
 
            var fixedResultList = resultList.GroupBy(x => x)
                .Select(y => new {Value = y.Key, Count = y.Count()})
                .OrderByDescending(x => x.Count);
 
            foreach (var f in fixedResultList)
                Console.WriteLine("Osobnik: @" + f.Value + ", Wygranych losowań: " + f.Count);
        }
    }
}