include(ExternalProject)
ExternalProject_Add(
    mbedtls
    PREFIX ${CMAKE_BINARY_DIR}/mbedtls-2.25.0
    GIT_REPOSITORY https://github.com/ARMmbed/mbedtls.git
    GIT_TAG v2.25.0
    SOURCE_DIR ${CMAKE_BINARY_DIR}/thirdparty/mbedtls-2.25.0
    BINARY_DIR ${CMAKE_BINARY_DIR}/mbedtls-2.25.0
    PATCH_COMMAND cp ${PROJECT_SOURCE_DIR}/pico_config.h ${CMAKE_BINARY_DIR}/thirdparty/mbedtls-2.25.0/include/mbedtls/config.h
    CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} 
               -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} 
               -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
               -DENABLE_TESTING:BOOL=OFF
               -DENABLE_PROGRAMS:BOOL=OFF
    BUILD_COMMAND make CFLAGS=${CFLAGS_BASE}
    UPDATE_COMMAND ""
    INSTALL_COMMAND ""
)
set(MBEDTLS_HEADERS ${CMAKE_BINARY_DIR}/thirdparty/mbedtls-2.25.0/include)
set(mbedtls_libraries 
        ${CMAKE_BINARY_DIR}/mbedtls-2.25.0/library/libmbedcrypto.a
        ${CMAKE_BINARY_DIR}/mbedtls-2.25.0/library/libmbedtls.a   
        ${CMAKE_BINARY_DIR}/mbedtls-2.25.0/library/libmbedx509.a   
        )
include_directories(${MBEDTLS_HEADERS})