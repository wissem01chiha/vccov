set(classes 
  ExporterPluginManager.cpp
  CoverageData.cpp
  stdafx.cpp
)
set(headers
  ExporterPluginManager.hpp
  IPluginLoader.hpp
  LoadedPlugin.hpp
  PluginLoader.hpp
  IExportPlugin.hpp
  PluginExport.h
  CoverageData.hpp
  stdafx.h
)

vcov_module_add_module(Plugin CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Plugin
    DEPENDENCIES
        Export
        Common
        Option
)
vcov_add_test(Plugin)