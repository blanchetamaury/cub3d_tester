#!/bin/bash

RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
CYAN="\e[0;36m"
RESET="\e[0m"

printf "$CYAN              __   _____     __   ______          __           \n$RESET"
printf "$CYAN  _______  __/ /_ |__  /____/ /  /_  __/__  _____/ /____  _____\n$RESET"
printf "$CYAN / ___/ / / / __ \ /_ </ __  /    / / / _ \/ ___/ __/ _ \/ ___/\n$RESET"
printf "$CYAN/ /__/ /_/ / /_/ /__/ / /_/ /    / / /  __(__  ) /_/  __/ /    \n$RESET"
printf "$CYAN\___/\__,_/_.___/____/\__,_/    /_/  \___/____/\__/\___/_/     \n$RESET"

function test() {
    local filename="$1"

    bash -c "timeout -s KILL 1 ./cub3d \"$filename\" 1>/dev/null 2>/tmp/cub3d_test_result" 2>/dev/null

    local status=$?

    if [[ "$filename" == *"OK.cub" ]]; then
        if [ $status -eq 137 ]; then
            printf "\r│ TEST %02d :$GREEN OK$RESET                 │\n" "$NUM_TESTS"
        else
            printf "\r│ TEST %02d :$RED KO$RESET                 │\n" "$NUM_TESTS"
        fi
    else
        if [ $status -eq 137 ]; then
            printf "\r│ TEST %02d :$RED KO$RESET                 │\n" "$NUM_TESTS"
        else
            printf "\r│ TEST %02d :$GREEN OK$RESET                 │\n" "$NUM_TESTS"
        fi
    fi
}

function header() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 01 │ Header                  │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 01 │ Header                  │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/header/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function color() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 02 │ Color                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 02 │ Color                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/color/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function map() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 03 │ Map                     │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 03 │ Map                     │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/map/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function bonus() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 04 │ Bonus                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 04 │ Bonus                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/bonus/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

if [[ "$1" == "-help" ]]; then
    echo
    echo "Header = -h, Color = -c, Map = -m, Manda = -ma, Bonus = -b, all = -a"
    exit 0
fi

if [[ "$1" == "-h" ]]; then
    header "TRUE" "TRUE"
fi

if [[ "$1" == "-c" ]]; then
    color "TRUE" "TRUE"
fi

if [[ "$1" == "-m" ]]; then
    map "TRUE" "TRUE"
fi

if [[ "$1" == "-ma" ]]; then
    header "TRUE" "FALSE"
    color "FALSE" "FALSE"
    map "FALSE" "TRUE"
fi

if [[ "$1" != -* ]]; then
    header "TRUE" "FALSE"
    color "FALSE" "FALSE"
    map "FALSE" "TRUE"
fi

if [[ "$1" == "-b" ]]; then
    bonus "TRUE" "TRUE"
fi