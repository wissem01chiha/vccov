set(classes
    ExecutedAddressManager.cpp
    MonitoredLineRegister.cpp
    CoverageRate.cpp
    CoverageRateComputer.cpp
    CoverageDataMerger.cpp
    CodeCoverageRunner.cpp
    CodeCoverageRunner.hpp
    RunCoverageSettings.cpp
)

set(headers
    ExecutedAddressManager.hpp
    MonitoredLineRegister.hpp
    CoverageRate.hpp
    CoverageRateComputer.hpp
    CoverageDataMerger.hpp
    CodeCoverageRunner.hpp
    RunCoverageSettings.hpp
)

vccov_module_add_module(coverage CLASSES ${classes} HEADERS ${headers})
vccov_module_add_dependencies(coverage
    DEPENDENCIES
        vccov::core
        vccov::filter
        vccov::common
)

