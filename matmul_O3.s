	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	init_matrix, @function
init_matrix:
.LFB39:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	imul	ebp, ebp
	mov	rbx, rdi
	mov	edi, edx
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	srand@PLT
	test	ebp, ebp
	je	.L8
	movsxd	rbp, ebp
	lea	rbp, [rbx+rbp*4]
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	vxorps	xmm1, xmm1, xmm1
	add	rbx, 4
	vcvtsi2ss	xmm0, xmm1, eax
	vmulss	xmm0, xmm0, DWORD PTR .LC0[rip]
	vmovss	DWORD PTR -4[rbx], xmm0
	cmp	rbx, rbp
	jne	.L3
.L8:
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	init_matrix, .-init_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"out of memory\n"
.LC3:
	.string	"N=%d checksum=%.3f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r15
	push	r14
	push	r13
	push	r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	mov	r12d, 1024
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	push	rbx
	add	rsp, -128
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmp	edi, 1
	jle	.L12
	mov	rdi, QWORD PTR 8[rsi]
	mov	edx, 10
	xor	esi, esi
	call	__isoc23_strtol@PLT
	mov	r12d, eax
.L12:
	movsxd	rbx, r12d
	mov	QWORD PTR -120[rbp], rbx
	imul	rbx, rbx
	lea	rdi, 0[0+rbx*4]
	call	malloc@PLT
	lea	rdi, 0[0+rbx*4]
	mov	r14, rax
	mov	QWORD PTR -104[rbp], rax
	call	malloc@PLT
	mov	rdi, rbx
	mov	esi, 4
	mov	r13, rax
	call	calloc@PLT
	test	r14, r14
	mov	QWORD PTR -152[rbp], rax
	mov	rbx, rax
	sete	al
	test	r13, r13
	sete	dl
	or	al, dl
	jne	.L48
	test	rbx, rbx
	je	.L48
	mov	rbx, QWORD PTR -104[rbp]
	mov	edx, 1
	mov	esi, r12d
	mov	rdi, rbx
	call	init_matrix
	mov	edx, 2
	mov	esi, r12d
	mov	rdi, r13
	call	init_matrix
	test	r12d, r12d
	jle	.L16
	mov	rax, QWORD PTR -120[rbp]
	mov	rcx, rbx
	mov	QWORD PTR -80[rbp], 0
	mov	rbx, QWORD PTR -152[rbp]
	mov	DWORD PTR -112[rbp], 0
	lea	r10, 0[0+rax*4]
	lea	eax, [r12+r12]
	mov	QWORD PTR -128[rbp], rcx
	cdqe
	mov	r15, rbx
	mov	QWORD PTR -96[rbp], rax
	lea	eax, -1[r12]
	mov	DWORD PTR -64[rbp], eax
	lea	eax, -3[r12]
	and	eax, -2
	add	eax, 2
	mov	DWORD PTR -88[rbp], eax
	mov	eax, r12d
	shr	eax, 3
	sal	rax, 5
	mov	r14, rax
	.p2align 4,,10
	.p2align 3
.L17:
	mov	eax, DWORD PTR -80[rbp]
	xor	ecx, ecx
	cmp	r12d, 2
	mov	DWORD PTR -84[rbp], eax
	jle	.L35
	mov	ecx, DWORD PTR -88[rbp]
	add	eax, 1
	mov	QWORD PTR -144[rbp], r10
	xor	esi, esi
	mov	DWORD PTR -108[rbp], eax
	mov	rdi, QWORD PTR -128[rbp]
	xor	r11d, r11d
	mov	DWORD PTR -132[rbp], ecx
	mov	QWORD PTR -56[rbp], r14
	.p2align 4,,10
	.p2align 3
.L23:
	cmp	DWORD PTR -64[rbp], 6
	vmovss	xmm3, DWORD PTR [rdi]
	mov	DWORD PTR -60[rbp], esi
	mov	ecx, esi
	jbe	.L45
	mov	r14, QWORD PTR -56[rbp]
.L20:
	add	ecx, r12d
	vbroadcastss	ymm1, DWORD PTR 4[rdi]
	vbroadcastss	ymm2, xmm3
	lea	r8, 0[r13+rsi*4]
	movsxd	rax, ecx
	lea	rdx, 0[r13+rax*4]
	xor	eax, eax
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L31:
	vmovups	ymm0, YMMWORD PTR [r8+rax]
	vfmadd213ps	ymm0, ymm2, YMMWORD PTR [r15+rax]
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	vmovups	YMMWORD PTR [r15+rax], ymm0
	add	rax, 32
	cmp	rax, r14
	jne	.L31
	mov	eax, r12d
	and	eax, -8
	cmp	r12d, eax
	mov	edx, eax
	je	.L74
	mov	QWORD PTR -56[rbp], r14
.L18:
	mov	r8d, r12d
	sub	r8d, edx
	lea	r9d, -1[r8]
	cmp	r9d, 2
	jbe	.L21
	mov	r9, QWORD PTR -80[rbp]
	mov	r14, QWORD PTR -104[rbp]
	vbroadcastss	xmm0, xmm3
	add	r9, rdx
	lea	r10, [rbx+r9*4]
	movsxd	r9, ecx
	mov	QWORD PTR -72[rbp], r10
	mov	r10d, DWORD PTR -108[rbp]
	add	r9, rdx
	add	rdx, rsi
	add	r10d, r11d
	test	r8b, 3
	movsxd	r10, r10d
	vbroadcastss	xmm1, DWORD PTR [r14+r10*4]
	mov	r10, QWORD PTR -72[rbp]
	vmovups	xmm5, XMMWORD PTR [r10]
	vfmadd132ps	xmm0, xmm5, XMMWORD PTR 0[r13+rdx*4]
	vfmadd231ps	xmm0, xmm1, XMMWORD PTR 0[r13+r9*4]
	vmovups	XMMWORD PTR [r10], xmm0
	je	.L22
	and	r8d, -4
	add	eax, r8d
.L21:
	mov	r14d, DWORD PTR -84[rbp]
	mov	r10d, DWORD PTR -60[rbp]
	vmovss	xmm1, DWORD PTR 4[rdi]
	lea	edx, [r14+rax]
	lea	r8d, [r10+rax]
	movsxd	rdx, edx
	movsxd	r8, r8d
	lea	r9, [rbx+rdx*4]
	lea	edx, [rcx+rax]
	vmovss	xmm0, DWORD PTR 0[r13+r8*4]
	movsxd	rdx, edx
	vfmadd213ss	xmm0, xmm3, DWORD PTR [r9]
	vfmadd231ss	xmm0, xmm1, DWORD PTR 0[r13+rdx*4]
	lea	edx, 1[rax]
	cmp	r12d, edx
	vmovss	DWORD PTR [r9], xmm0
	jle	.L22
	lea	r8d, [r14+rdx]
	add	eax, 2
	movsxd	r8, r8d
	lea	r9, [rbx+r8*4]
	lea	r8d, [rcx+rdx]
	add	edx, r10d
	cmp	r12d, eax
	movsxd	rdx, edx
	movsxd	r8, r8d
	vmovss	xmm0, DWORD PTR 0[r13+rdx*4]
	vfmadd213ss	xmm0, xmm3, DWORD PTR [r9]
	vfmadd231ss	xmm0, xmm1, DWORD PTR 0[r13+r8*4]
	vmovss	DWORD PTR [r9], xmm0
	jle	.L22
	lea	edx, [r14+rax]
	add	ecx, eax
	add	eax, r10d
	movsxd	rdx, edx
	cdqe
	movsxd	rcx, ecx
	vmovss	xmm6, DWORD PTR [rbx+rdx*4]
	vfmadd132ss	xmm3, xmm6, DWORD PTR 0[r13+rax*4]
	vfmadd132ss	xmm1, xmm3, DWORD PTR 0[r13+rcx*4]
	vmovss	DWORD PTR [rbx+rdx*4], xmm1
.L22:
	add	r11d, 2
	add	rdi, 8
	add	rsi, QWORD PTR -96[rbp]
	cmp	r11d, DWORD PTR -88[rbp]
	jne	.L23
	mov	ecx, DWORD PTR -132[rbp]
	mov	r10, QWORD PTR -144[rbp]
	mov	r14, QWORD PTR -56[rbp]
.L35:
	mov	esi, ecx
	mov	rax, QWORD PTR -80[rbp]
	movsxd	rdi, ecx
	mov	QWORD PTR -56[rbp], r15
	imul	esi, r12d
	mov	rcx, QWORD PTR -104[rbp]
	sal	rax, 2
	lea	r11, [rcx+rax]
	add	rax, rbx
	movsxd	rsi, esi
.L30:
	cmp	DWORD PTR -64[rbp], 6
	vmovss	xmm2, DWORD PTR [r11+rdi*4]
	mov	r9d, esi
	jbe	.L44
.L27:
	vbroadcastss	ymm1, xmm2
	lea	rcx, 0[r13+rsi*4]
	xor	edx, edx
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L25:
	vmovups	ymm0, YMMWORD PTR [rcx+rdx]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rax+rdx]
	vmovups	YMMWORD PTR [rax+rdx], ymm0
	add	rdx, 32
	cmp	r14, rdx
	jne	.L25
	mov	edx, r12d
	and	edx, -8
	cmp	r12d, edx
	mov	ecx, edx
	je	.L75
.L24:
	mov	r8d, r12d
	sub	r8d, ecx
	lea	r15d, -1[r8]
	cmp	r15d, 2
	jbe	.L28
	mov	r15, QWORD PTR -80[rbp]
	vbroadcastss	xmm0, xmm2
	add	r15, rcx
	add	rcx, rsi
	test	r8b, 3
	vmovups	xmm7, XMMWORD PTR [rbx+r15*4]
	vfmadd132ps	xmm0, xmm7, XMMWORD PTR 0[r13+rcx*4]
	vmovups	XMMWORD PTR [rbx+r15*4], xmm0
	je	.L29
	and	r8d, -4
	add	edx, r8d
.L28:
	mov	r15d, DWORD PTR -84[rbp]
	lea	ecx, [r15+rdx]
	movsxd	rcx, ecx
	lea	r8, [rbx+rcx*4]
	lea	ecx, [rdx+r9]
	movsxd	rcx, ecx
	vmovss	xmm0, DWORD PTR 0[r13+rcx*4]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [r8]
	lea	ecx, 1[rdx]
	cmp	r12d, ecx
	vmovss	DWORD PTR [r8], xmm0
	jle	.L29
	lea	r8d, [r15+rcx]
	add	ecx, r9d
	add	edx, 2
	movsxd	r8, r8d
	movsxd	rcx, ecx
	cmp	r12d, edx
	vmovss	xmm0, DWORD PTR 0[r13+rcx*4]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rbx+r8*4]
	vmovss	DWORD PTR [rbx+r8*4], xmm0
	jle	.L29
	lea	ecx, [r15+rdx]
	add	edx, r9d
	movsxd	rcx, ecx
	movsxd	rdx, edx
	vmovss	xmm4, DWORD PTR [rbx+rcx*4]
	vfmadd132ss	xmm2, xmm4, DWORD PTR 0[r13+rdx*4]
	vmovss	DWORD PTR [rbx+rcx*4], xmm2
.L29:
	add	rdi, 1
	add	rsi, QWORD PTR -120[rbp]
	cmp	r12d, edi
	jg	.L30
.L68:
	add	DWORD PTR -112[rbp], 1
	mov	r15, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR -112[rbp]
	add	QWORD PTR -128[rbp], r10
	mov	rsi, QWORD PTR -120[rbp]
	add	r15, r10
	add	QWORD PTR -80[rbp], rsi
	cmp	r12d, eax
	jne	.L17
	mov	ecx, r12d
	imul	ecx, r12d
.L36:
	lea	eax, -1[rcx]
	cmp	eax, 6
	jbe	.L47
	mov	edx, ecx
	mov	rbx, QWORD PTR -152[rbp]
	vxorpd	xmm3, xmm3, xmm3
	shr	edx, 3
	sal	rdx, 5
	mov	rax, rbx
	add	rdx, rbx
	.p2align 4,,10
	.p2align 3
.L39:
	vmovups	ymm0, YMMWORD PTR [rax]
	add	rax, 32
	cmp	rdx, rax
	vcvtps2pd	ymm2, xmm0
	vaddsd	xmm3, xmm2, xmm3
	vextractf128	xmm0, ymm0, 0x1
	vcvtps2pd	ymm1, xmm0
	vunpckhpd	xmm0, xmm2, xmm2
	vextractf128	xmm2, ymm2, 0x1
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm2, xmm2, xmm2
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm2, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm0, xmm0, xmm2
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm3, xmm0, xmm1
	jne	.L39
	mov	eax, ecx
	and	eax, -8
	cmp	eax, ecx
	mov	esi, eax
	je	.L71
.L38:
	mov	edx, ecx
	sub	edx, esi
	lea	edi, -1[rdx]
	cmp	edi, 2
	jbe	.L41
	mov	rbx, QWORD PTR -152[rbp]
	vxorps	xmm0, xmm0, xmm0
	test	dl, 3
	vmovups	xmm1, XMMWORD PTR [rbx+rsi*4]
	vcvtps2pd	xmm2, xmm1
	vmovhlps	xmm0, xmm0, xmm1
	vaddsd	xmm1, xmm3, xmm2
	vunpckhpd	xmm2, xmm2, xmm2
	vcvtps2pd	xmm0, xmm0
	vaddsd	xmm1, xmm1, xmm2
	vaddsd	xmm1, xmm1, xmm0
	vunpckhpd	xmm0, xmm0, xmm0
	vaddsd	xmm3, xmm1, xmm0
	je	.L71
	and	edx, -4
	add	eax, edx
.L41:
	mov	rbx, QWORD PTR -152[rbp]
	lea	esi, 1[rax]
	vxorps	xmm0, xmm0, xmm0
	movsxd	rdx, eax
	cmp	esi, ecx
	vcvtss2sd	xmm1, xmm0, DWORD PTR [rbx+rdx*4]
	vaddsd	xmm3, xmm3, xmm1
	jge	.L71
	add	eax, 2
	vcvtss2sd	xmm1, xmm0, DWORD PTR 4[rbx+rdx*4]
	vaddsd	xmm3, xmm3, xmm1
	cmp	eax, ecx
	jge	.L71
	vcvtss2sd	xmm0, xmm0, DWORD PTR 8[rbx+rdx*4]
	vaddsd	xmm3, xmm3, xmm0
	vzeroupper
	jmp	.L37
.L71:
	vzeroupper
.L37:
	vmovapd	xmm0, xmm3
	mov	edx, r12d
	mov	edi, 2
	mov	eax, 1
	lea	rsi, .LC3[rip]
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR -104[rbp]
	call	free@PLT
	mov	rdi, r13
	call	free@PLT
	mov	rdi, QWORD PTR -152[rbp]
	call	free@PLT
	xor	eax, eax
.L11:
	sub	rsp, -128
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	.cfi_restore_state
	add	r11d, 2
	cmp	r11d, DWORD PTR -88[rbp]
	je	.L66
	add	rsi, QWORD PTR -96[rbp]
	add	rdi, 8
	vmovss	xmm3, DWORD PTR [rdi]
	mov	DWORD PTR -60[rbp], esi
	mov	ecx, esi
	jmp	.L20
.L45:
	xor	edx, edx
	xor	eax, eax
	lea	ecx, [r12+rsi]
	jmp	.L18
.L75:
	add	rdi, 1
	cmp	r12d, edi
	jle	.L68
	add	rsi, QWORD PTR -120[rbp]
	vmovss	xmm2, DWORD PTR [r11+rdi*4]
	mov	r9d, esi
	jmp	.L27
.L44:
	xor	ecx, ecx
	xor	edx, edx
	jmp	.L24
.L66:
	mov	ecx, DWORD PTR -132[rbp]
	mov	r10, QWORD PTR -144[rbp]
	jmp	.L35
.L16:
	mov	ecx, r12d
	vxorpd	xmm3, xmm3, xmm3
	imul	ecx, r12d
	test	ecx, ecx
	je	.L37
	jmp	.L36
.L47:
	xor	esi, esi
	vxorpd	xmm3, xmm3, xmm3
	xor	eax, eax
	jmp	.L38
.L48:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 14
	mov	esi, 1
	lea	rdi, .LC2[rip]
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L11
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	805306368
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
