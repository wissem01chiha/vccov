set(headers 
    CppCoverageExport.hpp
    OpenCppCoverageException.hpp
    OpenCppCoverageExport.hpp
    SubstitutePdbSourcePath.hpp
)

vccov_module_add_module(common CLASSES "" HEADERS ${headers})