	.file	"hcode.c"
	.section .rdata,"dr"
LC0:
	.ascii "D=%d A=%d\12\0"
	.text
	.globl	_hcode
	.def	_hcode;	.scl	2;	.type	32;	.endef
_hcode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl  $10, %eax;
	movl  $20, %edx;
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movw	$3, _A
	movw	$5, _D
	nop
	leave
	ret
	.ident	"GCC: (tdm-1) 5.1.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
