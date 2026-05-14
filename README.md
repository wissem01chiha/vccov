<!-- omit in toc -->
# Vccov

![GitHub License](https://img.shields.io/github/license/wissem01chiha/vccov)
[![CodeFactor](https://www.codefactor.io/repository/github/wissem01chiha/vccov/badge/master)](https://www.codefactor.io/repository/github/wissem01chiha/vccov/overview/master)

## Overview
 
Vccov is a free and open‑source C/C++ code coverage tool for Visual Studio solutions on Windows. It is actively maintained as a fork of the [OpenCppCoverage](https://github.com/OpenCppCoverage/OpenCppCoverage) project.
Since the original project is no longer actively maintained, Vccov continues its development and improvement.

Its primary use case is unit test coverage, but it can also be used to track executed lines in a program for debugging purposes.

This tool is constantly evolving, and contributions are always welcome! Learn how to get started with our [packaging tutorial]( ) and [maintainer guide]().

## Get Started

First, follow one of our quick start guides.

- Windows Vista or higher
- Microsoft Visual Studio 2008 or higher (all editions, **including Express edition**) , It may also work with earlier versions of Visual Studio.

## Use Vccov

You can run Vccov with the following command:

```bash
OpenCppCoverage.exe --sources MySourcePath* -- YourProgram.exe arg1 arg2
```

For example, *MySourcePath* can be *MyProject*, if your sources are located in *C:\Dev\MyProject*.

See [Getting Started](https://github.com/OpenCppCoverage/OpenCppCoverage/wiki) for more information about the usage.
You can also have a look at [Command-line reference](https://github.com/OpenCppCoverage/OpenCppCoverage/wiki/Command-line-reference).

## Key features

- [Visual studio support]()  Support compiler with [program database file](https://learn.microsoft.com/en-us/visualstudio/debugger/debug-interface-access/querying-the-dot-pdb-file?view=visualstudio)
- [Non intrusive]()  Just run your program with vccov, no need to recompile your application.
- [HTML reporting]()
- [Line coverage]().
- [Visual Studio Plugin](https://github.com/OpenCppCoverage/OpenCppCoveragePlugin)
- [Jenkins support](https://github.com/OpenCppCoverage/OpenCppCoverage/wiki/Jenkins)  
- [Support optimized build]().
- [Exclude a line based on a regular expression]().
- [Child processes coverage]().
- [Coverage aggregation](): Run several code coverages and merge them into a single report.

## Contribute

* [Submit issues](contributing:submit-issue)
* [Submit fixes](contributing:submit-pr)
  
## Resources

* Docs: [Wiki](https://github.com/wissem01chiha/vccov/wiki)
* Source code: [vccov](../../releases)

## License

The code in this repository is licensed under the GPL-3.0 License.

