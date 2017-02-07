include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/freetype-2.5.5)
vcpkg_download_distfile(ARCHIVE
    URLS "http://download.savannah.gnu.org/releases/freetype/freetype-2.5.5.tar.bz2"
    FILENAME "freetype-2.5.5.tar.bz2"
    SHA512 1fc72d24da1744a6a5faf3338e49912c81ce83f30def1e80a2a15b50e7f83893a4fe24a70ef88b65ecc217bed1c15d85804c364eba221b35e25531c727fe8559
)
vcpkg_extract_source_archive(${ARCHIVE})

if (VCPKG_CMAKE_SYSTEM_NAME STREQUAL WindowsStore)
	set(VCPKG_LIBRARY_LINKAGE static)
endif()


vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES ${CMAKE_CURRENT_LIST_DIR}/0002-Add-CONFIG_INSTALL_PATH-option.patch
            ${CMAKE_CURRENT_LIST_DIR}/0003-Fix-UWP.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCONFIG_INSTALL_PATH=share/freetype
        -DWITH_ZLIB=ON
        -DWITH_BZip2=OFF
        -DWITH_PNG=OFF
        -DWITH_HarfBuzz=OFF
)

vcpkg_install_cmake(MINSIZEREL)

#file(RENAME ${CURRENT_PACKAGES_DIR}/include/freetype2/freetype ${CURRENT_PACKAGES_DIR}/include/freetype)
file(RENAME ${CURRENT_PACKAGES_DIR}/include/freetype2/ft2build.h ${CURRENT_PACKAGES_DIR}/include/ft2build.h)
#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/freetype2)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(READ ${CURRENT_PACKAGES_DIR}/debug/share/freetype/freetype-config-debug.cmake DEBUG_MODULE)
string(REPLACE "\${_IMPORT_PREFIX}" "\${_IMPORT_PREFIX}/debug" DEBUG_MODULE "${DEBUG_MODULE}")
file(WRITE ${CURRENT_PACKAGES_DIR}/share/freetype/freetype-config-debug.cmake "${DEBUG_MODULE}")

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY
    ${SOURCE_PATH}/docs/LICENSE.TXT
    ${SOURCE_PATH}/docs/FTL.TXT
    ${SOURCE_PATH}/docs/GPLv2.TXT
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/freetype
)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/freetype/LICENSE.TXT ${CURRENT_PACKAGES_DIR}/share/freetype/copyright)
vcpkg_copy_pdbs()

