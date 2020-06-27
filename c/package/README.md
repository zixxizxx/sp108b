# 套件管理員 -- Package Manager

* https://chocolatey.org/packages
* https://conan.io/center/






## conan 

* [C++ Package Management With Conan: Introduction](https://medium.com/@ilyas.hamadouche/c-package-management-with-conan-introduction-8c7bd928c009)

```
PS D:\ccc\course\sp\code\c\x7\c7> pip3 install conan
Collecting conan
  Downloading https://files.pythonhosted.org/packages/47/1f/7fa7e62ddb343c80209dcaf56bf11b712a6c49d8aa9d4d37f8aaed351c9a/conan-1.25.1.tar.gz (580kB)
     |████████████████████████████████| 583kB 544kB/s 
Collecting PyJWT<2.0.0,>=1.4.0
  Downloading https://files.pythonhosted.org/packages/87/8b/6a9f14b5f781697e51259d81657e6048fd31a113229cf346880bb7545565/PyJWT-1.7.1-py2.py3-none-any.whl
Requirement already satisfied: requests<3.0.0,>=2.8.1 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from conan) (2.22.0)
Requirement already satisfied: urllib3!=1.25.4,!=1.25.5 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from conan) (1.22)
Requirement already satisfied: colorama<0.5.0,>=0.3.3 in c:\users\user\appdata\roaming\python\python37\site-packages (from conan) (0.4.1)
Requirement already satisfied: PyYAML<6.0,>=3.11 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from conan) (5.1.2)
Collecting patch-ng<1.18,>=1.17.4
  Downloading https://files.pythonhosted.org/packages/c1/b2/ad3cd464101435fdf642d20e0e5e782b4edaef1affdf2adfc5c75660225b/patch-ng-1.17.4.tar.gz
Collecting fasteners>=0.14.1
  Downloading https://files.pythonhosted.org/packages/18/bd/55eb2d6397b9c0e263af9d091ebdb756b15756029b3cededf6461481bc63/fasteners-0.15-py2.py3-none-any.whl
Requirement already satisfied: six<=1.14.0,>=1.10.0 in c:\users\user\appdata\roaming\python\python37\site-packages (from conan) (1.12.0)
Collecting node-semver==0.6.1
  Downloading https://files.pythonhosted.org/packages/08/51/6cf3a2b18ca35cbe4ad3c7538a7c3dc0cb24e71629fb16e729c137d06432/node_semver-0.6.1-py3-none-any.whl
Collecting distro<1.2.0,>=1.0.2
  Downloading https://files.pythonhosted.org/packages/b0/55/29bfd4d4d4149e860ed01aa446108eb17b240997b746c06a2d0c8ce04f69/distro-1.1.0-py2.py3-none-any.whl
Collecting future<0.19.0,>=0.16.0
  Downloading https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9/future-0.18.2.tar.gz (829kB)
     |████████████████████████████████| 829kB 225kB/s 
Requirement already satisfied: pygments<3.0,>=2.0 in c:\users\user\appdata\roaming\python\python37\site-packages (from conan) (2.4.2)
Collecting deprecation<2.1,>=2.0
  Downloading https://files.pythonhosted.org/packages/b9/2a/d5084a8781398cea745c01237b95d9762c382697c63760a95cc6a814ad3a/deprecation-2.0.7-py2.py3-none-any.whl
Requirement already satisfied: tqdm<5,>=4.28.1 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from conan) (4.36.1)
Requirement already satisfied: Jinja2<3,>=2.3 in c:\users\user\appdata\roaming\python\python37\site-packages (from conan) (2.10.1)
Requirement already satisfied: python-dateutil<3,>=2.7.0 in c:\users\user\appdata\roaming\python\python37\site-packages (from conan) (2.8.0)
Collecting bottle<0.13,>=0.12.8
  Downloading https://files.pythonhosted.org/packages/e9/39/2bf3a1fd963e749cdbe5036a184eda8c37d8af25d1297d94b8b7aeec17c4/bottle-0.12.18-py3-none-any.whl (89kB)
     |████████████████████████████████| 92kB 196kB/s 
Collecting pluginbase<1.0,>=0.5
  Downloading https://files.pythonhosted.org/packages/6e/f4/1db0a26c1c7fad81a1214ad1b02839a7bd98d8ba68f782f6edcc3d343441/pluginbase-0.7.tar.gz (40kB)
     |████████████████████████████████| 40kB 327kB/s 
Requirement already satisfied: certifi>=2017.4.17 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from requests<3.0.0,>=2.8.1->conan) (2019.9.11)
Requirement already satisfied: chardet<3.1.0,>=3.0.2 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from requests<3.0.0,>=2.8.1->conan) (3.0.4)
Requirement already satisfied: idna<2.9,>=2.5 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from requests<3.0.0,>=2.8.1->conan) (2.6)
Collecting monotonic>=0.1
  Downloading https://files.pythonhosted.org/packages/ac/aa/063eca6a416f397bd99552c534c6d11d57f58f2e94c14780f3bbf818c4cf/monotonic-1.5-py2.py3-none-any.whl
Collecting packaging
  Downloading https://files.pythonhosted.org/packages/62/0a/34641d2bf5c917c96db0ded85ae4da25b6cd922d6b794648d4e7e07c88e5/packaging-20.3-py2.py3-none-any.whl
Requirement already satisfied: MarkupSafe>=0.23 in c:\users\user\appdata\roaming\python\python37\site-packages (from Jinja2<3,>=2.3->conan) (1.1.1)
Requirement already satisfied: pyparsing>=2.0.2 in c:\users\user\appdata\local\programs\python\python37\lib\site-packages (from packaging->deprecation<2.1,>=2.0->conan) (2.4.2)
Building wheels for collected packages: conan, patch-ng, future, pluginbase
  Building wheel for conan (setup.py) ... done
  Created wheel for conan: filename=conan-1.25.1-cp37-none-any.whl size=675866 sha256=7ad0ae0e3c935d663d143171c14cf573854384146942a0eed5b4b385ecfbe537
  Stored in directory: C:\Users\user\AppData\Local\pip\Cache\wheels\a6\63\af\bc9ae247168e39a7c8ca9f13e4de4e03cc6391178f1a60e4fa
  Building wheel for patch-ng (setup.py) ... done
  Created wheel for patch-ng: filename=patch_ng-1.17.4-cp37-none-any.whl size=16100 sha256=163c6b7783c6e8e2fda21c8dbd4dca5521492856bce96bbb25ad662a8cf6be68
  Stored in directory: C:\Users\user\AppData\Local\pip\Cache\wheels\5a\5a\a0\61661120c9eb9f88e8eb179e81cfadfdb780dda4246d7c7550
  Building wheel for future (setup.py) ... done
  Created wheel for future: filename=future-0.18.2-cp37-none-any.whl size=491063 sha256=bad13e5eac4b894eba17c909b59f69704dac490e1425c297ddb0ebec22d8024a
  Stored in directory: C:\Users\user\AppData\Local\pip\Cache\wheels\8b\99\a0\81daf51dcd359a9377b110a8a886b3895921802d2fc1b2397e
  Building wheel for pluginbase (setup.py) ... done
  Created wheel for pluginbase: filename=pluginbase-0.7-cp37-none-any.whl size=7712 sha256=faea8d06f0f6ab002c0d42e4da62c08b279511bcc7e0bd4a15961134f81808c3
  Stored in directory: C:\Users\user\AppData\Local\pip\Cache\wheels\ce\78\59\1c57c1f57381a115b31c12c969baa20f62b97f7a64c079cce3
Successfully built conan patch-ng future pluginbase
Installing collected packages: PyJWT, patch-ng, monotonic, fasteners, node-semver, distro, future, packaging, deprecation, bottle, pluginbase, conan
Successfully installed PyJWT-1.7.1 bottle-0.12.18 conan-1.25.1 deprecation-2.0.7 distro-1.1.0 fasteners-0.15 future-0.18.2 monotonic-1.5 node-semver-0.6.1 packaging-20.3 patch-ng-1.17.4 pluginbase-0.7
WARNING: You are using pip version 19.3.1; however, version 20.1 is available.
You should consider upgrading via the 'python -m pip install --upgrade pip' command.
```

## 使用

```
PS D:\ccc\course\sp\code\c\x7\c7> conan --help
Consumer commands
  install    Installs the requirements specified in a recipe (conanfile.py or conanfile.txt).
  config     Manages Conan configuration.
  get        Gets a file or list a directory of a given reference or package.
  info       Gets information about the dependency graph of a recipe.
  search     Searches package recipes and binaries in the local cache or a remote.
Creator commands
  new        Creates a new package recipe template with a 'conanfile.py' and optionally,
             'test_package' testing files.
  create     Builds a binary package for a recipe (conanfile.py).
  upload     Uploads a recipe and binary packages to a remote.
  export     Copies the recipe (conanfile.py & associated files) to your local cache.
  export-pkg Exports a recipe, then creates a package from local source and build folders.
  test       Tests a package consuming it from a conanfile.py with a test() method.
Package development commands
  source     Calls your local conanfile.py 'source()' method.
  build      Calls your local conanfile.py 'build()' method.
  package    Calls your local conanfile.py 'package()' method.
  editable   Manages editable packages (packages that reside in the user workspace, but are
             consumed as if they were in the cache).
  workspace  Manages a workspace (a set of packages consumed from the user workspace that
             belongs to the same project).
Misc commands
  profile    Lists profiles in the '.conan/profiles' folder, or shows profile details.
  remote     Manages the remote list and the package recipes associated with a remote.
  user       Authenticates against a remote with user/pass, caching the auth token.
  imports    Calls your local conanfile.py or conanfile.txt 'imports' method.
  copy       Copies conan recipes and packages to another user/channel.
  remove     Removes packages or binaries matching pattern from local cache or remote.
  alias      Creates and exports an 'alias package recipe'.
  download   Downloads recipe and binaries to the local cache, without using settings.
  inspect    Displays conanfile attributes, like name, version, and options. Works locally,
             in local cache and remote.
  help       Shows help for a specific command.
  graph      Generates and manipulates lock files.
  frogarian  Conan The Frogarian

Conan commands. Type "conan <command> -h" for help
```