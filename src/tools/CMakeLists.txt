set(classes
    Tool.cpp
    ExceptionBase.cpp
    ToolsExport.hpp
    Log.cpp
    MiniDump.cpp
    MappedFile.cpp
    ProcessMemory.cpp
    PEFileHeader.cpp
    ScopedAction.cpp
    UniquePath.cpp
    WarningManager.cpp
)

set(headers
    Tool.hpp
    ExceptionBase.hpp
    ToolsException.hpp
    ToolsExport.hpp
    Log.hpp
    MiniDump.hpp
    MappedFile.hpp
    ProcessMemory.hpp
    PEFileHeader.hpp
    ScopedAction.hpp
    UniquePath.hpp
    WarningManager.hpp
)

vccov_module_add_module(tools CLASSES ${classes} HEADERS ${headers})