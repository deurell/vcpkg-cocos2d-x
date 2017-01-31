function(vcpkg_build_cmake)
    cmake_parse_arguments(_bc "MSVC_64_TOOLSET;DISABLE_PARALLEL;MINSIZEREL" "" "" ${ARGN})

    set(MSVC_EXTRA_ARGS)
	set(MSVC_RELEASE_CONFIG Release)
	
    # Specifies the architecture of the toolset, NOT the architecture of the produced binary
    if (_bc_MSVC_64_TOOLSET)
        list(APPEND MSVC_EXTRA_ARGS "/p:PreferredToolArchitecture=x64")
    endif()
	
	# Specifies  if MinSizeRel configuration is specified
    if (_bc_MINSIZEREL)
		set(MSVC_RELEASE_CONFIG MinSizeRel)
    endif()

    if (NOT _bc_DISABLE_PARALLEL)
        list(APPEND MSVC_EXTRA_ARGS "/m")
    endif()

    message(STATUS "Build ${TARGET_TRIPLET}-rel")
    vcpkg_execute_required_process(
        COMMAND ${CMAKE_COMMAND} --build . --config ${MSVC_RELEASE_CONFIG} -- /p:VCPkgLocalAppDataDisabled=true ${MSVC_EXTRA_ARGS}
        WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel
        LOGNAME build-${TARGET_TRIPLET}-rel
    )
    message(STATUS "Build ${TARGET_TRIPLET}-rel done")

    message(STATUS "Build ${TARGET_TRIPLET}-dbg")
    vcpkg_execute_required_process(
        COMMAND ${CMAKE_COMMAND} --build . --config Debug -- /p:VCPkgLocalAppDataDisabled=true ${MSVC_EXTRA_ARGS}
        WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg
        LOGNAME build-${TARGET_TRIPLET}-dbg
    )
    message(STATUS "Build ${TARGET_TRIPLET}-dbg done")
endfunction()
