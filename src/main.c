#include <stdio.h>
#include <lib/matches_game.h>

int main()
{
    while (1)
    {
        printf("\n-------------| 100 спичек |-------------\n");
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
                playGame();
                break;
            case 3:
                return 0;
                break;
            default:
                printf("Выберите корректный пункт меню\n");
                break;
        }
    }
    
    return 0;
}
