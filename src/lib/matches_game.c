#include "matches_game.h"
#include <stdio.h>

void printDescription()
{
    printf("Из кучки, первоначально содержащей 100 спичек, два игрока поочередно берут по несколько спичек: не менее одной и не более десяти.\n");
    printf("Выигрывает тот, кто берет последнюю спичку.\n");
    printf("\nДля возврата в меню нажмите любую клавишу...\n");
    getchar();
}

void playGame()
{
    short matchCount = 100;
    int diff;
    int player = 1;
    printf("Начальное количество спичек: %d\n", matchCount);
    
    do
    {
        printf("\nИгрок %d выбирает спички:\n", player);
        scanf("%d", &diff);
        
        if (diff < 1 || diff > 10)
        {
            printf("Необходимо выбрать количество спичек в диапазоне от 1 до 10\n");
        }
        else
        {
            matchCount -= diff;
            printf("Количество оставшихся спичек: %d\n", matchCount);
            
            if (matchCount <= 0)
            {
                printf("Игрок %d одержал победу!\n", player);
            }
            
            player = (player == 1) ? 2 : 1;
        }
    } while (matchCount > 0);
    
    getchar();
}
