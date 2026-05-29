set(classes 
    CoberturaExporter.
    InvalidOutputFileException.cpp
)

set(headers
    CoberturaExporter.hpp
    InvalidOutputFileException.hpp
)

add_subdirectory(Html)
add_subdirectory(Binary)
add_subdirectory(Plugin)