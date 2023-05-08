#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

void printDescription()
{
    printf("Из кучки, первоначально содержащей 100 спичек, два игрока поочередно берут по несколько спичек: не менее одной и не более десяти.\n");
    printf("Выигрывает тот, кто берет последнюю спичку.\n");
    printf("\nДля возврата в меню нажмите любую клавишу...");
    getch();
}

void game()
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
            printf("Необходимо выбрать количество спичек в диапозоне от 1 до 10\n");
        }
        else
        {
            matchCount -= diff;
            printf("Количество оставшихся спичек: %d\n", matchCount);
            
            if (matchCount <= 0)
            {
                printf("Игрок %d одержал победу!\n", player);
            }

            if (player == 1) 
            {
                player = 2;
            } else {
                player = 1;
            }
        }
    } while (matchCount > 0);
    getch();
}

int main()
{
    bool isExit = false;
    while (!isExit)
    {
        printf("-------------| 100 спичек |-------------\n");
        printf("1. Описание игры\n");
        printf("2. Игра\n");
        printf("3. Выход\n");
        int selectedOption = 0;
        scanf("%d", &selectedOption);
        switch (selectedOption)
        {
        case 1:
            printDescription();
            break;
        case 2:
            game();
            break;
        case 3:
            isExit = true;
            break;
        default:
            printf("Выберите корректный пункт меню\n");
            break;
        }
    }
    return 0;
}
