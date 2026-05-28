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

vccov_module_add_module(core CLASSES ${classes} HEADERS ${headers})
vccov_module_add_dependencies(core
    DEPENDENCIES    
        vccov::tools
        vccov::common
)