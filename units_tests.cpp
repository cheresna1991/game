#define TEST_STRING_H
#include <doctest/doctest.h>
#include "tests/test_macros.h"
//Тестируем функцию для критических атака
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
//Тестируем функцию для лечения персонажей
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
//Тестируем функцию для подбора монет
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

//Тестируем диапозон
int random(int n) {
    var rng = RandomNumberGenerator.new();
    var m = rng.randf_range(0, 10);
    
    if (n < 0 && m >= 0) {
        n = 0;
    }
    
    return n + m;
}

TEST_CASE("проверка_что_неотрицаетельное_и_тд") {
    CHECK(random(100) <= 110);
    CHECK(nedocrit(-55) >= 0);
}

//Тестируем функцию для нанесения урона
bool is_alive(int player_health, int damage) {
    if (player_health - damage <= 0) {
        return false;
    } else {
        return true;
    }
}

TEST_CASE("soset_li_hui") {
    CHECK(is_alive(10, 50) == false);
    CHECK(is_alive(50, 10) == true);
}

