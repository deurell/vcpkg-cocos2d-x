include(vcpkg_common_functions)

SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src)
vcpkg_download_distfile(ARCHIVE
    URLS "http://api.nuget.org/packages/angle.windowsstore.2.1.11.nupkg"
    FILENAME "angle.zip"
    SHA512 2af634c408ea75637d7c53e7f63f311e5172bc974a54e98c4179997b3857685cb1d5036870c8fb8121621626ee1a9bc5973b37255aa0b78aa1982463cfa7acac
)
vcpkg_extract_source_archive(${ARCHIVE})


# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps/LICENSE ${CURRENT_PACKAGES_DIR}/share/cocos2d-x-deps/copyright)

file(COPY ${SOURCE_PATH}/Include DESTINATION ${CURRENT_PACKAGES_DIR}/include)


# We are going to copy everything to the cocos2d-x-deps dir
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps)

#remove the previous output files
file(REMOVE_RECURSE ${OUTPUT_PATH})

# Copy the angle header files
SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src)
file(COPY ${SOURCE_PATH}/Include/ DESTINATION ${OUTPUT_PATH}/win10-specific/angle/include)

# Copy the win32 files
SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/bin/UAP/Win32)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/angle/prebuilt/win32/)

file(COPY ${SOURCE_PATH}/libEGL.dll DESTINATION ${OUTPUT_PATH}/)
file(COPY ${SOURCE_PATH}/libEGL.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.lib DESTINATION ${OUTPUT_PATH}/)

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/bin/UAP/x64)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/angle/prebuilt/x64/)
file(COPY ${SOURCE_PATH}/libEGL.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libEGL.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/bin/UAP/ARM)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/angle/prebuilt/arm/)
file(COPY ${SOURCE_PATH}/libEGL.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libEGL.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/libGLESv2.lib DESTINATION ${OUTPUT_PATH})

# Copy the curl header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../curl_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/include/win10)

file(COPY ${SOURCE_PATH}/include/curl DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/prebuilt/win10/win32/)
file(COPY ${SOURCE_PATH}/bin/libcurl.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/libcurl_imp.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../curl_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/prebuilt/win10/x64/)
file(COPY ${SOURCE_PATH}/bin/libcurl.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/libcurl_imp.lib DESTINATION ${OUTPUT_PATH}/)

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../curl_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/curl/prebuilt/win10/arm/)
file(COPY ${SOURCE_PATH}/bin/libcurl.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/libcurl_imp.lib DESTINATION ${OUTPUT_PATH})

# Copy the openssl header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../openssl_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/include/win10)
file(COPY ${SOURCE_PATH}/include/openssl DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/prebuilt/win10/win32/)
file(COPY ${SOURCE_PATH}/bin/libeay32.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/ssleay32.dll DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../openssl_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/prebuilt/win10/x64/)
file(COPY ${SOURCE_PATH}/bin/libeay32.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/ssleay32.dll DESTINATION ${OUTPUT_PATH}/)

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../openssl_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/openssl/prebuilt/win10/arm/)
file(COPY ${SOURCE_PATH}/bin/libeay32.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/ssleay32.dll DESTINATION ${OUTPUT_PATH})

SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps)

# Copy the freetype header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../freetype_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/include/win10)
file(COPY ${SOURCE_PATH}/include/freetype DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/include/ft2build.h DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/prebuilt/win10/win32/)
file(COPY ${SOURCE_PATH}/lib/freetype.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../freetype_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/prebuilt/win10/x64/)
file(COPY ${SOURCE_PATH}/lib/freetype.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../freetype_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/freetype2/prebuilt/win10/arm/)
file(COPY ${SOURCE_PATH}/lib/freetype.lib DESTINATION ${OUTPUT_PATH})

SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps)

# Copy the sqlite3 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../sqlite3_x86-uwp)

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/sqlite3/libraries/win10/win32/)
file(COPY ${SOURCE_PATH}/bin/sqlite3.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/sqlite3.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../sqlite3_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/sqlite3/libraries/win10/x64/)
file(COPY ${SOURCE_PATH}/bin/sqlite3.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/sqlite3.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../sqlite3_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/sqlite3/libraries/win10/arm/)
file(COPY ${SOURCE_PATH}/bin/sqlite3.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/sqlite3.lib DESTINATION ${OUTPUT_PATH})

# Copy the libogg header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libogg_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/include)
file(COPY ${SOURCE_PATH}/include/ogg DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/win32/)
file(COPY ${SOURCE_PATH}/bin/ogg.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/ogg.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libogg_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/x64/)
file(COPY ${SOURCE_PATH}/bin/ogg.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/ogg.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libogg_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/arm/)
file(COPY ${SOURCE_PATH}/bin/ogg.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/ogg.lib DESTINATION ${OUTPUT_PATH})

# Copy the libvorbis header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libvorbis_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/include)
file(COPY ${SOURCE_PATH}/include/vorbis DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/win32/)
file(COPY ${SOURCE_PATH}/bin/vorbis.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbis.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/vorbisfile.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbisfile.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libvorbis_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/x64/)
file(COPY ${SOURCE_PATH}/bin/vorbis.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbis.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/vorbisfile.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbisfile.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libvorbis_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/OggDecoder/prebuilt/arm/)
file(COPY ${SOURCE_PATH}/bin/vorbis.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbis.lib DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/bin/vorbisfile.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/vorbisfile.lib DESTINATION ${OUTPUT_PATH})

# Copy the zlib header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../zlib_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib)
file(COPY ${SOURCE_PATH}/include DESTINATION ${OUTPUT_PATH})

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib/prebuilt/win32)
file(COPY ${SOURCE_PATH}/bin/zlib1.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/zlib.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../zlib_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib/prebuilt/x64)
file(COPY ${SOURCE_PATH}/bin/zlib1.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/zlib.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../zlib_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/win10-specific/zlib/prebuilt/arm)
file(COPY ${SOURCE_PATH}/bin/zlib1.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/zlib.lib DESTINATION ${OUTPUT_PATH})

# Copy the libwebsockets header files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libwebsockets_x86-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/include/win10)
file(COPY ${SOURCE_PATH}/include/ DESTINATION ${OUTPUT_PATH}/websockets/include/win10)

# Copy the win32 files
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/prebuilt/win10/win32/)
file(COPY ${SOURCE_PATH}/bin/websockets.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/websockets.lib DESTINATION ${OUTPUT_PATH})

# Copy the x64 files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libwebsockets_x64-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/prebuilt/win10/x64/)
file(COPY ${SOURCE_PATH}/bin/websockets.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/websockets.lib DESTINATION ${OUTPUT_PATH})

# Copy the arm files
SET(SOURCE_PATH ${CURRENT_PACKAGES_DIR}/../libwebsockets_arm-uwp)
SET(OUTPUT_PATH ${CURRENT_PACKAGES_DIR}/../cocos2d-x-deps/websockets/prebuilt/win10/arm/)
file(COPY ${SOURCE_PATH}/bin/websockets.dll DESTINATION ${OUTPUT_PATH})
file(COPY ${SOURCE_PATH}/lib/websockets.lib DESTINATION ${OUTPUT_PATH})



