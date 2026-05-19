# src/tools/CMakeLists.txt - Tools utility library

add_library(vccov_tools)

target_sources(vccov_tools
    PRIVATE
        core/Tool.cpp
        core/Tool.hpp
        core/ExceptionBase.cpp
        core/ExceptionBase.hpp
        core/ToolsException.hpp
        core/ToolsExport.hpp
        log/Log.cpp
        log/Log.hpp
        diag/MiniDump.cpp
        diag/MiniDump.hpp
        io/MappedFile.cpp
        io/MappedFile.hpp
        memory/ProcessMemory.cpp
        memory/ProcessMemory.hpp
        memory/PEFileHeader.cpp
        memory/PEFileHeader.hpp
        util/ScopedAction.cpp
        util/ScopedAction.hpp
        util/UniquePath.cpp
        util/UniquePath.hpp
        util/WarningManager.cpp
        util/WarningManager.hpp
)

target_include_directories(vccov_tools
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_features(vccov_tools PRIVATE cxx_std_17)

if(VCCOV_INSTALL)
    install(TARGETS vccov_tools
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
    install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/core
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vccov/tools
        FILES_MATCHING PATTERN "*.hpp"
    )
endif()
