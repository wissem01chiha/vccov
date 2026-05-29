set(classes
    Debugger.cpp
    DebugInformationEnumerator.cpp
    IDebugEventsHandler.cpp
    Process.cpp
    StartInfo.cpp
    BreakPoint.cpp
    Address.cpp
    ExceptionHandler.cpp
    CppCoverageException.cpp
)

set(headers
    Debugger.hpp
    DebugInformationEnumerator.hpp
    IDebugEventsHandler.hpp
    Process.hpp
    StartInfo.hpp
    BreakPoint.hpp
    Address.hpp
    Handle.hpp
    ExceptionHandler.hpp
    CppCoverageException.hpp
)

vcov_module_add_module(Core CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Core
    DEPENDENCIES    
        vcov::Tools
        vcov::Common
)
vcov_add_test(Core)