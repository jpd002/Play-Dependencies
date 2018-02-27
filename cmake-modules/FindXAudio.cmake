#   XAudio_FOUND        - True if XAudio found.
#   XAudio_INCLUDE_DIR - where to find XAudio2.h.
#   XAudio_LIBRARY    - library.

set(XAudio_SEARCH_PATH 
  "$ENV{DXSDK_DIR}"
  "${ProgramFiles}/Microsoft DirectX SDK (June 2010)"
  "${ProgramFiles}/Microsoft DirectX SDK (February 2010)"
  "${ProgramFiles}/Microsoft DirectX SDK (March 2009)"
  "${ProgramFiles}/Microsoft DirectX SDK (August 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (June 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (March 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (November 2007)"
  "${ProgramFiles}/Microsoft DirectX SDK (August 2007)"
  "${ProgramFiles}/Microsoft DirectX SDK"
)

if(CMAKE_CL_64)
  set(XAudio_LIBPATH_SUFFIX "Lib/x64")
else(CMAKE_CL_64)
  set(XAudio_LIBPATH_SUFFIX "Lib/x86")
endif(CMAKE_CL_64)

find_path(XAudio_ROOT_PATH "Include/XAudio2.h"
  PATHS
  "$ENV{DXSDK_DIR}"    
  "${ProgramFiles}/Microsoft DirectX SDK (June 2010)"
  "${ProgramFiles}/Microsoft DirectX SDK (February 2010)"
  "${ProgramFiles}/Microsoft DirectX SDK (March 2009)"
  "${ProgramFiles}/Microsoft DirectX SDK (August 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (June 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (March 2008)"
  "${ProgramFiles}/Microsoft DirectX SDK (November 2007)"
  "${ProgramFiles}/Microsoft DirectX SDK (August 2007)"
  "${ProgramFiles}/Microsoft DirectX SDK"
)
set(XAudio_INCLUDE_DIR "${XAudio_ROOT_PATH}/Include")

find_library(XAudio_LIBRARY X3DAudio
  HINTS "${XAudio_ROOT_PATH}/${XAudio_LIBPATH_SUFFIX}"
)

unset(XAudio_ROOT_PATH)
unset(XAudio_SEARCH_PATH)
unset(XAudio_LIBPATH_SUFFIX)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(XAudio DEFAULT_MSG XAudio_LIBRARY XAudio_INCLUDE_DIR)

mark_as_advanced(XAudio_LIBRARY XAudio_INCLUDE_DIR)
