
```
PS D:\ccc\course\sp\code\c\package\01-sqlite> conan search sqlite3* --remote=conan-center
sqlite3/3.14.1@bincrafters/stable
sqlite3/3.20.1@bincrafters/stable
sqlite3/3.21.0@bincrafters/stable
sqlite3/3.25.3@bincrafters/stable
sqlite3/3.26.0@bincrafters/stable
sqlite3/3.27.1@bincrafters/stable
sqlite3/3.27.2@bincrafters/stable
sqlite3/3.28.0@bincrafters/stable
sqlite3/3.29.0
sqlite3/3.29.0@bincrafters/stable
sqlite3/3.30.1
sqlite3/3.31.0
sqlite3/3.31.1
PS D:\ccc\course\sp\code\c\package\01-sqlite>
PS D:\ccc\course\sp\code\c\package\01-sqlite> cd build
PS D:\ccc\course\sp\code\c\package\01-sqlite\build> conan install ..
Auto detecting your dev setup to initialize the default profile (C:\Users\user\.conan\profiles\default)
Found Visual Studio 15
Found gcc 5.1
Found clang 4.0
Default settings
        os=Windows
        os_build=Windows
        arch=x86_64
        arch_build=x86_64
        compiler=Visual Studio
        compiler.version=15
        build_type=Release
*** You can change them in C:\Users\user\.conan\profiles\default ***
*** Or override with -s compiler='other' -s ...s***


Configuration:
[settings]
arch=x86_64
arch_build=x86_64
build_type=Release
compiler=Visual Studio
compiler.runtime=MD
compiler.version=15
os=Windows
os_build=Windows
[options]
[build_requires]
[env]

sqlite3/3.29.0@bincrafters/stable: Not found in local cache, looking in remotes...
sqlite3/3.29.0@bincrafters/stable: Trying with 'conan-center'...
Downloading conanmanifest.txt completed [0.28k]
Downloading conanfile.py completed [3.51k]
Downloading conan_export.tgz completed [1.49k]
Decompressing conan_export.tgz completed [0.00k]
sqlite3/3.29.0@bincrafters/stable: Downloaded recipe revision 0
conanfile.txt: Installing package
Requirements
    sqlite3/3.29.0@bincrafters/stable from 'conan-center' - Downloaded
    sqlite3/3.29.0@bincrafters/stable:34b70e4f7ca15a88b9c771a2da37431ceebd76fa - Download

Installing (downloading, building) binaries...
sqlite3/3.29.0@bincrafters/stable: Retrieving package 34b70e4f7ca15a88b9c771a2da37431ceebd76fa from remote 'conan-center'
Downloading conaninfo.txt completed [0.87k]
Downloading conan_package.tgz completed [890.27k]
Decompressing conan_package.tgz completed [0.00k]
sqlite3/3.29.0@bincrafters/stable: Package installed 34b70e4f7ca15a88b9c771a2da37431ceebd76fa
sqlite3/3.29.0@bincrafters/stable: Downloaded package revision 0
conanfile.txt: Generator cmake created conanbuildinfo.cmake
conanfile.txt: Generator txt created conanbuildinfo.txt
conanfile.txt: Generated conaninfo.txt
conanfile.txt: Generated graphinfo
PS D:\ccc\course\sp\code\c\package\01-sqlite\build> cmake .. -G Ninja
CMake Error: CMake was unable to find a build program corresponding to "Ninja".  CMAKE_MAKE_PROGRAM is not set.  You probably need to select a different build tool.
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!
See also "D:/ccc/course/sp/code/c/package/01-sqlite/build/CMakeFiles/CMakeOutput.log".
PS D:\ccc\course\sp\code\c\package\01-sqlite\build> cmake .. -G Ninja
-- The CXX compiler identification is GNU 5.1.0
-- Check for working CXX compiler: C:/Program Files (x86)/CodeBlocks/MinGW/bin/c++.exe
-- Check for working CXX compiler: C:/Program Files (x86)/CodeBlocks/MinGW/bin/c++.exe -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Conan: Adjusting output directories
-- Conan: Using cmake global configuration
-- Conan: Adjusting default RPATHs Conan policies
-- Conan: Adjusting language standard
CMake Error at build/conanbuildinfo.cmake:666 (message):
  Incorrect 'Visual Studio'.  Toolset specifies compiler as 'MSVC' but CMake
  detected 'GNU'
Call Stack (most recent call first):
  build/conanbuildinfo.cmake:246 (conan_check_compiler)
  CMakeLists.txt:7 (conan_basic_setup)


-- Configuring incomplete, errors occurred!
See also "D:/ccc/course/sp/code/c/package/01-sqlite/build/CMakeFiles/CMakeOutput.log".
```
