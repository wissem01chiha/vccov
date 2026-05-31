set(classes 
    HtmlExporter.cpp
    HtmlFileCoverageExporter.cpp
    HtmlFolderStructure.cpp
    #TemplateHtmlExporter.cpp
    HtmlFile.cpp
)

set(headers 
    HtmlExporter.hpp
    HtmlFileCoverageExporter.hpp
    HtmlFolderStructure.hpp
    TemplateHtmlExporter.hpp
    CTemplate.hpp
    HtmlFile.hpp
    stdafx.h
)
vcov_module_add_module(Html CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Html
    DEPENDENCIES    
        vcov::Common
        vcov::Export
        vcov::Plugin
        vcov::Coverage
)