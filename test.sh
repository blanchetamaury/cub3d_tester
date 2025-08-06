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

    for file in ./tests/header/*.cub; do
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

    for file in ./tests/color/*.cub; do
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

    for file in ./tests/map/*.cub; do
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

    for file in ./tests/bonus/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function parsing() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 05 │ Parsing                 │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 05 │ Parsing                 │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/parsing/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function floodfill() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 06 │ Flood Fill              │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 06 │ Flood Fill              │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/floodfill/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function graphics() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 07 │ Graphics                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 07 │ Graphics                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/graphics/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function input_validation() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 08 │ Input Validation        │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 08 │ Input Validation        │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/input_validation/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function memory() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 09 │ Memory                  │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 09 │ Memory                  │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/memory/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function performance() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 10 │ Performance             │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 10 │ Performance             │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/performance/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function boundary() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 11 │ Boundary                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 11 │ Boundary                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/boundary/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function error_handling() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 12 │ Error Handling          │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 12 │ Error Handling          │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/error_handling/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function textures() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 13 │ Textures                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 13 │ Textures                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/textures/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function coordinates() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 14 │ Coordinates             │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 14 │ Coordinates             │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/coordinates/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function player_position() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 15 │ Player Position         │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 15 │ Player Position         │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/player_position/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function walls() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 16 │ Walls                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 16 │ Walls                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/walls/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function doors() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 17 │ Doors                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 17 │ Doors                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/doors/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function sprites() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 18 │ Sprites                 │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 18 │ Sprites                 │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/sprites/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function lighting() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 19 │ Lighting                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 19 │ Lighting                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/lighting/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function shadows() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 20 │ Shadows                 │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 20 │ Shadows                 │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/shadows/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function minimap() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 21 │ Minimap                 │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 21 │ Minimap                 │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/minimap/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function mouse() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 22 │ Mouse                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 22 │ Mouse                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/mouse/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function keyboard() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 23 │ Keyboard                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 23 │ Keyboard                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/keyboard/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function rotation() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 24 │ Rotation                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 24 │ Rotation                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/rotation/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function movement() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 25 │ Movement                │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 25 │ Movement                │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/movement/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function collision() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 26 │ Collision               │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 26 │ Collision               │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/collision/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function raycasting() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 27 │ Raycasting              │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 27 │ Raycasting              │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/raycasting/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function fov() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 28 │ FOV                     │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 28 │ FOV                     │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/fov/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function resolution() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 29 │ Resolution              │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 29 │ Resolution              │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/resolution/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function fps() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 30 │ FPS                     │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 30 │ FPS                     │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/fps/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function sound() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 31 │ Sound                   │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 31 │ Sound                   │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/sound/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function config() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 32 │ Config                  │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 32 │ Config                  │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/config/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function assets() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 33 │ Assets                  │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 33 │ Assets                  │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./tests/assets/*.cub; do
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
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Test Categories:"
    echo "  -h              Header tests"
    echo "  -c              Color tests"
    echo "  -m              Map tests"
    echo "  -b              Bonus tests"
    echo "  -parsing        Parsing tests"
    echo "  -floodfill      Flood fill tests"
    echo "  -graphics       Graphics tests"
    echo "  -input          Input validation tests"
    echo "  -memory         Memory tests"
    echo "  -performance    Performance tests"
    echo "  -boundary       Boundary tests"
    echo "  -error          Error handling tests"
    echo "  -textures       Texture tests"
    echo "  -coordinates    Coordinate tests"
    echo "  -player         Player position tests"
    echo "  -walls          Wall tests"
    echo "  -doors          Door tests"
    echo "  -sprites        Sprite tests"
    echo "  -lighting       Lighting tests"
    echo "  -shadows        Shadow tests"
    echo "  -minimap        Minimap tests"
    echo "  -mouse          Mouse tests"
    echo "  -keyboard       Keyboard tests"
    echo "  -rotation       Rotation tests"
    echo "  -movement       Movement tests"
    echo "  -collision      Collision tests"
    echo "  -raycasting     Raycasting tests"
    echo "  -fov            FOV tests"
    echo "  -resolution     Resolution tests"
    echo "  -fps            FPS tests"
    echo "  -sound          Sound tests"
    echo "  -config         Config tests"
    echo "  -assets         Asset tests"
    echo ""
    echo "Combined Options:"
    echo "  -ma             Mandatory tests (header, color, map)"
    echo "  -all            All tests"
    echo "  (no args)       Mandatory tests (default)"
    exit 0
fi

# Individual category tests
if [[ "$1" == "-h" ]]; then
    header "TRUE" "TRUE"
elif [[ "$1" == "-c" ]]; then
    color "TRUE" "TRUE"
elif [[ "$1" == "-m" ]]; then
    map "TRUE" "TRUE"
elif [[ "$1" == "-b" ]]; then
    bonus "TRUE" "TRUE"
elif [[ "$1" == "-parsing" ]]; then
    parsing "TRUE" "TRUE"
elif [[ "$1" == "-floodfill" ]]; then
    floodfill "TRUE" "TRUE"
elif [[ "$1" == "-graphics" ]]; then
    graphics "TRUE" "TRUE"
elif [[ "$1" == "-input" ]]; then
    input_validation "TRUE" "TRUE"
elif [[ "$1" == "-memory" ]]; then
    memory "TRUE" "TRUE"
elif [[ "$1" == "-performance" ]]; then
    performance "TRUE" "TRUE"
elif [[ "$1" == "-boundary" ]]; then
    boundary "TRUE" "TRUE"
elif [[ "$1" == "-error" ]]; then
    error_handling "TRUE" "TRUE"
elif [[ "$1" == "-textures" ]]; then
    textures "TRUE" "TRUE"
elif [[ "$1" == "-coordinates" ]]; then
    coordinates "TRUE" "TRUE"
elif [[ "$1" == "-player" ]]; then
    player_position "TRUE" "TRUE"
elif [[ "$1" == "-walls" ]]; then
    walls "TRUE" "TRUE"
elif [[ "$1" == "-doors" ]]; then
    doors "TRUE" "TRUE"
elif [[ "$1" == "-sprites" ]]; then
    sprites "TRUE" "TRUE"
elif [[ "$1" == "-lighting" ]]; then
    lighting "TRUE" "TRUE"
elif [[ "$1" == "-shadows" ]]; then
    shadows "TRUE" "TRUE"
elif [[ "$1" == "-minimap" ]]; then
    minimap "TRUE" "TRUE"
elif [[ "$1" == "-mouse" ]]; then
    mouse "TRUE" "TRUE"
elif [[ "$1" == "-keyboard" ]]; then
    keyboard "TRUE" "TRUE"
elif [[ "$1" == "-rotation" ]]; then
    rotation "TRUE" "TRUE"
elif [[ "$1" == "-movement" ]]; then
    movement "TRUE" "TRUE"
elif [[ "$1" == "-collision" ]]; then
    collision "TRUE" "TRUE"
elif [[ "$1" == "-raycasting" ]]; then
    raycasting "TRUE" "TRUE"
elif [[ "$1" == "-fov" ]]; then
    fov "TRUE" "TRUE"
elif [[ "$1" == "-resolution" ]]; then
    resolution "TRUE" "TRUE"
elif [[ "$1" == "-fps" ]]; then
    fps "TRUE" "TRUE"
elif [[ "$1" == "-sound" ]]; then
    sound "TRUE" "TRUE"
elif [[ "$1" == "-config" ]]; then
    config "TRUE" "TRUE"
elif [[ "$1" == "-assets" ]]; then
    assets "TRUE" "TRUE"
# Combined tests
elif [[ "$1" == "-ma" ]]; then
    header "TRUE" "FALSE"
    color "FALSE" "FALSE"
    map "FALSE" "TRUE"
elif [[ "$1" == "-all" ]]; then
    header "TRUE" "FALSE"
    color "FALSE" "FALSE"
    map "FALSE" "FALSE"
    bonus "FALSE" "FALSE"
    parsing "FALSE" "FALSE"
    floodfill "FALSE" "FALSE"
    graphics "FALSE" "FALSE"
    input_validation "FALSE" "FALSE"
    memory "FALSE" "FALSE"
    performance "FALSE" "FALSE"
    boundary "FALSE" "FALSE"
    error_handling "FALSE" "FALSE"
    textures "FALSE" "FALSE"
    coordinates "FALSE" "FALSE"
    player_position "FALSE" "FALSE"
    walls "FALSE" "FALSE"
    doors "FALSE" "FALSE"
    sprites "FALSE" "FALSE"
    lighting "FALSE" "FALSE"
    shadows "FALSE" "FALSE"
    minimap "FALSE" "FALSE"
    mouse "FALSE" "FALSE"
    keyboard "FALSE" "FALSE"
    rotation "FALSE" "FALSE"
    movement "FALSE" "FALSE"
    collision "FALSE" "FALSE"
    raycasting "FALSE" "FALSE"
    fov "FALSE" "FALSE"
    resolution "FALSE" "FALSE"
    fps "FALSE" "FALSE"
    sound "FALSE" "FALSE"
    config "FALSE" "FALSE"
    assets "FALSE" "TRUE"
# Default: mandatory tests
elif [[ "$1" != -* ]]; then
    header "TRUE" "FALSE"
    color "FALSE" "FALSE"
    map "FALSE" "TRUE"
fi