# cub3d_tester

A comprehensive testing framework for the cub3d project with extensive test coverage across 14 categories and over 100 test files.

## Features

- **14 test categories** covering all aspects of cub3d functionality
- **102+ comprehensive test files** with edge cases and stress testing
- **Automated test execution** with clear visual feedback
- **Memory testing** with valgrind integration
- **Performance testing** for large maps and complex scenarios
- **Extensive documentation** and easy extensibility

## Quick Start

```bash
# Run all tests
./test.sh -a

# Run mandatory tests
./test.sh -ma

# Run specific category
./test.sh -h  # Header tests
./test.sh -c  # Color tests
./test.sh -m  # Map tests

# Show all options
./test.sh -help
```

## Test Categories

1. **Header** - Texture path validation
2. **Color** - RGB color parsing
3. **Map** - Map structure validation
4. **Bonus** - Bonus features
5. **Texture Validation** - Advanced texture handling
6. **Path Resolution** - Path format edge cases
7. **Boundary Conditions** - Value limit testing
8. **Memory Stress** - Large map testing
9. **Malformed Input** - Invalid format handling
10. **Encoding Tests** - Character encoding issues
11. **Performance Tests** - Scalability testing
12. **File I/O Errors** - File access edge cases
13. **Graphics Edge Cases** - Rendering boundaries
14. **Integration Tests** - End-to-end validation

See [TEST_DOCUMENTATION.md](TEST_DOCUMENTATION.md) for detailed information.

## Requirements

- bash
- timeout command
- valgrind (for memory testing)
- cub3d executable in parent directory
