if (CMAKE_CL_64)
    set ( DXUT_ARCH "x64" )
else()
    set ( DXUT_ARCH "Win32" )
endif()

find_path( DXUT_ROOT NAMES Core/DXUT.h )
    
find_library ( DXUT_LIBRARY_RELEASE NAMES DXUT PATHS ${DXUT_ROOT}/Core/Bin/*/${DXUT_ARCH}/Release )
find_library ( DXUT_LIBRARY_DEBUG NAMES DXUT PATHS ${DXUT_ROOT}/Core/Bin/*/${DXUT_ARCH}/Debug )
    
find_library ( DXUTOpt_LIBRARY_RELEASE NAMES DXUTOpt PATHS ${DXUT_ROOT}/Optional/Bin/*/${DXUT_ARCH}/Release )
find_library ( DXUTOpt_LIBRARY_DEBUG NAMES DXUTOpt PATHS ${DXUT_ROOT}/Optional/Bin/*/${DXUT_ARCH}/Debug )
    
if (DXUT_LIBRARY_RELEASE AND DXUT_LIBRARY_DEBUG AND DXUTOpt_LIBRARY_RELEASE AND DXUTOpt_LIBRARY_DEBUG)
	set ( DXUT_FOUND TRUE )
else ()
	set ( DXUT_FOUND FALSE )
endif ()
    
if (DXUT_FOUND)

    mark_as_advanced ( DXUT_ROOT DXUT_LIBRARY_RELEASE DXUT_LIBRARY_DEBUG DXUTOpt_LIBRARY_RELEASE DXUTOpt_LIBRARY_DEBUG )
	
    set ( DXUT_INCLUDE_DIR ${DXUT_ROOT}/Core ${DXUT_ROOT}/Optional CACHE STRING "" )
    set ( DXUT_LIBRARY optimized ${DXUT_LIBRARY_RELEASE} optimized ${DXUTOpt_LIBRARY_RELEASE} debug ${DXUT_LIBRARY_DEBUG} debug ${DXUTOpt_LIBRARY_DEBUG} CACHE STRING "")
	
elseif (DXUT_FIND_REQUIRED)

	message ( FATAL_ERROR "Could not find DXUT" )
	
endif()