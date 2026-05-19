# Vccov Modern Structure - Migration Guide

## Overview

Vccov has been reorganized from a flat, legacy structure into a modern hierarchical architecture following industry best practices and Microsoft's internal project standards.

## New Directory Structure

```
vccov/
├── src/                          # Production source code
│   ├── core/                     # Core debugger and process management
│   │   ├── debugger/             # Debugger interface and operations
│   │   ├── process/              # Process management and execution
│   │   ├── breakpoint/           # Breakpoint and exception handling
│   │   └── exceptions/           # Exception definitions
│   │
│   ├── coverage/                 # Coverage analysis engine
│   │   ├── monitor/              # Executed line monitoring
│   │   ├── computer/             # Coverage rate computation
│   │   ├── merger/               # Coverage data merging
│   │   └── runner/               # Coverage execution runner
│   │
│   ├── filter/                   # Filtering and path matching
│   │   └── (unified diff, wildcard, release filters)
│   │
│   ├── options/                  # CLI options and configuration parsing
│   │   └── (options parser, export options)
│   │
│   ├── export/                   # Report export functionality
│   │   └── plugins/              # Export plugin interfaces
│   │
│   ├── platform/                 # Platform-specific implementations
│   │   └── windows/
│   │       ├── dia/              # Debug Interface Access (PDB handling)
│   │       └── handle/           # Windows handle management
│   │
│   ├── utils/                    # Utility libraries
│   │   ├── filesystem/           # File system operations
│   │   └── patterns/             # Pattern matching and wildcards
│   │
│   ├── cli/                      # Command-line interface executable
│   │   └── main.cpp              # CLI entry point
│   │
│   ├── export/                   # Export interfaces and plugins
│   │
│   └── CMakeLists.txt
│
├── test/                         # Unit tests (mirrors src/ structure)
│   ├── core/                     # Core module tests
│   ├── coverage/                 # Coverage module tests
│   ├── filter/                   # Filter module tests
│   ├── options/                  # Options module tests
│   ├── export/                   # Export module tests
│   ├── utils/                    # Utils module tests
│   ├── cli/                      # CLI tests
│   ├── fixtures/                 # Test data and helpers
│   └── CMakeLists.txt
│
├── examples/                     # Example and sample programs
│   ├── cpp/                      # C++ examples
│   │   ├── coverage-console/     # Basic console coverage
│   │   ├── optimized-build/      # Optimized build test
│   │   ├── shared-lib/           # Shared library test
│   │   └── cli-interop/          # CLI interoperability
│   ├── csharp/                   # C# interoperability examples
│   └── CMakeLists.txt
│
├── docs/                         # Documentation
│   ├── architecture/             # Architecture documentation
│   ├── api/                      # API reference
│   ├── user-guide/               # User documentation
│   ├── tutorials/                # Getting started tutorials
│   └── assets/                   # Images and diagrams
│
├── cmake/                        # CMake build system
│   └── modules/                  # Custom CMake modules
│
├── third_party/                  # External dependencies
│   └── vendors/                  # Vendored libraries
│
├── tools/                        # Development tools and scripts
│   ├── scripts/                  # Utility scripts
│   └── analysis/                 # Code analysis configs
│
├── CMakeLists.txt                # Root CMake configuration
├── CMakePresets.json             # Modern CMake presets
├── conanfile.py                  # Conan package configuration
├── vcpkg.json                    # vcpkg configuration
├── BUILD.bazel                   # Bazel build configuration
├── .clang-format                 # Code formatting rules
├── .clang-tidy                   # Static analysis rules
└── README.md
```

## Module Organization

### Core Module (`src/core/`)
- **Purpose**: Fundamental debugger and process operations
- **Components**:
  - `debugger/`: Debugger API and event handling
  - `process/`: Process creation and management
  - `breakpoint/`: Breakpoint management and address tracking
  - `exceptions/`: Exception definitions and handling

### Coverage Module (`src/coverage/`)
- **Purpose**: Coverage analysis and computation
- **Components**:
  - `monitor/`: Tracks executed code lines
  - `computer/`: Calculates coverage metrics
  - `merger/`: Merges multiple coverage reports
  - `runner/`: Manages coverage execution

### Filter Module (`src/filter/`)
- **Purpose**: Code filtering and path matching
- **Features**:
  - Wildcard pattern matching
  - Unified diff filtering
  - Release build filtering
  - Path normalization

### Options Module (`src/options/`)
- **Purpose**: CLI argument and configuration parsing
- **Features**:
  - Option parsing
  - Export configuration
  - Plugin description parsing

### Platform Module (`src/platform/`)
- **Purpose**: Platform-specific implementations
- **Platforms**:
  - **Windows**: PDB handling via DIA SDK, handle management

### Utils Module (`src/utils/`)
- **Purpose**: General-purpose utilities
- **Features**:
  - File system operations
  - Pattern matching and wildcards

### CLI Module (`src/cli/`)
- **Purpose**: Command-line interface entry point
- **Components**:
  - Main application entry
  - CLI orchestration
  - User interaction

## Test Structure

Tests are organized to mirror the `src/` structure:

- `test/core/` - Tests for core module functionality
- `test/coverage/` - Tests for coverage computation
- `test/filter/` - Tests for filtering logic
- `test/options/` - Tests for options parsing
- `test/export/` - Tests for export functionality
- `test/utils/` - Tests for utility functions
- `test/cli/` - Integration tests for CLI
- `test/fixtures/` - Shared test data and helpers

## Build System

### Modern CMake Features
- **CMakePresets.json**: Predefined build configurations
- **Modular CMakeLists.txt**: Each module is self-contained
- **Clear dependencies**: Explicit target linking
- **Feature testing**: C++ standard compliance checking

### Build Options

```cmake
VCCOV_BUILD_TESTS      # Enable/disable unit tests (default: ON)
VCCOV_BUILD_EXAMPLES   # Enable/disable example programs (default: OFF)
VCCOV_INSTALL          # Enable/disable installation targets (default: ON)
VCCOV_ENABLE_ASAN      # Enable AddressSanitizer (default: OFF)
BUILD_SHARED_LIBS      # Build shared libraries (default: OFF)
```

## Migration from Old Structure

### Old → New Mapping

| Old Location | New Location |
|-------------|------------|
| `CppCoverage/` | `src/` |
| `OpenCppCoverage/` | `src/cli/` |
| `CppCoverageTest/` | `test/coverage/` |
| `ExporterTest/` | `test/export/` |
| `FileFilterTest/` | `test/filter/` |
| `OpenCppCoverageTest/` | `test/cli/` |
| `PluginTest/` | `test/export/` |
| `ToolsTest/` | `test/utils/` |
| `TestCoverageConsole/` | `examples/cpp/coverage-console/` |
| `TestCoverageOptimizedBuild/` | `examples/cpp/optimized-build/` |
| `TestCoverageSharedLib/` | `examples/cpp/shared-lib/` |
| `TestCppCli/` | `examples/cpp/cli-interop/` |

### File Organization by Category

**Debugger Components** → `src/core/debugger/`
- `Debugger.*`
- `DebugInformationEnumerator.*`
- `IDebugEventsHandler.*`

**Process Management** → `src/core/process/`
- `Process.*`
- `StartInfo.*`

**Breakpoint & Address** → `src/core/breakpoint/`
- `BreakPoint.*`
- `Address.*`
- `Handle.hpp`
- `ExceptionHandler.*`

**Coverage Monitoring** → `src/coverage/monitor/`
- `ExecutedAddressManager.*`
- `MonitoredLineRegister.*`

**Coverage Computation** → `src/coverage/computer/`
- `CoverageRate.*`
- `CoverageRateComputer.*`

**Coverage Merging** → `src/coverage/merger/`
- `CoverageDataMerger.*`

**Filtering** → `src/filter/`
- `CoverageFilterManager.*`
- `CoverageFilterSettings.*`
- `FilterAssistant.*`
- `UnifiedDiffCoverageFilterManager.*`
- `WildcardCoverageFilter.*`

**Options & CLI** → `src/options/` + `src/cli/`
- `Options.*`
- `OptionsParser.*`
- `ProgramOptions.*`
- `main.cpp`

**Platform-Specific** → `src/platform/windows/`
- `Dia/*` → `src/platform/windows/dia/`
- `HandleInformation.*` → `src/platform/windows/handle/`

**Utilities** → `src/utils/`
- `FileSystem.*` → `src/utils/filesystem/`
- `Patterns.*`, `Wildcards.*` → `src/utils/patterns/`

## Build Instructions

### Configure
```bash
cmake -B build -S . -DVCCOV_BUILD_TESTS=ON
```

### Build
```bash
cmake --build build
```

### Run Tests
```bash
ctest --test-dir build
```

### Install
```bash
cmake --install build
```

## Naming Conventions

### Folders
- **lowercase-with-hyphens** for modern structure: `debug-interface`, `test-utils`
- **lowercase** for simple names: `src`, `test`, `docs`, `cmake`

### Files
- **PascalCase** matching class names: `CoverageRate.hpp`, `FilterAssistant.cpp`

### Functions
- **camelCase**: `computeCoverageRate()`, `getCoveragePercentage()`

### Classes/Types
- **PascalCase**: `CoverageRateComputer`, `ProcessHandle`

### Macros
- **UPPERCASE_SNAKE_CASE**: `VCCOV_EXPORT`, `MAX_BUFFER_SIZE`

### Constants
- **lowercase** with `constexpr`: `defaultTimeout = 5000`

## Benefits of Modern Structure

✅ **Clarity**: Modules organized by responsibility  
✅ **Scalability**: Easy to add new features  
✅ **Maintainability**: Clear separation of concerns  
✅ **Testability**: Tests mirror source structure  
✅ **Performance**: Modular compilation and linking  
✅ **Documentation**: Self-documenting structure  
✅ **CI/CD**: Clear build targets for parallelization  
✅ **Onboarding**: New developers understand architecture instantly  

## Next Steps

1. **Update all CMakeLists.txt** with new module structure
2. **Verify build system** - test compilation and linking
3. **Migrate tests** - map old test files to new structure
4. **Update documentation** - reflect new architecture
5. **Refactor includes** - update `#include` paths
6. **Create CMakePresets.json** - for development convenience
7. **Set up CI/CD** - configure for new structure

## Support

For questions or issues with the new structure, refer to:
- Architecture documentation: `docs/architecture/`
- Build system: `cmake/`
- Example projects: `examples/cpp/`
