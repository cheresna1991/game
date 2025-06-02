#define TEST_STRING_H
#include <doctest/doctest.h>
#include "tests/test_macros.h"

int nedocrit(float current_health, float damage) {
    float koef = 0.5;
    
    if (current_health <= 50) {
        koef = 2;
    }
    
    if (damage <= 0) {
        return damage * -1;
    }
    
    return damage * koef;
}

TEST_CASE("crit") {
    CHECK(nedocrit(100, 10) == 5);
    CHECK(nedocrit(49, 1) == 2);
    CHECK(nedocrit(5, -1) == 10);
}

int heal(int player_health, int potion) {
    if (potion <= 0) {
        return player_health;
    }
    
    if (player_health <= 0) {
        return 0;
    }
    
    return player_health + potion;
}

TEST_CASE("heal") {
    CHECK(heal(0, 1) == 0);
    CHECK(heal(100, 10) == 110);
    CHECK(heal(5, -1) == 5);
}

int coin(int tek_coin, int new_coin) {
    if (new_coin <= 0) {
        return tek_coin;
    }
    
    return tek_coin + new_coin;
}

TEST_CASE("adding_coins") {
    CHECK(coin(0, 1) == 1);
    CHECK(coin(100, 10) == 110);
    CHECK(coin(5, -1) == 5);
}
