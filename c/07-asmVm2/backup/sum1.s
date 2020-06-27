	.text
	.globl	_hcode
	.def	_hcode;	.scl	2;	.type	32;	.endef
_hcode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$48, %esp
L0: # @10
	movl $10, %eax
L1: # D=A
	movl %eax, %ebx
	movl %ebx, %edx
L2: # @0
	movl $0, %eax
L3: # M=D
	movl %edx, %ebx
	movl %ebx, _m(%eax,%eax)
L4: # @16
	movl $16, %eax
L5: # M=1
	movl $1, %ebx
	movl %ebx, _m(%eax,%eax)
L6: # @17
	movl $17, %eax
L7: # M=0
	movl $0, %ebx
	movl %ebx, _m(%eax,%eax)
L8: # @16
	movl $16, %eax
L9: # D=M
	movl _m(%eax,%eax), %ebx
	movl %ebx, %edx
L10: # @0
	movl $0, %eax
L11: # D=D-M
	movl %edx, %ebx
	movl _m(%eax,%eax), %ecx
	subl %ecx, %ebx
	movl %ebx, %edx
L12: # @22
	movl $22, %eax
L13: # D;JGT
	movl %edx, %ebx
	cmpl $0, %ebx
	movl %eax, %ecx
	sall $2, %ecx
	addl $JumpTable, %ecx
	movl (%ecx), %ecx
	jg SKIP0
	jmp *%ecx
SKIP0:
L14: # @16
	movl $16, %eax
L15: # D=M
	movl _m(%eax,%eax), %ebx
	movl %ebx, %edx
L16: # @17
	movl $17, %eax
L17: # M=D+M
	movl _m(%eax,%eax), %ebx
	addl %edx, %ebx
	movl %ebx, _m(%eax,%eax)

# +ccc
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
# -ccc

L18: # @16
	movl $16, %eax
L19: # M=M+1
	movl _m(%eax,%eax), %ebx
	addl $1, %ebx
	movl %ebx, _m(%eax,%eax)
L20: # @8
	movl $8, %eax
L21: # 0;JMP
	movl $0, %ebx
	jmp  ToLA

ToLA:
# +ccc
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
# -ccc
	movl %eax, %ecx
	sall $2, %ecx
	addl $JumpTable, %ecx
	movl (%ecx), %ecx
	jmp *%ecx
L22: # @17
	movl $17, %eax
L23: # D=M
	movl _m(%eax,%eax), %ebx
	movl %ebx, %edx
L24: # @1
	movl $1, %eax
L25: # M=D
	movl %edx, %ebx
	movl %ebx, _m(%eax,%eax)
	movw	%ax, _A
	movw	%dx, _D

# +ccc
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
# -ccc

	popl	%ebp
	nop
	leave
	ret
.section .rdata,"dr"
LC0:
	.ascii "eax=%d ebx=%d ecx=%d edx=%d\12\0"
	.align 4
JumpTable:
	.long L0
	.long L1
	.long L2
	.long L3
	.long L4
	.long L5
	.long L6
	.long L7
	.long L8
	.long L9
	.long L10
	.long L11
	.long L12
	.long L13
	.long L14
	.long L15
	.long L16
	.long L17
	.long L18
	.long L19
	.long L20
	.long L21
	.long L22
	.long L23
	.long L24
	.long L25
	.text
