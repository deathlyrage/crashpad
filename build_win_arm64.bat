@echo off

rmdir /Q /S "build"
rmdir /Q /S "install"

cmake --version

SET BUILD_TYPE="RelWithDebInfo"

cmake -B build -DCMAKE_GENERATOR_PLATFORM=ARM64 -DBUILD_SHARED_LIBS=ON -DCMAKE_SYSTEM_VERSION=10 -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/win_arm64.cmake

cmake --build build --parallel --config %BUILD_TYPE%
cmake --install build --prefix install --config %BUILD_TYPE%

REM "C:\\Program Files\\7-Zip\\7z.exe" a Sentry-Native-Win64 "./install/*"

pause