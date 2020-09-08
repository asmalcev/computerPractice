	.file	"1.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d"
.LC2:
	.string	"S = %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC1(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	20(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	20(%rsp), %r9d
	testl	%r9d, %r9d
	jle	.L9
	movdqa	.LC0(%rip), %xmm5
	addl	$1, %r9d
	movl	$1, %ecx
	xorl	%edx, %edx
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addl	$1, %ecx
	addl	%eax, %edx
	cmpl	%r9d, %ecx
	je	.L2
.L7:
	leal	-2(%rcx), %eax
	leal	-1(%rcx), %edi
	cmpl	$8, %eax
	jbe	.L10
	movl	%ecx, 12(%rsp)
	movl	%edi, %esi
	xorl	%eax, %eax
	movd	12(%rsp), %xmm6
	movdqa	%xmm5, %xmm0
	shrl	$2, %esi
	pshufd	$0, %xmm6, %xmm3
	movdqa	%xmm3, %xmm4
	psrlq	$32, %xmm4
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm0, %xmm2
	addl	$1, %eax
	movdqa	%xmm0, %xmm1
	cmpl	%esi, %eax
	pmuludq	%xmm3, %xmm2
	pshufd	$8, %xmm2, %xmm0
	psrlq	$32, %xmm1
	pmuludq	%xmm4, %xmm1
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm1, %xmm0
	jb	.L5
	movdqa	%xmm0, %xmm2
	movl	%edi, %r8d
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	andl	$-4, %r8d
	psrldq	$8, %xmm2
	leal	1(%r8), %esi
	pmuludq	%xmm2, %xmm1
	psrlq	$32, %xmm2
	pshufd	$8, %xmm1, %xmm1
	pmuludq	%xmm2, %xmm0
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	psrldq	$4, %xmm1
	pmuludq	%xmm1, %xmm0
	movd	%xmm0, %eax
	imull	%ecx, %eax
	cmpl	%edi, %r8d
	je	.L3
.L4:
	leal	1(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	2(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	3(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	4(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	5(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	6(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	leal	7(%rsi), %edi
	imull	%ecx, %eax
	cmpl	%edi, %ecx
	jle	.L3
	addl	$8, %esi
	imull	%ecx, %eax
	cmpl	%esi, %ecx
	jle	.L3
	imull	%ecx, %eax
	addl	$1, %ecx
	addl	%eax, %edx
	cmpl	%r9d, %ecx
	jne	.L7
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	24(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L14
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	movl	%ecx, %eax
	movl	$1, %esi
	jmp	.L4
.L9:
	xorl	%edx, %edx
	jmp	.L2
.L14:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
