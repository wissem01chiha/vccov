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
    Patterns.cpp
    Wildcards.cpp
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
    Patterns.hpp
    Wildcards.hpp
    CoreExport.h
)

vcov_module_add_module(Core CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Core
    DEPENDENCIES    
        Common
)
vcov_module_add_test(Core)