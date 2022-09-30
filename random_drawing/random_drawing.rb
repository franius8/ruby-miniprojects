candidates = ["Milena Sroka", "Paweł Adamiak", "Szymon Gatkowski", "Mateusz Bednarczyk",
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
     "Hubert Glinski", "Łużek Podłoga Yd"]
result = []

10000.times {result << candidates.sample}

result.tally.to_h.sort_by {|key, value| value}.reverse!.each {|key, value| puts "Osobnik: #{key} Wygranych losowań:#{value}"}