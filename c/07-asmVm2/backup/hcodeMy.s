	.text
	.globl	_hcode
	.def	_hcode;	.scl	2;	.type	32;	.endef
_hcode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$48, %esp

L0:
	movl $0, %eax
	movl $0, %ebx
	movl $0, %ecx
	movl $0, %edx

L1:
  addl $1, %ebx
L2:
  cmpl $5, %ebx
  jge  EXIT
L3:
	movl $1, %eax
	jmp  ToLA
EXIT:
	popl	%ebp
	nop
	leave
	ret

ToLA:
# +printf
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl  4(%esp), %eax
	movl  8(%esp), %ebx
	movl  12(%esp), %ecx
	movl  16(%esp), %edx
# -printf
	movl %eax, %ecx
	sall $2, %ecx
	addl $JumpTable, %ecx
	movl (%ecx), %ecx
	jmp *%ecx

.section .rdata,"dr"
LC0:
	.ascii "eax=%d ebx=%d ecx=%d edx=%d\12\0"
	.align 4
JumpTable:
	.long L0
	.long L1
	.long L2
	.long L3
	.text
