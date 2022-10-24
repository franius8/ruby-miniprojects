#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void ReverseBubbleSort(char *names[], int *drawsWon, size_t len);

int main ( void ) {
  srand(time(NULL));
  
  char *ary[] =
  {       "Milena Sroka", "Pawel Adamiak", "Szymon Gatkowski", "Mateusz Bednarczyk",
          "Gabriel Grot", "Sara Małź", "Szymon Gruszka", "Mariusz Paluszkiewicz",
          "Jacek Adach", "Emilka Głuszak", "Maciek Gniewosz", "Dominika Wołyniec",
          "Milena Natalia Kruczek", "Mateusz Rozbicki", "Maciej Patoka", "Kuba Starzyński",
          "Michał Beczka", "Michał Król", "Dawid Filipiak", "Kuba Nabiałek",
          "Jarosław Hołub", "Maciek Krasnobembski", "Jacek Gladysiak", "Kuba Słupik",
          "Piotr Padamczyk", "Kacper Wasiak", "Jasiek Karasek", "Dominika Zelińska",
          "Karol Kumorek", "Marcel Proskura", "Jakub Wesołek", "Weronika Szukalska",
          "Olek Kłosowski", "Olaf Dzienkowski", "Paweł Piojda", "Paweł Pelc",
          "Czarek Kuźnicki", "Jakub Chromik", "Damian Wierzbicki", "Adi Ambroziak",
          "Eryk Ormanty", "Wiktoria Ostrowska", "Klaudia Janeczek", "Bartosz Gembalczyk",
          "Hanna Świerzbin", "Olaf Porzucek", "Anita Wiszowata", "Maks Spychalski",
          "Hubert Glinski", "Łużek Podłoga Yd"
  };

  size_t n = sizeof(ary) / sizeof(ary[0]);

  int number_ary[50] = {0};

  int i;
  int random_ary_index;
  
  for (i = 0; i <= 100000; i++) {
    random_ary_index = rand() % (n + 1 - 0) + 0;
    number_ary[random_ary_index]++;
  };
  
  ReverseBubbleSort( ary, number_ary, n);

  for(i = 0; i < n; i++) {
    printf("Osobnik @%-20s\t", ary[i]);
    printf("Wygranych losowań: %i", number_ary[i]);
    printf("\n");
  };
  
}

void ReverseBubbleSort(char *names[], int *drawsWon, size_t len) {
  int tempNumber;
  char* temp_name;
  for (size_t pass = 0; pass < len - 1; ++pass) {
    for (size_t n = 0; n < len - 1; ++n) {
      if (drawsWon[n] > drawsWon[n + 1]) {
        tempNumber = drawsWon[n];
        drawsWon[n] = drawsWon[n + 1];
        drawsWon[n + 1] = tempNumber;

        temp_name = names[n];
        names[n] = names[n + 1];
        names[n + 1] = temp_name;
      };
    };
  };
}