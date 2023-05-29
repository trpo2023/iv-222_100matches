#include <ctest.h>
#include <lib/matches_game.h>

CTEST(ctest, CHECK_PLAYER_CHANGE) {
  int player = 1;
  int expected = 2;
  changePlayer(&player);
  ASSERT_EQUAL(expected, player);
  
  player = 2;
  expected = 1;
  changePlayer(&player);
  ASSERT_EQUAL(expected, player);
}

CTEST(ctest, CHECK_USER_INPUT) {
  int diff = 100;
  bool real = isInputCorrect(&diff);
  ASSERT_FALSE(real);

  diff = 0;
  real = isInputCorrect(&diff);
  ASSERT_FALSE(real);

  diff = 1;
  real = isInputCorrect(&diff);
  ASSERT_TRUE(real);

  diff = 5;
  real = isInputCorrect(&diff);
  ASSERT_TRUE(real);

  diff = 10;
  real = isInputCorrect(&diff);
  ASSERT_TRUE(real);
}