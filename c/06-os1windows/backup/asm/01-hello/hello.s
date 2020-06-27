/*****************************************************************************
* hello.s
*
* This is a Win32 console program that writes "Hello, World" on one line and
* then exits.  It uses only plain Win32 system calls from kernel32.dll, so it
* is very instructive to study since it does not make use of a C library.
* Because system calls from kernel32.dll are used, you need to link with
* an import library.  You also have to specify the starting address yourself.
*
* Assembler: gas
* OS: Any Win32-based OS
* Other libraries: Use gcc s import library libkernel32.a
* Assemble with "gcc -c hello.s"
* Link with "ld -e go hello.o -lkernel32"
*****************************************************************************/

         .global go

         .data
msg:     .ascii  "Hello, World\n"
handle:  .int    0
written: .int    0

         .text
go:
         /* handle = GetStdHandle(-11) */
         pushl   $-11
         call    _GetStdHandle@4
         mov     %eax, handle

         /* WriteConsole(handle, &msg[0], 13, &written, 0) */
         pushl   $0
         pushl   $written
         pushl   $13
         pushl   $msg
         pushl   handle
         call    _WriteConsoleA@20

         /* ExitProcess(0) */
         pushl   $0
         call    _ExitProcess@4
