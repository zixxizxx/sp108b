## 

* https://medium.com/@ilyas.hamadouche/c-package-management-with-conan-introduction-8c7bd928c009


* https://github.com/conan-io/conan/issues/2310

要改

```
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
set(CONAN_DISABLE_CHECK_COMPILER True) // 加入這行
conan_basic_setup()
```


結果

```
PS D:\ccc\course\sp\code\c\package\01-sqlitewin\buildwin> conan install ..
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

conanfile.txt: Installing package
Requirements
    sqlite3/3.29.0@bincrafters/stable from 'conan-center' - Cache
Packages
    sqlite3/3.29.0@bincrafters/stable:34b70e4f7ca15a88b9c771a2da37431ceebd76fa - Cache

Installing (downloading, building) binaries...
sqlite3/3.29.0@bincrafters/stable: Already installed!
conanfile.txt: Generator cmake created conanbuildinfo.cmake
conanfile.txt: Generator txt created conanbuildinfo.txt
conanfile.txt: Generated conaninfo.txt
conanfile.txt: Generated graphinfo
```
