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

function test_val() {
    local filename="$1"

    timeout -s TERM --kill-after=2s 30s \
    valgrind --error-exitcode=1 \
             --suppressions=cub3d_tester/valgrind.supp \
             ./cub3d "$filename" 2> log_val

    input="log_val"
    status="FALSE"
    while IFS= read -r line
    do
        if [[ "$line" == *"still reachable "* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"invalid"* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"conditionnal jump"* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"uninitialized"* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"definitely lost "* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"indirectly lost "* ]]; then
            status=TRUE
            break
        fi
        if [[ "$line" == *"possibly lost "* ]]; then
            status=TRUE
            break
        fi
    done < "$input"

    if [[ "$status" == "FALSE" ]]; then
        printf "\r│ TEST %02d :$GREEN OK$RESET                 │\n" "$NUM_TESTS"
    else
        printf "\r│ TEST %02d :$RED KO$RESET                 │\n" "$NUM_TESTS"
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
        if [[ "$1" == "TRUE" ]]; then
            test_val "$file"
        else
            test
        fi
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

function texture_validation() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 05 │ Texture Validation      │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 05 │ Texture Validation      │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/texture_validation/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function path_resolution() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 06 │ Path Resolution         │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 06 │ Path Resolution         │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/path_resolution/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function boundary_conditions() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 07 │ Boundary Conditions     │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 07 │ Boundary Conditions     │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/boundary_conditions/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function memory_stress() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 08 │ Memory Stress           │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 08 │ Memory Stress           │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/memory_stress/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function malformed_input() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 09 │ Malformed Input         │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 09 │ Malformed Input         │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/malformed_input/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function encoding_tests() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 10 │ Encoding Tests          │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 10 │ Encoding Tests          │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/encoding_tests/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function performance_tests() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 11 │ Performance Tests       │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 11 │ Performance Tests       │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/performance_tests/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function file_io_errors() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 12 │ File I/O Errors         │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 12 │ File I/O Errors         │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/file_io_errors/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function graphics_edge_cases() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 13 │ Graphics Edge Cases     │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 13 │ Graphics Edge Cases     │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/graphics_edge_cases/*.cub; do
        printf "│ TEST %02d :$YELLOW Testing...$RESET         │" "$NUM_TESTS"
        test "$file"
        ((NUM_TESTS++))
    done

    if [[ "$2" == "TRUE" ]]; then
        echo "└──────────────────────────────┘"
    fi
}

function integration_tests() {
    if [[ "$1" == "TRUE" ]]; then
        echo
        echo "┌────┬─────────────────────────┐"
        echo "│ 14 │ Integration Tests       │"
        echo "├────┴─────────────────────────┤"
    else
        echo "├────┬─────────────────────────┤"
        echo "│ 14 │ Integration Tests       │"
        echo "├────┴─────────────────────────┤"
    fi

    NUM_TESTS=0

    for file in ./cub3d_tester/tests/integration_tests/*.cub; do
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
    echo "Usage: $0 [OPTION]"
    echo "Test categories:"
    echo "  -h    Header tests"
    echo "  -c    Color tests"
    echo "  -m    Map tests"
    echo "  -b    Bonus tests"
    echo "  -tv   Texture Validation tests"
    echo "  -pr   Path Resolution tests"
    echo "  -bc   Boundary Conditions tests"
    echo "  -ms   Memory Stress tests"
    echo "  -mi   Malformed Input tests"
    echo "  -et   Encoding Tests"
    echo "  -pt   Performance Tests"
    echo "  -fio  File I/O Errors"
    echo "  -gec  Graphics Edge Cases"
    echo "  -it   Integration Tests"
    echo "  -ma   Mandatory tests (header, color, map)"
    echo "  -ext  Extended tests (all new categories)"
    echo "  -a    All tests"
    echo "  -va   Valgrind tests (header only)"
    echo "  -help This help message"
    exit 0
fi

if [[ "$1" == "-h" ]]; then
    header "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-c" ]]; then
    color "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-m" ]]; then
    map "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-b" ]]; then
    bonus "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-tv" ]]; then
    texture_validation "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-pr" ]]; then
    path_resolution "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-bc" ]]; then
    boundary_conditions "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-ms" ]]; then
    memory_stress "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-mi" ]]; then
    malformed_input "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-et" ]]; then
    encoding_tests "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-pt" ]]; then
    performance_tests "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-fio" ]]; then
    file_io_errors "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-gec" ]]; then
    graphics_edge_cases "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-it" ]]; then
    integration_tests "TRUE" "TRUE" "FALSE"
fi

if [[ "$1" == "-ma" ]]; then
    header "TRUE" "FALSE" "FALSE"
    color "FALSE" "FALSE" "FALSE"
    map "FALSE" "TRUE" "FALSE"
fi

if [[ "$1" == "-ext" ]]; then
    texture_validation "TRUE" "FALSE" "FALSE"
    path_resolution "FALSE" "FALSE" "FALSE"
    boundary_conditions "FALSE" "FALSE" "FALSE"
    memory_stress "FALSE" "FALSE" "FALSE"
    malformed_input "FALSE" "FALSE" "FALSE"
    encoding_tests "FALSE" "FALSE" "FALSE"
    performance_tests "FALSE" "FALSE" "FALSE"
    file_io_errors "FALSE" "FALSE" "FALSE"
    graphics_edge_cases "FALSE" "FALSE" "FALSE"
    integration_tests "FALSE" "TRUE" "FALSE"
fi

if [[ "$1" != -* ]]; then
    header "TRUE" "FALSE" "FALSE"
    color "FALSE" "FALSE" "FALSE"
    map "FALSE" "TRUE" "FALSE"
fi

if [[ "$1" == "-a" ]]; then
    header "TRUE" "FALSE" "FALSE"
    color "FALSE" "FALSE" "FALSE"
    map "FALSE" "FALSE" "FALSE"
    bonus "FALSE" "FALSE" "FALSE"
    texture_validation "FALSE" "FALSE" "FALSE"
    path_resolution "FALSE" "FALSE" "FALSE"
    boundary_conditions "FALSE" "FALSE" "FALSE"
    memory_stress "FALSE" "FALSE" "FALSE"
    malformed_input "FALSE" "FALSE" "FALSE"
    encoding_tests "FALSE" "FALSE" "FALSE"
    performance_tests "FALSE" "FALSE" "FALSE"
    file_io_errors "FALSE" "FALSE" "FALSE"
    graphics_edge_cases "FALSE" "FALSE" "FALSE"
    integration_tests "FALSE" "TRUE" "FALSE"
fi

if [[ "$1" == "-va" ]]; then
    header "TRUE" "TRUE" "TRUE"
fi