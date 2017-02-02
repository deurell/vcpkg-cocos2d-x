# Common Ambient Variables:
#   VCPKG_ROOT_DIR = <C:\path\to\current\vcpkg>
#   TARGET_TRIPLET is the current triplet (x86-windows, etc)
#   PORT is the current port name (zlib, etc)
#   CURRENT_BUILDTREES_DIR = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR  = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/Chipmunk-7.0.1)
vcpkg_download_distfile(ARCHIVE
    URLS "http://chipmunk-physics.net/release/Chipmunk-7.x/Chipmunk-7.0.1.tgz"
    FILENAME "Chipmunk-7.0.1.tgz"
    SHA512 1dccc9caa3c8a170654f2d9b9ffe27c430b6603bb9e23f262c587619ff44acd8b69be6a59a9ee98f435664d681564d1d39c4726bf589ed179a47f41e53f5f8ee
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES ${CMAKE_CURRENT_LIST_DIR}/0001-winrt.patch
            ${CMAKE_CURRENT_LIST_DIR}/0002-cocos2d.patch
            ${CMAKE_CURRENT_LIST_DIR}/0003-cocos2d_winrt.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_DEMOS=OFF
        -DBUILD_SHARED=OFF
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/chipmunk)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/chipmunk/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/chipmunk/copyright)
