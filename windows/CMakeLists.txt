




cmake_minimum_required(VERSION 3.14)
project(eneba_ecommerce LANGUAGES CXX)

set(BINARY_NAME "eneba_ecommerce")

# Configure build options.
get_property(IS_MULTICONFIG GLOBAL PROPERTY GENERATOR_IS_MULTICONFIG)
if(IS_MULTICONFIG)
  set(CMAKE_CONFIGURATION_TYPES "Debug;Profile;Release"
    CACHE STRING "" FORCE)
else()
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
      "Flutter build mode" FORCE)
  endif()
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Profile" "Release")
endif()

set(CMAKE_INSTALL_MESSAGE LAZY)
set(CMAKE_VS_GLOBALS
  "VisualStudioVersion=16.0"
  "MinimumVisualStudioVersion=15.0"
)

# Define the configuration file.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter/ephemeral")
configure_file(
  "${FLUTTER_MANAGED_DIR}/generated_config.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/generated_config.cmake"
  @ONLY
)

# Add Flutter as a subdirectory.
add_subdirectory("${FLUTTER_MANAGED_DIR}" "${CMAKE_CURRENT_BINARY_DIR}/flutter")

# Application build.
add_subdirectory("runner")




