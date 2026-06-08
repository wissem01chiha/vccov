set(classes 
    ExportPluginDescription.cpp
    InvalidOutputFileException.cpp
    CoverageData.cpp
    FileCoverage.cpp
    ModuleCoverage.cpp
    LineCoverage.cpp
    stdafx.cpp
)
set(headers
    ExportPluginDescription.hpp
    InvalidOutputFileException.hpp
    IExporter.hpp
    CoverageData.hpp
    FileCoverage.hpp
    ModuleCoverage.hpp
    LineCoverage.hpp
    ExportExport.h
    stdafx.h
)

vcov_module_add_module(Export CLASSES ${classes} HEADERS ${headers})
vcov_add_test(Export)