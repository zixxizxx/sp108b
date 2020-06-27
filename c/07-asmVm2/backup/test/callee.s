	.file	"callee.c"
	.text
	.globl	_callee
	.def	_callee;	.scl	2;	.type	32;	.endef
_callee:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	popl	%ebp
	ret
	.ident	"GCC: (tdm-1) 5.1.0"
