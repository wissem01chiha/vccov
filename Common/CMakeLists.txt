set(classes 
    SubstitutePdbSourcePath.cpp
    Tool.cpp
    ExceptionBase.cpp
    Log.cpp
    MiniDump.cpp
    MappedFile.cpp
    ProcessMemory.cpp
    PEFileHeader.cpp
    ScopedAction.cpp
    UniquePath.cpp
    WarningManager.cpp
    FileSystem.cpp
)

set(headers 
    OpenCppCoverageException.hpp
    SubstitutePdbSourcePath.hpp
    Tool.hpp
    ExceptionBase.hpp
    ToolsException.hpp
    Log.hpp
    MiniDump.hpp
    MappedFile.hpp
    ProcessMemory.hpp
    PEFileHeader.hpp
    ScopedAction.hpp
    UniquePath.hpp
    WarningManager.hpp
    IFileSystem.hpp
    FileSystem.hpp
    CommonExport.h
)

vcov_module_add_module(Common CLASSES ${classes} HEADERS ${headers})
target_link_libraries(Common PRIVATE DbgHelp.lib)
vcov_add_test(Common)