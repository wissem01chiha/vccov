PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS CoverageData.proto)

set(classes 
    ${CMAKE_CURRENT_BINARY_DIR}/CoverageData.pb.cc
    BinaryExporter.cpp 
    CoverageDataDeserializer.cpp
    CoverageDataSerializer.cpp
)
set(headers 
    ${CMAKE_CURRENT_BINARY_DIR}/CoverageData.pb.h
    BinaryExporter.hpp
    CoverageDataDeserializer.hpp
    ProtoBuff.hpp 
    BinaryExport.h
)
vcov_module_add_module(Binary CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Binary
    DEPENDENCIES    
        Common
        Export
)
target_include_directories(Binary PUBLIC ${Protobuf_INCLUDE_DIRS})
target_link_libraries(Binary PUBLIC 
    protobuf::libupb 
    protobuf::libprotoc 
    protobuf::libprotobuf 
    protobuf::libprotobuf-lite
)
vcov_add_test(Binary)