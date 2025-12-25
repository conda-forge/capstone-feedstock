@echo on

mkdir build
cd build

:: from https://github.com/capstone-engine/capstone/blob/5.0.6/bindings/python/setup.py#L146
:: but with CAPSTONE_BUILD_CSTOOL=ON
cmake -G Ninja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_STATIC_LIBS=OFF ^
    -DCAPSTONE_BUILD_TESTS=OFF ^
    -DCAPSTONE_BUILD_CSTOOL=ON ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1

if [%PKG_NAME%] == [libcapstone] (
    del /s /q %LIBRARY_BIN%\cstool.exe
)
