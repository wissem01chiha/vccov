set(classes
    SpecialLineInfo.cpp
)
add_library(Testing STATIC)
target_sources(Testing PRIVATE ${classes})
add_library(vcov::Testing ALIAS Testing)