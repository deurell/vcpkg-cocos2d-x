include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/curl-curl-7_52_1)
vcpkg_download_distfile(ARCHIVE_FILE
    URLS "https://github.com/curl/curl/archive/curl-7_52_1.tar.gz"
    FILENAME "curl-7.52.1.tar.gz"
    SHA512 39341748fa55d8637c6876c6a12ec69a88c6aae972fec3460e3b7b78ead48388472fad2114e54d9c81b1e056ed36a8a91da85bf24746b4ac44db3d99ed2404a7
)
vcpkg_extract_source_archive(${ARCHIVE_FILE})

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES
        ${CMAKE_CURRENT_LIST_DIR}/0001_cmake.patch
        ${CMAKE_CURRENT_LIST_DIR}/0002_fix_uwp.patch
)

if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
    SET(CURL_STATICLIB OFF)
else()
    SET(CURL_STATICLIB ON)
endif()

if(VCPKG_CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
    vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        OPTIONS
            -DBUILD_TESTING=OFF
            -DBUILD_CURL_EXE=OFF
            -DENABLE_MANUAL=OFF
            -DUSE_WIN32_LDAP=OFF
            -DCURL_DISABLE_TELNET=ON
            -DENABLE_IPV6=OFF
            -DENABLE_UNIX_SOCKETS=OFF
            -DCMAKE_USE_OPENSSL=ON
            -DCMAKE_USE_LIBSSH2=OFF
            -DCURL_STATICLIB=${CURL_STATICLIB}
        OPTIONS_DEBUG
            -DENABLE_DEBUG=ON
    )
else()
    vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        OPTIONS
            -DBUILD_TESTING=OFF
            -DBUILD_CURL_EXE=OFF
            -DCMAKE_USE_LIBSSH2=OFF
            -DENABLE_MANUAL=OFF
            -DCURL_STATICLIB=${CURL_STATICLIB}
        OPTIONS_DEBUG
            -DENABLE_DEBUG=ON
    )
endif()

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/curl RENAME copyright)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

vcpkg_copy_pdbs()