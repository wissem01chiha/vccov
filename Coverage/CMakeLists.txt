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

vcov_module_add_module(Coverage CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Coverage
    DEPENDENCIES
        vcov::Core
        vcov::Common
        vcov::Filter
        vcov::Plugin
        vcov::Binary
        vcov::Platform
)
vcov_add_test(Coverage)
