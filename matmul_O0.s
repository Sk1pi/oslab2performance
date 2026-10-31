	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.type	init_matrix, @function
init_matrix:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -32[rbp], edx
	mov	eax, DWORD PTR -32[rbp]
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L3:
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movss	xmm1, DWORD PTR .LC0[rip]
	divss	xmm0, xmm1
	movss	DWORD PTR [rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -28[rbp]
	imul	eax, eax
	cmp	DWORD PTR -4[rbp], eax
	jl	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init_matrix, .-init_matrix
	.type	multiply, @function
multiply:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -44[rbp], ecx
	mov	DWORD PTR -16[rbp], 0
	jmp	.L5
.L10:
	mov	DWORD PTR -12[rbp], 0
	jmp	.L6
.L9:
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, DWORD PTR -44[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	movss	DWORD PTR -4[rbp], xmm0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, DWORD PTR -44[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movss	xmm1, DWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	imul	eax, DWORD PTR -44[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	mulss	xmm0, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, DWORD PTR -44[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR [rax], xmm0
	add	DWORD PTR -8[rbp], 1
.L7:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L8
	add	DWORD PTR -12[rbp], 1
.L6:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L9
	add	DWORD PTR -16[rbp], 1
.L5:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L10
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	multiply, .-multiply
	.type	checksum, @function
checksum:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	cvtss2sd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L12:
	mov	eax, DWORD PTR -28[rbp]
	imul	eax, eax
	cmp	DWORD PTR -12[rbp], eax
	jl	.L13
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	checksum, .-checksum
	.section	.rodata
.LC2:
	.string	"out of memory\n"
.LC3:
	.string	"N=%d checksum=%.3f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	cmp	DWORD PTR -36[rbp], 1
	jle	.L16
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -28[rbp], eax
	jmp	.L17
.L16:
	mov	DWORD PTR -28[rbp], 1024
.L17:
	mov	eax, DWORD PTR -28[rbp]
	movsxd	rdx, eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	imul	rax, rdx
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	eax, DWORD PTR -28[rbp]
	movsxd	rdx, eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	imul	rax, rdx
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -28[rbp]
	movsxd	rdx, eax
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	imul	rax, rdx
	mov	esi, 4
	mov	rdi, rax
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L18
	cmp	QWORD PTR -16[rbp], 0
	je	.L18
	cmp	QWORD PTR -8[rbp], 0
	jne	.L19
.L18:
	mov	rax, QWORD PTR stderr[rip]
	lea	rdi, .LC2[rip]
	mov	rcx, rax
	mov	edx, 14
	mov	esi, 1
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L20
.L19:
	mov	ecx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 1
	mov	esi, ecx
	mov	rdi, rax
	call	init_matrix
	mov	ecx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 2
	mov	esi, ecx
	mov	rdi, rax
	call	init_matrix
	mov	ecx, DWORD PTR -28[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	multiply
	mov	edx, DWORD PTR -28[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	checksum
	movq	rax, xmm0
	mov	edx, DWORD PTR -28[rbp]
	lea	rcx, .LC3[rip]
	movq	xmm0, rax
	mov	esi, edx
	mov	rdi, rcx
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1325400064
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
