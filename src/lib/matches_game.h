#include <stdbool.h>
#include <stdio.h>

#ifndef MATCHES_GAME_H
#define MATCHES_GAME_H

void printDescription();
void playGame();
void changePlayer(int* playerNumber);
bool isInputCorrect(int* diff);

#endif
