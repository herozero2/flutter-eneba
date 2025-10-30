





cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../flutter/ephemeral")

# Define the configuration file.
configure_file(
  "${FLUTTER_MANAGED_DIR}/generated_config.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/generated_config.cmake"
  @ONLY
)

# Define the target.
add_executable(${BINARY_NAME} WIN32
  "main.cpp"
  "flutter_window.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/flutter_wrapper_app.cpp"
  "Runner.rc"
  "Runner.ico"
)

# Apply the standard set of build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions.
target_compile_definitions(${BINARY_NAME} PRIVATE "_UNICODE" "UNICODE")

# Add dependencies.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)

# Run the Flutter tool.
add_dependencies(${BINARY_NAME} flutter_assemble)





