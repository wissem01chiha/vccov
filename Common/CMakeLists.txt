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
if(VCOV_BUILD_TESTS)
    list(APPEND classes
        TemporaryPath.cpp
        Tools.cpp
    )
    list(APPEND headers
        TemporaryPath.hpp
        TemporaryPathOption.hpp
        Tools.hpp
    )
endif()
vcov_module_add_module(Common CLASSES ${classes} HEADERS ${headers})
vcov_module_add_test(Common)