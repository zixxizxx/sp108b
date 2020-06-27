# curl

```
PS D:\ccc> choco install curl
Chocolatey v0.10.11
Installing the following packages:
curl
By installing you accept licenses for the packages.
Progress: Downloading curl 7.70.0... 100%

curl v7.70.0 [Approved]
curl package files install completed. Performing other installation steps.
The package curl wants to run 'chocolateyInstall.ps1'.
Note: If you don't run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[N]o/[P]rint): y

Extracting 64-bit C:\ProgramData\chocolatey\lib\curl\tools\curl-7.70.0-win64-mingw.zip to C:\ProgramData\chocolatey\lib\curl\tools...
C:\ProgramData\chocolatey\lib\curl\tools
 ShimGen has successfully created a shim for curl.exe
 The install of curl was successful.
  Software installed to 'C:\ProgramData\chocolatey\lib\curl\tools'

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
PS D:\ccc> curl http://example.com


StatusCode        : 200
StatusDescription : OK
Content           : <!doctype html>
                    <html>
                    <head>
                        <title>Example Domain</title>

                        <meta charset="utf-8" />
                        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
                        <meta name="viewport" conten...
RawContent        : HTTP/1.1 200 OK
                    Age: 568200
                    Vary: Accept-Encoding
                    X-Cache: HIT
                    Accept-Ranges: bytes
                    Content-Length: 1256
                    Cache-Control: max-age=604800
                    Content-Type: text/html; charset=UTF-8
                    Date: Tue, 19 May ...
Forms             : {}
Headers           : {[Age, 568200], [Vary, Accept-Encoding], [X-Cache, HIT], [Accept-Ranges, bytes]...}    
Images            : {}
InputFields       : {}
Links             : {@{innerHTML=More information...; innerText=More information...; outerHTML=<A href="ht
                    tps://www.iana.org/domains/example">More information...</A>; outerText=More informatio
                    n...; tagName=A; href=https://www.iana.org/domains/example}}
ParsedHtml        : System.__ComObject
RawContentLength  : 1256
```

