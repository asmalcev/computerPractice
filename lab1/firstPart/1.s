	.file	"1.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"S = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -24(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$1, -16(%rbp)
	jmp	.L2
.L5:
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L3
.L4:
	movl	-20(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L4
	movl	-20(%rbp), %eax
	addl	%eax, -24(%rbp)
	addl	$1, -16(%rbp)
.L2:
	movl	-28(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jle	.L5
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
