set(headers
    ExportPluginDescription.hpp)

vcov_module_add_module(Export CLASSES "" HEADERS ${headers})
vcov_add_test(Export)