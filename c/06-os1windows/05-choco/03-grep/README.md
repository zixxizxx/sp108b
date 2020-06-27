# grep


choco install grep


```
PS D:\ccc\course\sp\code\c\06-os1windows\04-choco\03-grep> choco install grep
Chocolatey v0.10.11
Installing the following packages:
grep
By installing you accept licenses for the packages.
Progress: Downloading grep 2.1032... 100%

grep v2.1032 [Approved] - Likely broken for FOSS users (due to download location changes)
grep package files install completed. Performing other installation steps.
The package grep wants to run 'chocolateyinstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[N]o/[P]rint): y

Progress: 100% - Completed download of C:\Users\user\AppData\Local\Temp\chocolatey\grep\2.1032\grep-2.10-w32-bin.zip (1.41 MB).
Download of grep-2.10-w32-bin.zip (1.41 MB) completed.
Hashes match.
Extracting C:\Users\user\AppData\Local\Temp\chocolatey\grep\2.1032\grep-2.10-w32-bin.zip to C:\ProgramData\chocolatey\lib\grep\tools\install...
C:\ProgramData\chocolatey\lib\grep\tools\install
 ShimGen has successfully created a shim for egrep.exe
 ShimGen has successfully created a shim for fgrep.exe
 ShimGen has successfully created a shim for grep.exe
 The install of grep was successful.
  Software installed to 'C:\ProgramData\chocolatey\lib\grep\tools\install'

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).

PS D:\ccc\course\sp\code\c\06-os1windows\04-choco\03-grep> grep choco README.md
choco install grep
```