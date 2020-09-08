	.file	"1.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"S = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %edi
	testl	%edi, %edi
	jle	.L6
	movl	$1, %ecx
	xorl	%edx, %edx
	addl	$1, %edi
	movl	$1, %esi
	addl	$1, %ecx
	addl	%esi, %edx
	cmpl	%ecx, %edi
	je	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ecx, %esi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %eax
	imull	%ecx, %esi
	cmpl	%eax, %ecx
	jne	.L4
	addl	$1, %ecx
	addl	%esi, %edx
	cmpl	%ecx, %edi
	jne	.L7
.L2:
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	8(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L11
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L2
.L11:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
