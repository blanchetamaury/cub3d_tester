# cub3d Comprehensive Test Suite

This repository provides a comprehensive testing framework for the cub3d project with extensive test coverage across multiple categories and edge cases.

## Overview

The test suite now includes **14 test categories** with over **100 test files** covering various aspects of cub3d functionality, from basic parsing to complex edge cases and stress testing.

## Test Categories

### Core Categories (Original)
1. **Header** (14 tests) - Tests texture path validation and header parsing
2. **Color** (13 tests) - Tests RGB color value parsing and validation
3. **Map** (17 tests) - Tests map structure, player positioning, and boundaries
4. **Bonus** (14 tests) - Tests bonus features and additional functionality

### Extended Categories (New)
5. **Texture Validation** (10 tests) - Tests various texture file edge cases
6. **Path Resolution** (2 tests) - Tests different path formats and resolutions
7. **Boundary Conditions** (8 tests) - Tests RGB value limits and edge cases
8. **Memory Stress** (1 test) - Tests large map handling and memory usage
9. **Malformed Input** (7 tests) - Tests invalid input formats and parsing
10. **Encoding Tests** (3 tests) - Tests character encoding and formatting issues
11. **Performance Tests** (2 tests) - Tests performance with complex maps
12. **File I/O Errors** (2 tests) - Tests file access and I/O error handling
13. **Graphics Edge Cases** (6 tests) - Tests map rendering edge cases
14. **Integration Tests** (2 tests) - Tests complete valid configurations

## Usage

### Running Tests

```bash
# Run all tests
./test.sh -a

# Run specific categories
./test.sh -h          # Header tests
./test.sh -c          # Color tests
./test.sh -m          # Map tests
./test.sh -b          # Bonus tests

# Run new extended categories
./test.sh -tv         # Texture Validation
./test.sh -pr         # Path Resolution
./test.sh -bc         # Boundary Conditions
./test.sh -ms         # Memory Stress
./test.sh -mi         # Malformed Input
./test.sh -et         # Encoding Tests
./test.sh -pt         # Performance Tests
./test.sh -fio        # File I/O Errors
./test.sh -gec        # Graphics Edge Cases
./test.sh -it         # Integration Tests

# Run test groups
./test.sh -ma         # Mandatory tests (header, color, map)
./test.sh -ext        # All extended categories

# Run with valgrind
./test.sh -va         # Valgrind memory tests

# Show help
./test.sh -help
```

### Test File Naming Convention

- `##OK.cub` - Tests that should pass (exit normally)
- `##KO.cub` - Tests that should fail (exit with error)

## Test Categories Explained

### 1. Header Tests
Tests texture path validation:
- Valid texture paths
- Missing texture files
- Invalid file types
- Duplicate texture definitions
- Empty or malformed paths

### 2. Color Tests
Tests RGB color parsing:
- Valid RGB ranges (0-255)
- Invalid RGB values (>255, <0)
- Malformed color formats
- Missing color definitions
- Duplicate color definitions

### 3. Map Tests
Tests map structure and validation:
- Valid map configurations
- Invalid characters in maps
- Player positioning
- Map boundaries and connectivity
- Empty or malformed maps

### 4. Texture Validation Tests
Advanced texture handling:
- Non-existent texture files
- Special characters in paths
- Very long paths
- Case sensitivity
- Binary files as textures

### 5. Boundary Conditions Tests
Edge cases for value limits:
- Maximum/minimum RGB values
- Out-of-range values
- Large numbers
- Negative values

### 6. Memory Stress Tests
Resource usage testing:
- Large maps
- Complex map structures
- Memory allocation edge cases

### 7. Malformed Input Tests
Invalid input format handling:
- Incorrect color formats
- Invalid syntax
- Unicode characters
- Mixed line endings
- Incomplete definitions

### 8. Performance Tests
Performance and scalability:
- Very large maps
- Complex maze-like structures
- Wide maps
- Processing time validation

### 9. Graphics Edge Cases
Rendering edge cases:
- Single cell maps
- Multiple players
- No player scenarios
- Invalid map characters
- Empty maps

### 10. Integration Tests
Complete workflow validation:
- Complex valid configurations
- End-to-end testing
- Real-world scenarios

## Test Generation

The test suite includes automated test generation scripts:

```bash
# Generate basic additional tests
./generate_tests.sh

# Generate comprehensive extended tests
./generate_extended_tests.sh
```

## Adding New Tests

To add new test categories:

1. Create a new directory under `tests/`
2. Add test files following the naming convention
3. Add a function in `test.sh` for the new category
4. Update the help section and command-line options

## Test Results

The test framework provides clear visual feedback:
- ✅ **GREEN OK** - Test passed as expected
- ❌ **RED KO** - Test failed or didn't behave as expected
- 🟡 **YELLOW Testing...** - Test in progress

## Quality Assurance

Each test is designed to:
- Test a specific aspect of functionality
- Cover realistic edge cases
- Provide meaningful validation
- Be easily maintainable
- Follow consistent patterns

## Total Coverage

- **102 total test files**
- **14 test categories**
- **Comprehensive edge case coverage**
- **Memory and performance testing**
- **Input validation across all formats**
- **Graphics and rendering edge cases**

This comprehensive test suite ensures robust validation of cub3d implementations across all major functionality areas and edge cases.