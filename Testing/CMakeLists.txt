
set(classes 
    stdafx.cpp
    TemporaryPath.cpp
    Tools.cpp
    CoverageDataComparer.cpp
)

set(headers
    TemporaryPath.hpp
    Tools.hpp
    CoverageDataComparer.hpp
    Container.hpp
    Container.inl
    stdafx.h 
    TestHelperExport.hpp
    AutoClose.hpp
)

vcov_module_add_module(Testing CLASSES ${classes} HEADERS ${headers})
target_include_directories(Testing PUBLIC  ${GTEST_INCLUDE_DIRS})
target_link_libraries(Testing PUBLIC GTest::gtest GTest::gtest_main)