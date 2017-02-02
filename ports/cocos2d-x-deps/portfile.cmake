include(vcpkg_common_functions)

if (NOT VCPKG_CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
    message(FATAL_ERROR "This portfile only supports UWP")
endif()

if (VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    set(COCOS_PLATFORM  "arm")
    set(VCPKG_PLATFORM  "arm")
elseif (VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
    set(COCOS_PLATFORM  "x64")
    set(VCPKG_PLATFORM  "x64")
elseif (VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
    set(COCOS_PLATFORM  "win32")
    set(VCPKG_PLATFORM  "x86")
else ()
    message(FATAL_ERROR "Unsupported architecture")
endif()

SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src)
vcpkg_download_distfile(ARCHIVE
    URLS "http://api.nuget.org/packages/angle.windowsstore.2.1.13.nupkg"
    FILENAME "angle.2.1.13.zip"
    SHA512 e0323328573317d2e7fb9a9bebb408bd60b40d523b9eb63de35b0467875dff3eb285c5127b1e9f1f7ef45a48c637c6a165bc1f48c588bd975fdc016bb72fc93d
)
vcpkg_extract_source_archive(${ARCHIVE})


# Put the licence file where vcpkg expects it
file(COPY ${CMAKE_CURRENT_LIST_DIR}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps/LICENSE ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps/copyright)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/license.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)


# We are going to copy everything to the cocos2d-x-deps dir
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps)

#remove the previous output files
#file(REMOVE_RECURSE ${OUTPUT_PATH})

# Copy the angle header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/angle/include)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/Include/ DESTINATION ${OUTPUT_PATH})
endif()

# Copy the angle files
SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/bin/UAP/${COCOS_PLATFORM})
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/angle/prebuilt/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libEGL.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libEGL.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.lib DESTINATION ${OUTPUT_PATH})

# Copy the curl header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../curl_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/include/win10)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/curl DESTINATION ${OUTPUT_PATH})
endif()

# Copy the curl files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../curl_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/prebuilt/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/libcurl.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/libcurl_imp.lib DESTINATION ${OUTPUT_PATH})

# Copy the openssl header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../openssl_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/include/win10)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/openssl DESTINATION ${OUTPUT_PATH})
endif()

# Copy the openssl files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../openssl_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/prebuilt/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/libeay32.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/ssleay32.dll DESTINATION ${OUTPUT_PATH})

# Copy the freetype header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../freetype_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/include/win10)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/freetype DESTINATION ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/ft2build.h DESTINATION ${OUTPUT_PATH})
endif()

# Copy the freetype files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../freetype_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/prebuilt/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/freetype.lib DESTINATION ${OUTPUT_PATH})

# Copy the sqlite3 files
# cocos2d-x already provides the header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../sqlite3_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/sqlite3/libraries/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/sqlite3.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/sqlite3.lib DESTINATION ${OUTPUT_PATH})

# Copy the libogg header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libogg_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/include)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/ogg DESTINATION ${OUTPUT_PATH})
endif()

# Copy the libogg files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libogg_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/ogg.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/ogg.lib DESTINATION ${OUTPUT_PATH})

# Copy the libvorbis header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libvorbis_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/include)
    file(COPY ${SOURCE_PATH}/include/vorbis DESTINATION ${OUTPUT_PATH})
endif()

# Copy the libvorbis files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libvorbis_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/${COCOS_PLATFORM}/)
file(COPY ${SOURCE_PATH}/bin/vorbis.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbis.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/vorbisfile.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbisfile.lib DESTINATION ${OUTPUT_PATH})

# Copy the zlib header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../zlib_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include DESTINATION ${OUTPUT_PATH})
endif()

# Copy the zlib files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../zlib_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib/prebuilt/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/zlib1.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/zlib.lib DESTINATION ${OUTPUT_PATH})

# Copy the libwebsockets header files
if (VCPKG_PLATFORM STREQUAL "x86")
    SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libwebsockets_x86-uwp)
    SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/include/win10)
    file(REMOVE_RECURSE ${OUTPUT_PATH})
    file(COPY ${SOURCE_PATH}/include/ DESTINATION ${OUTPUT_PATH})
endif()

# Copy the libwebsockets files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libwebsockets_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/prebuilt/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/websockets.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/websockets.lib DESTINATION ${OUTPUT_PATH})

# Copy the chipmunk files. cocos2d-x already has the header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../chipmunk_${VCPKG_PLATFORM}-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/chipmunk/prebuilt/win10/${COCOS_PLATFORM}/)
file(REMOVE_RECURSE ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/chipmunk.lib DESTINATION ${OUTPUT_PATH})





