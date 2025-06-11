@echo on

if "%PKG_NAME%"=="cstool" (
  set CAPSTONE_BUILD_CSTOOL=ON
) else (
  set CAPSTONE_BUILD_CSTOOL=OFF
)

echo %CAPSTONE_BUILD_CSTOOL%

cmake %CMAKE_ARGS% ^
  -G Ninja ^
  -B build ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCAPSTONE_BUILD_SHARED_LIBS=ON ^
  -DCAPSTONE_BUILD_STATIC_LIBS=OFF ^
  -DCAPSTONE_BUILD_CSTOOL=%CAPSTONE_BUILD_CSTOOL%
if %ERRORLEVEL% neq 0 exit 1

cmake --build build -j%CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build
if %ERRORLEVEL% neq 0 exit 1
