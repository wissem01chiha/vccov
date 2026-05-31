set(classes 
  ExporterPluginManager.cpp
  stdafx.cpp
)
set(headers
   ExporterPluginManager.hpp
   IPluginLoader.hpp
   LoadedPlugin.hpp
   PluginLoader.hpp
   IExportPlugin.hpp
   stdafx.h
)

vcov_module_add_module(Plugin CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Plugin
    DEPENDENCIES
        vcov::Export
        vcov::Common
        vcov::Option
)
vcov_add_test(Plugin)