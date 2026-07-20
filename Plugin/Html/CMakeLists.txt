set(classes 
    HtmlExporter.cpp
    HtmlFileCoverageExporter.cpp
    HtmlFolderStructure.cpp
    TemplateHtmlExporter.cpp
    HtmlFile.cpp
)

set(headers 
    HtmlExporter.hpp
    HtmlFileCoverageExporter.hpp
    HtmlFolderStructure.hpp
    TemplateHtmlExporter.hpp
    CTemplate.hpp
    HtmlFile.hpp
    HtmlExport.h
)
vcov_module_add_module(Html CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Html
    DEPENDENCIES    
        Common
        Export
        Plugin
        Coverage
)
target_include_directories(Html PUBLIC ${CTemplate_INCLUDE_DIRS})
target_link_libraries(Html PUBLIC ${CTemplate_LIBRARIES})
vcov_module_add_test(Html)