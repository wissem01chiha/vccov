set(classes 
    SubstitutePdbSourcePath.cpp
)

set(headers 
    CppCoverageExport.hpp
    OpenCppCoverageException.hpp
    OpenCppCoverageExport.hpp
    SubstitutePdbSourcePath.hpp
)

vcov_module_add_module(Common CLASSES ${classes} HEADERS ${headers})
vcov_add_test(Common)