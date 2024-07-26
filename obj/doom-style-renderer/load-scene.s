	.file	"load-scene.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer" "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/load-scene.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/load-scene.c"
	.align 8
.LC1:
	.string	"(((*view).view >= (*chunk_src).view) || (*view).view == NULL) && \"View out of bounds\""
	.align 8
.LC2:
	.string	"(*view).view < (*chunk_src).view + (*chunk_src).length && \"View out of bounds\""
	.text
	.p2align 4
	.type	next_chunk.isra.0, @function
next_chunk.isra.0:
.LVL0:
.LFB1304:
	.file 1 "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/load-scene.c"
	.loc 1 43 13 view -0
	.cfi_startproc
	.loc 1 43 13 is_stmt 0 view .LVU1
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r15, rdx
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	mov	r14, rdi
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	.loc 1 46 3 view .LVU2
	mov	rax, QWORD PTR [rdi]
	.loc 1 43 13 view .LVU3
	mov	rbp, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rbp
	mov	rbp, rcx
.LVL1:
	.loc 1 46 3 is_stmt 1 view .LVU4
	.loc 1 46 3 view .LVU5
	cmp	rax, rsi
	jnb	.L2
	.loc 1 46 3 is_stmt 0 discriminator 2 view .LVU6
	test	rax, rax
	jne	.L28
.LVL2:
.L3:
.LBB14:
.LBB15:
.LBB16:
.LBB17:
	.loc 1 34 26 is_stmt 1 discriminator 1 view .LVU7
	test	r15, r15
	je	.L6
	.loc 1 34 17 is_stmt 0 view .LVU8
	xor	ebx, ebx
	lea	r13, 22[rsp]
	jmp	.L8
.LVL3:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 34 34 is_stmt 1 discriminator 2 view .LVU9
	add	rbx, 1
.LVL4:
	.loc 1 34 26 discriminator 1 view .LVU10
	cmp	r15, rbx
	je	.L6
.LVL5:
.L8:
	.loc 1 35 5 view .LVU11
.LBB18:
	.loc 1 35 41 is_stmt 0 view .LVU12
	movzx	eax, BYTE PTR [r12+rbx]
	.loc 1 35 9 view .LVU13
	mov	rsi, r13
	mov	rdi, rbp
	.loc 1 35 41 view .LVU14
	mov	BYTE PTR 23[rsp], 0
	mov	BYTE PTR 22[rsp], al
	.loc 1 35 9 view .LVU15
	call	strstr@PLT
.LVL6:
	.loc 1 35 8 discriminator 1 view .LVU16
	test	rax, rax
	je	.L7
	.loc 1 36 7 is_stmt 1 view .LVU17
	.loc 1 36 39 is_stmt 0 view .LVU18
	mov	r15, rbx
.LVL7:
.L6:
	.loc 1 36 39 view .LVU19
.LBE18:
.LBE17:
.LBE16:
.LBE15:
	.loc 1 49 11 view .LVU20
	mov	QWORD PTR [r14], r12
	mov	QWORD PTR 8[r14], r15
	.loc 1 55 5 is_stmt 1 view .LVU21
	jmp	.L1
.LVL8:
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 1 55 5 is_stmt 0 view .LVU22
.LBE14:
	.loc 1 46 3 is_stmt 1 discriminator 1 view .LVU23
	lea	rcx, [rsi+rdx]
.LVL9:
	.loc 1 46 3 is_stmt 0 discriminator 1 view .LVU24
	cmp	rax, rcx
	jnb	.L29
	.loc 1 46 3 is_stmt 1 view .LVU25
	.loc 1 48 3 view .LVU26
	.loc 1 48 6 is_stmt 0 view .LVU27
	test	rax, rax
	je	.L3
	.loc 1 58 3 is_stmt 1 view .LVU28
.LVL10:
	.loc 1 60 3 view .LVU29
	.loc 1 60 14 is_stmt 0 view .LVU30
	mov	rdx, QWORD PTR 8[rdi]
	lea	r15, 1[rax+rdx]
	mov	QWORD PTR [rdi], r15
	.loc 1 61 3 is_stmt 1 view .LVU31
	.loc 1 61 6 is_stmt 0 view .LVU32
	cmp	r15, rcx
	jnb	.L30
	.loc 1 66 3 is_stmt 1 view .LVU33
	.loc 1 66 18 is_stmt 0 view .LVU34
	mov	rdi, r15
.LVL11:
	.loc 1 66 18 view .LVU35
	call	strlen@PLT
.LVL12:
	.loc 1 66 18 view .LVU36
	mov	QWORD PTR 8[rsp], rax
.LVL13:
.LBB19:
.LBI19:
	.loc 1 32 17 is_stmt 1 view .LVU37
.LBB20:
	.loc 1 34 3 view .LVU38
.LBB21:
	.loc 1 34 8 view .LVU39
	.loc 1 34 26 discriminator 1 view .LVU40
.LBE21:
.LBE20:
.LBE19:
	.loc 1 66 18 is_stmt 0 view .LVU41
	mov	r12, rax
.LBB25:
.LBB24:
.LBB23:
	.loc 1 34 26 discriminator 1 view .LVU42
	test	rax, rax
	je	.L11
	.loc 1 34 17 view .LVU43
	xor	ebx, ebx
	lea	r13, 22[rsp]
	jmp	.L13
.LVL14:
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 34 34 is_stmt 1 discriminator 2 view .LVU44
	add	rbx, 1
.LVL15:
	.loc 1 34 26 discriminator 1 view .LVU45
	cmp	r12, rbx
	je	.L11
.LVL16:
.L13:
	.loc 1 35 5 view .LVU46
.LBB22:
	.loc 1 35 41 is_stmt 0 view .LVU47
	movzx	eax, BYTE PTR [r15+rbx]
	.loc 1 35 9 view .LVU48
	mov	rsi, r13
	mov	rdi, rbp
	.loc 1 35 41 view .LVU49
	mov	BYTE PTR 23[rsp], 0
	mov	BYTE PTR 22[rsp], al
	.loc 1 35 9 view .LVU50
	call	strstr@PLT
.LVL17:
	.loc 1 35 8 discriminator 1 view .LVU51
	test	rax, rax
	je	.L12
	.loc 1 36 7 is_stmt 1 view .LVU52
	.loc 1 36 39 is_stmt 0 view .LVU53
	mov	QWORD PTR 8[rsp], rbx
.LVL18:
.L11:
	.loc 1 36 39 view .LVU54
.LBE22:
.LBE23:
.LBE24:
.LBE25:
	.loc 1 66 16 discriminator 2 view .LVU55
	mov	rax, QWORD PTR 8[rsp]
	mov	QWORD PTR 8[r14], rax
.LVL19:
.L1:
	.loc 1 67 1 view .LVU56
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L31
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
.LVL20:
	.loc 1 67 1 view .LVU57
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
.LVL21:
	.loc 1 67 1 view .LVU58
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.LVL22:
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
.LBB26:
	.loc 1 62 5 is_stmt 1 view .LVU59
	.loc 1 62 11 is_stmt 0 view .LVU60
	pxor	xmm0, xmm0
	movups	XMMWORD PTR [rdi], xmm0
	.loc 1 63 5 is_stmt 1 view .LVU61
	jmp	.L1
.LVL23:
.L29:
	.loc 1 63 5 is_stmt 0 view .LVU62
.LBE26:
	.loc 1 46 3 is_stmt 1 discriminator 4 view .LVU63
	lea	rcx, __PRETTY_FUNCTION__.0[rip]
	mov	edx, 46
	lea	rsi, .LC0[rip]
	lea	rdi, .LC2[rip]
.LVL24:
	.loc 1 46 3 is_stmt 0 discriminator 4 view .LVU64
	call	__assert_fail@PLT
.LVL25:
.L31:
	.loc 1 67 1 view .LVU65
	call	__stack_chk_fail@PLT
.LVL26:
.L28:
	.loc 1 46 3 is_stmt 1 discriminator 3 view .LVU66
	lea	rcx, __PRETTY_FUNCTION__.0[rip]
.LVL27:
	.loc 1 46 3 is_stmt 0 discriminator 3 view .LVU67
	mov	edx, 46
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
.LVL28:
	.loc 1 46 3 discriminator 3 view .LVU68
	call	__assert_fail@PLT
.LVL29:
	.cfi_endproc
.LFE1304:
	.size	next_chunk.isra.0, .-next_chunk.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"rb"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[ERROR]: Failed to open file %s: "
	.text
	.p2align 4
	.globl	fio_read_file
	.type	fio_read_file, @function
fio_read_file:
.LVL30:
.LFB1298:
	.file 2 "/home/randompigyt/Hogxel-Engine/src/util/fileIO.h"
	.loc 2 18 39 is_stmt 1 view -0
	.cfi_startproc
	.loc 2 18 39 is_stmt 0 view .LVU70
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 2 19 13 view .LVU71
	lea	rsi, .LC3[rip]
	.loc 2 18 39 view .LVU72
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 160
	.cfi_def_cfa_offset 192
	.loc 2 18 39 view .LVU73
	mov	rbp, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rbp
	mov	rbp, rdi
	.loc 2 19 3 is_stmt 1 view .LVU74
	.loc 2 19 13 is_stmt 0 view .LVU75
	call	fopen@PLT
.LVL31:
	.loc 2 20 3 is_stmt 1 view .LVU76
	.loc 2 20 6 is_stmt 0 view .LVU77
	test	rax, rax
	je	.L37
	.loc 2 28 3 view .LVU78
	mov	rdi, rax
	mov	rbx, rax
	.loc 2 27 3 is_stmt 1 view .LVU79
	.loc 2 28 3 view .LVU80
	call	fileno@PLT
.LVL32:
	.loc 2 28 3 is_stmt 0 discriminator 1 view .LVU81
	mov	rsi, rsp
	.loc 2 28 3 view .LVU82
	mov	edi, eax
	.loc 2 28 3 discriminator 1 view .LVU83
	call	fstat@PLT
.LVL33:
	.loc 2 30 3 is_stmt 1 view .LVU84
	.loc 2 30 12 is_stmt 0 view .LVU85
	mov	r12, QWORD PTR 48[rsp]
.LVL34:
	.loc 2 31 3 is_stmt 1 view .LVU86
	.loc 2 31 15 is_stmt 0 view .LVU87
	lea	rdi, 1[r12]
	call	malloc@PLT
.LVL35:
	.loc 2 33 3 view .LVU88
	mov	rcx, rbx
	mov	rdx, r12
	mov	esi, 1
	.loc 2 31 15 view .LVU89
	mov	rbp, rax
.LVL36:
	.loc 2 33 3 is_stmt 1 view .LVU90
	mov	rdi, rax
	call	fread@PLT
.LVL37:
	.loc 2 34 3 view .LVU91
	.loc 2 34 13 is_stmt 0 view .LVU92
	mov	BYTE PTR 0[rbp+r12], 0
	.loc 2 36 3 is_stmt 1 view .LVU93
	mov	rdi, rbx
	call	fclose@PLT
.LVL38:
	.loc 2 38 3 view .LVU94
.L32:
	.loc 2 39 1 is_stmt 0 view .LVU95
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L38
	add	rsp, 160
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	mov	rax, rbp
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.LVL39:
.L37:
	.cfi_restore_state
	.loc 2 21 5 is_stmt 1 view .LVU96
	mov	rax, QWORD PTR stderr@GOTPCREL[rip]
.LVL40:
	.loc 2 21 5 is_stmt 0 view .LVU97
	mov	rdx, rbp
	.loc 2 24 12 view .LVU98
	xor	ebp, ebp
.LVL41:
	.loc 2 21 5 view .LVU99
	lea	rsi, .LC4[rip]
	mov	rdi, QWORD PTR [rax]
	xor	eax, eax
	call	fprintf@PLT
.LVL42:
	.loc 2 22 5 is_stmt 1 view .LVU100
	xor	edi, edi
	call	perror@PLT
.LVL43:
	.loc 2 24 5 view .LVU101
	.loc 2 24 12 is_stmt 0 view .LVU102
	jmp	.L32
.L38:
	.loc 2 39 1 view .LVU103
	call	__stack_chk_fail@PLT
.LVL44:
	.cfi_endproc
.LFE1298:
	.size	fio_read_file, .-fio_read_file
	.section	.rodata.str1.1
.LC5:
	.string	"\n"
.LC6:
	.string	"Tokens {"
.LC7:
	.string	" \n\t"
.LC8:
	.string	"  %.*s,\n"
.LC9:
	.string	"}"
	.text
	.p2align 4
	.globl	dsr_load_scene
	.type	dsr_load_scene, @function
dsr_load_scene:
.LVL45:
.LFB1303:
	.loc 1 104 70 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 104 70 is_stmt 0 view .LVU105
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 72
	.cfi_def_cfa_offset 128
	.loc 1 104 70 view .LVU106
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 56[rsp], rax
	xor	eax, eax
	.loc 1 105 3 is_stmt 1 view .LVU107
	.loc 1 107 3 view .LVU108
	.loc 1 107 21 is_stmt 0 view .LVU109
	call	fio_read_file@PLT
.LVL46:
	.loc 1 108 3 is_stmt 1 view .LVU110
	.loc 1 108 6 is_stmt 0 view .LVU111
	test	rax, rax
	je	.L46
	mov	r14, rax
	lea	rax, 16[rsp]
.LVL47:
	.loc 1 112 21 view .LVU112
	xor	ebp, ebp
	xor	ebx, ebx
	mov	QWORD PTR 8[rsp], rax
	lea	r13, .LC7[rip]
	jmp	.L44
.LVL48:
	.p2align 4,,10
	.p2align 3
.L41:
	.loc 1 122 12 is_stmt 1 view .LVU113
	test	rbx, rbx
	je	.L56
.LVL49:
.L44:
	.loc 1 113 3 view .LVU114
.LBB30:
	.loc 1 114 5 view .LVU115
	.loc 1 114 56 is_stmt 0 view .LVU116
	mov	rdi, r14
	call	strlen@PLT
.LVL50:
	.loc 1 114 5 discriminator 1 view .LVU117
	mov	rdi, QWORD PTR 8[rsp]
	mov	rsi, r14
	lea	rcx, .LC5[rip]
	.loc 1 114 56 view .LVU118
	mov	rdx, rax
	.loc 1 114 5 discriminator 1 view .LVU119
	mov	QWORD PTR 16[rsp], rbx
	mov	QWORD PTR 24[rsp], rbp
	call	next_chunk.isra.0
.LVL51:
	mov	rbp, QWORD PTR 24[rsp]
.LVL52:
	.loc 1 114 5 discriminator 1 view .LVU120
	mov	rbx, QWORD PTR 16[rsp]
.LVL53:
	.loc 1 118 5 is_stmt 1 view .LVU121
	.loc 1 118 8 is_stmt 0 view .LVU122
	test	rbp, rbp
	je	.L41
	.loc 1 119 7 is_stmt 1 view .LVU123
.LVL54:
.LBB31:
.LBI31:
	.loc 1 89 13 view .LVU124
.LBB32:
	.loc 1 90 3 view .LVU125
	.loc 1 92 3 view .LVU126
	lea	rdi, .LC6[rip]
	.loc 1 90 21 is_stmt 0 view .LVU127
	xor	r15d, r15d
	lea	r12, 32[rsp]
	.loc 1 92 3 view .LVU128
	call	puts@PLT
.LVL55:
	.loc 1 90 21 view .LVU129
	xor	ecx, ecx
	jmp	.L43
.LVL56:
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 98 12 is_stmt 1 view .LVU130
	test	r15, r15
	je	.L57
.LVL57:
.L43:
	.loc 1 93 3 view .LVU131
	.loc 1 94 5 view .LVU132
	mov	QWORD PTR 40[rsp], rcx
	mov	rdx, rbp
	mov	rcx, r13
.LVL58:
	.loc 1 94 5 is_stmt 0 view .LVU133
	mov	rsi, rbx
	mov	rdi, r12
	mov	QWORD PTR 32[rsp], r15
	call	next_chunk.isra.0
.LVL59:
	.loc 1 94 5 view .LVU134
	mov	rcx, QWORD PTR 40[rsp]
	mov	r15, QWORD PTR 32[rsp]
.LVL60:
	.loc 1 95 5 is_stmt 1 view .LVU135
	.loc 1 95 8 is_stmt 0 view .LVU136
	test	rcx, rcx
	je	.L42
	.loc 1 96 7 is_stmt 1 view .LVU137
	mov	esi, ecx
	mov	rdx, r15
	lea	rdi, .LC8[rip]
	xor	eax, eax
	mov	QWORD PTR [rsp], rcx
	call	printf@PLT
.LVL61:
	.loc 1 96 7 is_stmt 0 view .LVU138
	mov	rcx, QWORD PTR [rsp]
	.loc 1 98 12 is_stmt 1 view .LVU139
	test	r15, r15
	jne	.L43
.LVL62:
.L57:
	.loc 1 99 3 view .LVU140
	lea	rdi, .LC9[rip]
	call	puts@PLT
.LVL63:
	.loc 1 101 3 view .LVU141
	.loc 1 101 3 is_stmt 0 view .LVU142
.LBE32:
.LBE31:
.LBE30:
	.loc 1 122 12 is_stmt 1 view .LVU143
	test	rbx, rbx
	jne	.L44
.L56:
	.loc 1 124 3 view .LVU144
	mov	rdi, r14
	call	free@PLT
.LVL64:
	.loc 1 125 3 view .LVU145
	.loc 1 125 10 is_stmt 0 view .LVU146
	mov	eax, 1
.LVL65:
.L39:
	.loc 1 126 1 view .LVU147
	mov	rdx, QWORD PTR 56[rsp]
	sub	rdx, QWORD PTR fs:40
	jne	.L58
	add	rsp, 72
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.LVL66:
.L46:
	.cfi_restore_state
	.loc 1 109 12 view .LVU148
	xor	eax, eax
.LVL67:
	.loc 1 109 12 view .LVU149
	jmp	.L39
.L58:
	.loc 1 126 1 view .LVU150
	call	__stack_chk_fail@PLT
.LVL68:
	.cfi_endproc
.LFE1303:
	.size	dsr_load_scene, .-dsr_load_scene
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"next_chunk"
	.text
.Letext0:
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/bits/stdint-uintn.h"
	.file 5 "/usr/lib/gcc/x86_64-pc-linux-gnu/14.1.1/include/stddef.h"
	.file 6 "/usr/include/bits/types/struct_timespec.h"
	.file 7 "/usr/include/bits/types/struct_FILE.h"
	.file 8 "/usr/include/bits/types/FILE.h"
	.file 9 "/home/randompigyt/Hogxel-Engine/include/doom-style-renderer.h"
	.file 10 "/usr/include/bits/struct_stat.h"
	.file 11 "/usr/include/stdio.h"
	.file 12 "/usr/include/string.h"
	.file 13 "/usr/include/assert.h"
	.file 14 "/usr/include/stdlib.h"
	.file 15 "/usr/include/sys/stat.h"
	.file 16 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xca6
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x20
	.long	.LASF128
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x21
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF9
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x91
	.byte	0x19
	.long	0x43
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x3c
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x93
	.byte	0x19
	.long	0x3c
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x94
	.byte	0x19
	.long	0x43
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x3c
	.uleb128 0x5
	.long	.LASF15
	.byte	0x3
	.byte	0x97
	.byte	0x1b
	.long	0x43
	.uleb128 0x5
	.long	.LASF16
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x5f
	.uleb128 0x5
	.long	.LASF17
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x5f
	.uleb128 0x5
	.long	.LASF18
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x5f
	.uleb128 0x22
	.byte	0x8
	.uleb128 0x10
	.long	0xde
	.uleb128 0x5
	.long	.LASF19
	.byte	0x3
	.byte	0xaf
	.byte	0x1d
	.long	0x5f
	.uleb128 0x5
	.long	.LASF20
	.byte	0x3
	.byte	0xb4
	.byte	0x1c
	.long	0x5f
	.uleb128 0x5
	.long	.LASF21
	.byte	0x3
	.byte	0xc5
	.byte	0x21
	.long	0x5f
	.uleb128 0x7
	.long	0x10e
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF22
	.uleb128 0x11
	.long	0x10e
	.uleb128 0x5
	.long	.LASF23
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x66
	.uleb128 0x5
	.long	.LASF24
	.byte	0x5
	.byte	0xd6
	.byte	0x17
	.long	0x43
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF25
	.uleb128 0x6
	.byte	0x10
	.byte	0x4
	.long	.LASF26
	.uleb128 0xa
	.long	.LASF32
	.byte	0x10
	.byte	0x6
	.byte	0xb
	.long	0x167
	.uleb128 0x1
	.long	.LASF27
	.byte	0x6
	.byte	0x10
	.byte	0xc
	.long	0xd2
	.byte	0
	.uleb128 0x1
	.long	.LASF28
	.byte	0x6
	.byte	0x15
	.byte	0x15
	.long	0xfd
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF29
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.long	.LASF30
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.long	.LASF31
	.uleb128 0xc
	.long	0x16e
	.long	0x192
	.uleb128 0xb
	.long	0x43
	.byte	0x1
	.uleb128 0xb
	.long	0x43
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.long	.LASF33
	.byte	0xd8
	.byte	0x7
	.byte	0x31
	.long	0x318
	.uleb128 0x1
	.long	.LASF34
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.long	0x58
	.byte	0
	.uleb128 0x1
	.long	.LASF35
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.long	0x109
	.byte	0x8
	.uleb128 0x1
	.long	.LASF36
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.long	0x109
	.byte	0x10
	.uleb128 0x1
	.long	.LASF37
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.long	0x109
	.byte	0x18
	.uleb128 0x1
	.long	.LASF38
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.long	0x109
	.byte	0x20
	.uleb128 0x1
	.long	.LASF39
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.long	0x109
	.byte	0x28
	.uleb128 0x1
	.long	.LASF40
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.long	0x109
	.byte	0x30
	.uleb128 0x1
	.long	.LASF41
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0x109
	.byte	0x38
	.uleb128 0x1
	.long	.LASF42
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0x109
	.byte	0x40
	.uleb128 0x1
	.long	.LASF43
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0x109
	.byte	0x48
	.uleb128 0x1
	.long	.LASF44
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0x109
	.byte	0x50
	.uleb128 0x1
	.long	.LASF45
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.long	0x109
	.byte	0x58
	.uleb128 0x1
	.long	.LASF46
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.long	0x331
	.byte	0x60
	.uleb128 0x1
	.long	.LASF47
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.long	0x336
	.byte	0x68
	.uleb128 0x1
	.long	.LASF48
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.long	0x58
	.byte	0x70
	.uleb128 0x1
	.long	.LASF49
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.long	0x58
	.byte	0x74
	.uleb128 0x1
	.long	.LASF50
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.long	0xba
	.byte	0x78
	.uleb128 0x1
	.long	.LASF51
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.long	0x35
	.byte	0x80
	.uleb128 0x1
	.long	.LASF52
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.long	0x4a
	.byte	0x82
	.uleb128 0x1
	.long	.LASF53
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.long	0x33b
	.byte	0x83
	.uleb128 0x1
	.long	.LASF54
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.long	0x34b
	.byte	0x88
	.uleb128 0x1
	.long	.LASF55
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.long	0xc6
	.byte	0x90
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.long	0x355
	.byte	0x98
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.long	0x35f
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF58
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.long	0x336
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.long	0xde
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.long	0x126
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF61
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.long	0x58
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.long	0x364
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.long	.LASF63
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.long	0x192
	.uleb128 0x23
	.long	.LASF129
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0x12
	.long	.LASF64
	.uleb128 0x7
	.long	0x32c
	.uleb128 0x7
	.long	0x192
	.uleb128 0xc
	.long	0x10e
	.long	0x34b
	.uleb128 0xb
	.long	0x43
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x324
	.uleb128 0x12
	.long	.LASF65
	.uleb128 0x7
	.long	0x350
	.uleb128 0x12
	.long	.LASF66
	.uleb128 0x7
	.long	0x35a
	.uleb128 0xc
	.long	0x10e
	.long	0x374
	.uleb128 0xb
	.long	0x43
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.long	0x115
	.uleb128 0x10
	.long	0x374
	.uleb128 0x7
	.long	0x318
	.uleb128 0x10
	.long	0x37e
	.uleb128 0x24
	.long	.LASF114
	.byte	0xb
	.byte	0x97
	.byte	0xe
	.long	0x37e
	.uleb128 0xa
	.long	.LASF67
	.byte	0x18
	.byte	0x9
	.byte	0x44
	.long	0x3c8
	.uleb128 0x1
	.long	.LASF68
	.byte	0x9
	.byte	0x45
	.byte	0x8
	.long	0x17c
	.byte	0
	.uleb128 0x1
	.long	.LASF69
	.byte	0x9
	.byte	0x47
	.byte	0x9
	.long	0x16e
	.byte	0x10
	.uleb128 0x1
	.long	.LASF70
	.byte	0x9
	.byte	0x49
	.byte	0x8
	.long	0x3c8
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.long	.LASF71
	.uleb128 0x25
	.byte	0x18
	.byte	0x9
	.byte	0x52
	.byte	0x3
	.long	0x400
	.uleb128 0x1
	.long	.LASF72
	.byte	0x9
	.byte	0x52
	.byte	0x3
	.long	0x400
	.byte	0
	.uleb128 0x1
	.long	.LASF73
	.byte	0x9
	.byte	0x52
	.byte	0x3
	.long	0x11a
	.byte	0x8
	.uleb128 0x1
	.long	.LASF74
	.byte	0x9
	.byte	0x52
	.byte	0x3
	.long	0x11a
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.long	0x394
	.uleb128 0xa
	.long	.LASF75
	.byte	0x18
	.byte	0x9
	.byte	0x51
	.long	0x41f
	.uleb128 0x1
	.long	.LASF76
	.byte	0x9
	.byte	0x52
	.byte	0x1c
	.long	0x3cf
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	.LASF77
	.byte	0x90
	.byte	0xa
	.byte	0x1a
	.long	0x4ef
	.uleb128 0x1
	.long	.LASF78
	.byte	0xa
	.byte	0x1f
	.byte	0xd
	.long	0x72
	.byte	0
	.uleb128 0x1
	.long	.LASF79
	.byte	0xa
	.byte	0x24
	.byte	0xd
	.long	0x96
	.byte	0x8
	.uleb128 0x1
	.long	.LASF80
	.byte	0xa
	.byte	0x2c
	.byte	0xf
	.long	0xae
	.byte	0x10
	.uleb128 0x1
	.long	.LASF81
	.byte	0xa
	.byte	0x2d
	.byte	0xe
	.long	0xa2
	.byte	0x18
	.uleb128 0x1
	.long	.LASF82
	.byte	0xa
	.byte	0x2f
	.byte	0xd
	.long	0x7e
	.byte	0x1c
	.uleb128 0x1
	.long	.LASF83
	.byte	0xa
	.byte	0x30
	.byte	0xd
	.long	0x8a
	.byte	0x20
	.uleb128 0x1
	.long	.LASF84
	.byte	0xa
	.byte	0x32
	.byte	0x9
	.long	0x58
	.byte	0x24
	.uleb128 0x1
	.long	.LASF85
	.byte	0xa
	.byte	0x34
	.byte	0xd
	.long	0x72
	.byte	0x28
	.uleb128 0x1
	.long	.LASF86
	.byte	0xa
	.byte	0x39
	.byte	0xd
	.long	0xba
	.byte	0x30
	.uleb128 0x1
	.long	.LASF87
	.byte	0xa
	.byte	0x3d
	.byte	0x11
	.long	0xe5
	.byte	0x38
	.uleb128 0x1
	.long	.LASF88
	.byte	0xa
	.byte	0x3f
	.byte	0x10
	.long	0xf1
	.byte	0x40
	.uleb128 0x1
	.long	.LASF89
	.byte	0xa
	.byte	0x4a
	.byte	0x15
	.long	0x140
	.byte	0x48
	.uleb128 0x1
	.long	.LASF90
	.byte	0xa
	.byte	0x4b
	.byte	0x15
	.long	0x140
	.byte	0x58
	.uleb128 0x1
	.long	.LASF91
	.byte	0xa
	.byte	0x4c
	.byte	0x15
	.long	0x140
	.byte	0x68
	.uleb128 0x1
	.long	.LASF92
	.byte	0xa
	.byte	0x59
	.byte	0x17
	.long	0x4ef
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0xfd
	.long	0x4ff
	.uleb128 0xb
	.long	0x43
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	.LASF93
	.byte	0x10
	.byte	0x1
	.byte	0x13
	.long	0x526
	.uleb128 0x1
	.long	.LASF94
	.byte	0x1
	.byte	0x14
	.byte	0xf
	.long	0x374
	.byte	0
	.uleb128 0x1
	.long	.LASF95
	.byte	0x1
	.byte	0x15
	.byte	0xc
	.long	0x11a
	.byte	0x8
	.byte	0
	.uleb128 0x11
	.long	0x4ff
	.uleb128 0x26
	.long	.LASF130
	.byte	0x7
	.byte	0x4
	.long	0x3c
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.long	0x550
	.uleb128 0x13
	.long	.LASF96
	.byte	0
	.uleb128 0x13
	.long	.LASF97
	.byte	0x1
	.uleb128 0x13
	.long	.LASF98
	.byte	0x2
	.byte	0
	.uleb128 0x27
	.long	.LASF126
	.byte	0x1
	.byte	0x57
	.byte	0x17
	.long	0x52b
	.byte	0
	.uleb128 0x8
	.long	.LASF99
	.byte	0xb
	.value	0x16b
	.byte	0xc
	.long	0x58
	.long	0x575
	.uleb128 0x3
	.long	0x374
	.uleb128 0x18
	.byte	0
	.uleb128 0x8
	.long	.LASF100
	.byte	0xc
	.value	0x15e
	.byte	0xe
	.long	0x109
	.long	0x591
	.uleb128 0x3
	.long	0x374
	.uleb128 0x3
	.long	0x374
	.byte	0
	.uleb128 0x28
	.long	.LASF101
	.byte	0xd
	.byte	0x43
	.byte	0xd
	.long	0x5b2
	.uleb128 0x3
	.long	0x374
	.uleb128 0x3
	.long	0x374
	.uleb128 0x3
	.long	0x3c
	.uleb128 0x3
	.long	0x374
	.byte	0
	.uleb128 0x19
	.long	.LASF108
	.byte	0xe
	.value	0x2af
	.long	0x5c4
	.uleb128 0x3
	.long	0xde
	.byte	0
	.uleb128 0x8
	.long	.LASF102
	.byte	0xc
	.value	0x197
	.byte	0xf
	.long	0x126
	.long	0x5db
	.uleb128 0x3
	.long	0x374
	.byte	0
	.uleb128 0x1a
	.long	.LASF103
	.byte	0xb
	.byte	0xb8
	.long	0x58
	.long	0x5f0
	.uleb128 0x3
	.long	0x37e
	.byte	0
	.uleb128 0x8
	.long	.LASF104
	.byte	0xb
	.value	0x2e2
	.byte	0xf
	.long	0x126
	.long	0x616
	.uleb128 0x3
	.long	0xe0
	.uleb128 0x3
	.long	0x126
	.uleb128 0x3
	.long	0x126
	.uleb128 0x3
	.long	0x383
	.byte	0
	.uleb128 0x8
	.long	.LASF105
	.byte	0xe
	.value	0x2a0
	.byte	0xe
	.long	0xde
	.long	0x62d
	.uleb128 0x3
	.long	0x43
	.byte	0
	.uleb128 0x1a
	.long	.LASF106
	.byte	0xf
	.byte	0xd2
	.long	0x58
	.long	0x647
	.uleb128 0x3
	.long	0x58
	.uleb128 0x3
	.long	0x647
	.byte	0
	.uleb128 0x7
	.long	0x41f
	.uleb128 0x8
	.long	.LASF107
	.byte	0xb
	.value	0x373
	.byte	0xc
	.long	0x58
	.long	0x663
	.uleb128 0x3
	.long	0x37e
	.byte	0
	.uleb128 0x19
	.long	.LASF109
	.byte	0xb
	.value	0x36e
	.long	0x675
	.uleb128 0x3
	.long	0x374
	.byte	0
	.uleb128 0x8
	.long	.LASF110
	.byte	0xb
	.value	0x165
	.byte	0xc
	.long	0x58
	.long	0x692
	.uleb128 0x3
	.long	0x37e
	.uleb128 0x3
	.long	0x374
	.uleb128 0x18
	.byte	0
	.uleb128 0x8
	.long	.LASF111
	.byte	0xb
	.value	0x108
	.byte	0xe
	.long	0x37e
	.long	0x6ae
	.uleb128 0x3
	.long	0x379
	.uleb128 0x3
	.long	0x379
	.byte	0
	.uleb128 0x1b
	.long	.LASF123
	.byte	0x1
	.byte	0x68
	.byte	0x6
	.long	0x3c8
	.quad	.LFB1303
	.quad	.LFE1303-.LFB1303
	.uleb128 0x1
	.byte	0x9c
	.long	0x880
	.uleb128 0x14
	.long	.LASF112
	.byte	0x1
	.byte	0x68
	.byte	0x21
	.long	0x374
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x14
	.long	.LASF113
	.byte	0x1
	.byte	0x68
	.byte	0x3f
	.long	0x880
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0x15
	.long	.LASF115
	.byte	0x1
	.byte	0x6b
	.byte	0x9
	.long	0x109
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0x15
	.long	.LASF94
	.byte	0x1
	.byte	0x70
	.byte	0x15
	.long	0x4ff
	.long	.LLST18
	.long	.LVUS18
	.uleb128 0x29
	.long	0x885
	.quad	.LBI31
	.byte	.LVU124
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.byte	0x1
	.byte	0x77
	.byte	0x7
	.long	0x7fc
	.uleb128 0x9
	.long	0x894
	.long	.LLST19
	.long	.LVUS19
	.uleb128 0xe
	.long	0x89f
	.long	.LLST20
	.long	.LVUS20
	.uleb128 0x4
	.quad	.LVL55
	.long	0xc95
	.long	0x77e
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x4
	.quad	.LVL59
	.long	0xac7
	.long	0x7b2
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2a
	.long	0x8c8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -120
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.quad	.LVL61
	.long	0x55d
	.long	0x7e0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x91
	.sleb128 -128
	.byte	0x94
	.byte	0x4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.quad	.LVL63
	.long	0xc95
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.byte	0
	.uleb128 0x4
	.quad	.LVL46
	.long	0x952
	.long	0x815
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x4
	.quad	.LVL50
	.long	0x5c4
	.long	0x82d
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL51
	.long	0xac7
	.long	0x85a
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -120
	.byte	0x6
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.uleb128 0x4
	.quad	.LVL64
	.long	0x5b2
	.long	0x872
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.quad	.LVL68
	.long	0xca0
	.byte	0
	.uleb128 0x7
	.long	0x405
	.uleb128 0x1c
	.long	.LASF121
	.byte	0x59
	.byte	0xd
	.long	0x3c8
	.long	0x8ab
	.uleb128 0xd
	.long	.LASF116
	.byte	0x59
	.byte	0x31
	.long	0x8ab
	.uleb128 0x1d
	.long	.LASF119
	.byte	0x5a
	.byte	0x15
	.long	0x4ff
	.byte	0
	.uleb128 0x7
	.long	0x526
	.uleb128 0x2b
	.long	.LASF131
	.byte	0x1
	.byte	0x2b
	.byte	0xd
	.byte	0x1
	.long	0x8fd
	.uleb128 0xd
	.long	.LASF94
	.byte	0x2b
	.byte	0x2b
	.long	0x8fd
	.uleb128 0xd
	.long	.LASF117
	.byte	0x2c
	.byte	0x31
	.long	0x8ab
	.uleb128 0xd
	.long	.LASF118
	.byte	0x2d
	.byte	0x24
	.long	0x374
	.uleb128 0x2c
	.long	.LASF132
	.long	0x912
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.uleb128 0x1d
	.long	.LASF120
	.byte	0x3a
	.byte	0xf
	.long	0x374
	.byte	0
	.uleb128 0x7
	.long	0x4ff
	.uleb128 0xc
	.long	0x115
	.long	0x912
	.uleb128 0xb
	.long	0x43
	.byte	0xa
	.byte	0
	.uleb128 0x11
	.long	0x902
	.uleb128 0x1c
	.long	.LASF122
	.byte	0x20
	.byte	0x11
	.long	0x11a
	.long	0x952
	.uleb128 0x1e
	.string	"str"
	.byte	0x2b
	.long	0x374
	.uleb128 0x1e
	.string	"len"
	.byte	0x39
	.long	0x11a
	.uleb128 0xd
	.long	.LASF118
	.byte	0x21
	.byte	0x2b
	.long	0x374
	.uleb128 0x2d
	.uleb128 0x2e
	.string	"i"
	.byte	0x1
	.byte	0x22
	.byte	0x11
	.long	0x11a
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF124
	.byte	0x2
	.byte	0x12
	.byte	0x7
	.long	0x109
	.quad	.LFB1298
	.quad	.LFE1298-.LFB1298
	.uleb128 0x1
	.byte	0x9c
	.long	0xac7
	.uleb128 0x14
	.long	.LASF125
	.byte	0x2
	.byte	0x12
	.byte	0x21
	.long	0x374
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x1f
	.string	"f"
	.byte	0x13
	.long	0x37e
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x2f
	.string	"s"
	.byte	0x2
	.byte	0x1b
	.byte	0xf
	.long	0x41f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x15
	.long	.LASF127
	.byte	0x2
	.byte	0x1e
	.byte	0xc
	.long	0x11a
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x1f
	.string	"buf"
	.byte	0x1f
	.long	0x109
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x4
	.quad	.LVL31
	.long	0x692
	.long	0x9f1
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x4
	.quad	.LVL32
	.long	0x64c
	.long	0xa09
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL33
	.long	0x62d
	.long	0xa22
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.byte	0
	.uleb128 0x4
	.quad	.LVL35
	.long	0x616
	.long	0xa3a
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.quad	.LVL37
	.long	0x5f0
	.long	0xa63
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL38
	.long	0x5db
	.long	0xa7b
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL42
	.long	0x675
	.long	0xaa1
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x4
	.quad	.LVL43
	.long	0x663
	.long	0xab9
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.quad	.LVL44
	.long	0xca0
	.byte	0
	.uleb128 0x30
	.long	0x8b0
	.quad	.LFB1304
	.quad	.LFE1304-.LFB1304
	.uleb128 0x1
	.byte	0x9c
	.long	0xc95
	.uleb128 0x9
	.long	0x8bd
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x9
	.long	0x8d3
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0xe
	.long	0x8f1
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x9
	.long	0x8c8
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x31
	.long	0x917
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.byte	0x1
	.byte	0x34
	.byte	0x9
	.long	0xb7f
	.uleb128 0x17
	.long	0x926
	.uleb128 0x17
	.long	0x930
	.uleb128 0x17
	.long	0x93a
	.uleb128 0x32
	.long	0x945
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0xe
	.long	0x946
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0xf
	.quad	.LVL6
	.long	0x575
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	0x917
	.quad	.LBI19
	.byte	.LVU37
	.long	.LLRL5
	.byte	0x1
	.byte	0x42
	.byte	0x12
	.long	0xbf5
	.uleb128 0x9
	.long	0x926
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x9
	.long	0x930
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x9
	.long	0x93a
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x34
	.long	0x945
	.long	.LLRL9
	.long	0xbda
	.uleb128 0xe
	.long	0x946
	.long	.LLST10
	.long	.LVUS10
	.byte	0
	.uleb128 0xf
	.quad	.LVL17
	.long	0x575
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x4
	.quad	.LVL12
	.long	0x5c4
	.long	0xc0d
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x4
	.quad	.LVL25
	.long	0x591
	.long	0xc4c
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x2e
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.byte	0
	.uleb128 0x16
	.quad	.LVL26
	.long	0xca0
	.uleb128 0xf
	.quad	.LVL29
	.long	0x591
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x2e
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	.LASF133
	.long	.LASF134
	.byte	0x10
	.byte	0
	.uleb128 0x36
	.long	.LASF135
	.long	.LASF135
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 32
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x49
	.byte	0
	.uleb128 0x80
	.uleb128 0x13
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS15:
	.uleb128 0
	.uleb128 .LVU110
	.uleb128 .LVU110
	.uleb128 0
.LLST15:
	.byte	0x4
	.uleb128 .LVL45-.Ltext0
	.uleb128 .LVL46-1-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL46-1-.Ltext0
	.uleb128 .LFE1303-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS16:
	.uleb128 0
	.uleb128 .LVU110
	.uleb128 .LVU110
	.uleb128 0
.LLST16:
	.byte	0x4
	.uleb128 .LVL45-.Ltext0
	.uleb128 .LVL46-1-.Ltext0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL46-1-.Ltext0
	.uleb128 .LFE1303-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 .LVU110
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU147
	.uleb128 .LVU148
	.uleb128 .LVU149
.LLST17:
	.byte	0x4
	.uleb128 .LVL46-.Ltext0
	.uleb128 .LVL47-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL47-.Ltext0
	.uleb128 .LVL65-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL66-.Ltext0
	.uleb128 .LVL67-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS18:
	.uleb128 .LVU113
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU147
.LLST18:
	.byte	0x4
	.uleb128 .LVL48-.Ltext0
	.uleb128 .LVL49-.Ltext0
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL49-.Ltext0
	.uleb128 .LVL52-.Ltext0
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL52-.Ltext0
	.uleb128 .LVL53-.Ltext0
	.uleb128 0x5
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL53-.Ltext0
	.uleb128 .LVL65-.Ltext0
	.uleb128 0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x8
	.byte	0x56
	.byte	0x93
	.uleb128 0x8
	.byte	0
.LVUS19:
	.uleb128 .LVU124
	.uleb128 .LVU142
.LLST19:
	.byte	0x4
	.uleb128 .LVL54-.Ltext0
	.uleb128 .LVL63-.Ltext0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
.LVUS20:
	.uleb128 .LVU126
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 .LVU131
	.uleb128 .LVU131
	.uleb128 .LVU133
	.uleb128 .LVU133
	.uleb128 .LVU134
	.uleb128 .LVU134
	.uleb128 .LVU135
	.uleb128 .LVU135
	.uleb128 .LVU138
	.uleb128 .LVU138
	.uleb128 .LVU140
	.uleb128 .LVU140
	.uleb128 .LVU142
.LLST20:
	.byte	0x4
	.uleb128 .LVL54-.Ltext0
	.uleb128 .LVL56-.Ltext0
	.uleb128 0x8
	.byte	0x30
	.byte	0x9f
	.byte	0x93
	.uleb128 0x8
	.byte	0x30
	.byte	0x9f
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL56-.Ltext0
	.uleb128 .LVL57-.Ltext0
	.uleb128 0x6
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x52
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL57-.Ltext0
	.uleb128 .LVL58-.Ltext0
	.uleb128 0x6
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x52
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL58-.Ltext0
	.uleb128 .LVL59-1-.Ltext0
	.uleb128 0x8
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x91
	.sleb128 -88
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL59-1-.Ltext0
	.uleb128 .LVL60-.Ltext0
	.uleb128 0x5
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL60-.Ltext0
	.uleb128 .LVL61-1-.Ltext0
	.uleb128 0x6
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x52
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL61-1-.Ltext0
	.uleb128 .LVL62-.Ltext0
	.uleb128 0x8
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x91
	.sleb128 -128
	.byte	0x93
	.uleb128 0x8
	.byte	0x4
	.uleb128 .LVL62-.Ltext0
	.uleb128 .LVL63-.Ltext0
	.uleb128 0x5
	.byte	0x5f
	.byte	0x93
	.uleb128 0x8
	.byte	0x93
	.uleb128 0x8
	.byte	0
.LVUS11:
	.uleb128 0
	.uleb128 .LVU76
	.uleb128 .LVU76
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU99
	.uleb128 .LVU99
	.uleb128 .LVU100
	.uleb128 .LVU100
	.uleb128 0
.LLST11:
	.byte	0x4
	.uleb128 .LVL30-.Ltext0
	.uleb128 .LVL31-1-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL31-1-.Ltext0
	.uleb128 .LVL36-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL36-.Ltext0
	.uleb128 .LVL39-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.Ltext0
	.uleb128 .LVL41-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL41-.Ltext0
	.uleb128 .LVL42-1-.Ltext0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL42-1-.Ltext0
	.uleb128 .LFE1298-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS12:
	.uleb128 .LVU76
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU95
	.uleb128 .LVU96
	.uleb128 .LVU97
.LLST12:
	.byte	0x4
	.uleb128 .LVL31-.Ltext0
	.uleb128 .LVL32-1-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL32-1-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL39-.Ltext0
	.uleb128 .LVL40-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0
.LVUS13:
	.uleb128 .LVU86
	.uleb128 .LVU95
.LLST13:
	.byte	0x4
	.uleb128 .LVL34-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS14:
	.uleb128 .LVU90
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU95
.LLST14:
	.byte	0x4
	.uleb128 .LVL36-.Ltext0
	.uleb128 .LVL37-1-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-1-.Ltext0
	.uleb128 .LVL38-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU35
	.uleb128 .LVU35
	.uleb128 .LVU58
	.uleb128 .LVU58
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 0
.LLST0:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL3-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL8-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL8-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL11-.Ltext0
	.uleb128 .LVL21-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL21-.Ltext0
	.uleb128 .LVL22-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL22-.Ltext0
	.uleb128 .LVL24-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL24-.Ltext0
	.uleb128 .LVL26-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL26-.Ltext0
	.uleb128 .LVL28-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL28-.Ltext0
	.uleb128 .LFE1304-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 .LVU57
	.uleb128 .LVU57
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU67
	.uleb128 .LVU67
	.uleb128 0
.LLST1:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL2-.Ltext0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL8-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL8-.Ltext0
	.uleb128 .LVL9-.Ltext0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL9-.Ltext0
	.uleb128 .LVL20-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL20-.Ltext0
	.uleb128 .LVL22-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL22-.Ltext0
	.uleb128 .LVL26-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL26-.Ltext0
	.uleb128 .LVL27-.Ltext0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL27-.Ltext0
	.uleb128 .LFE1304-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS2:
	.uleb128 .LVU29
	.uleb128 .LVU36
	.uleb128 .LVU59
	.uleb128 .LVU62
.LLST2:
	.byte	0x4
	.uleb128 .LVL10-.Ltext0
	.uleb128 .LVL12-1-.Ltext0
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL22-.Ltext0
	.uleb128 .LVL23-.Ltext0
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS3:
	.uleb128 .LVU4
	.uleb128 0
.LLST3:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LFE1304-.Ltext0
	.uleb128 0x6
	.byte	0xfa
	.long	0x8c8
	.byte	0x9f
	.byte	0
.LVUS4:
	.uleb128 .LVU7
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU19
.LLST4:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL3-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS6:
	.uleb128 .LVU37
	.uleb128 .LVU54
.LLST6:
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LVUS7:
	.uleb128 .LVU37
	.uleb128 .LVU44
	.uleb128 .LVU44
	.uleb128 .LVU54
.LLST7:
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL14-.Ltext0
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL14-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS8:
	.uleb128 .LVU37
	.uleb128 .LVU54
.LLST8:
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS10:
	.uleb128 .LVU40
	.uleb128 .LVU44
	.uleb128 .LVU44
	.uleb128 .LVU54
.LLST10:
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL14-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL5:
	.byte	0x4
	.uleb128 .LBB19-.Ltext0
	.uleb128 .LBE19-.Ltext0
	.byte	0x4
	.uleb128 .LBB25-.Ltext0
	.uleb128 .LBE25-.Ltext0
	.byte	0
.LLRL9:
	.byte	0x4
	.uleb128 .LBB21-.Ltext0
	.uleb128 .LBE21-.Ltext0
	.byte	0x4
	.uleb128 .LBB23-.Ltext0
	.uleb128 .LBE23-.Ltext0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF53:
	.string	"_shortbuf"
.LASF129:
	.string	"_IO_lock_t"
.LASF102:
	.string	"strlen"
.LASF114:
	.string	"stderr"
.LASF74:
	.string	"capacity"
.LASF42:
	.string	"_IO_buf_end"
.LASF40:
	.string	"_IO_write_end"
.LASF4:
	.string	"unsigned int"
.LASF58:
	.string	"_freeres_list"
.LASF87:
	.string	"st_blksize"
.LASF34:
	.string	"_flags"
.LASF46:
	.string	"_markers"
.LASF15:
	.string	"__nlink_t"
.LASF75:
	.string	"dsr_Scene"
.LASF13:
	.string	"__ino_t"
.LASF45:
	.string	"_IO_save_end"
.LASF30:
	.string	"float"
.LASF65:
	.string	"_IO_codecvt"
.LASF105:
	.string	"malloc"
.LASF73:
	.string	"count"
.LASF106:
	.string	"fstat"
.LASF29:
	.string	"long long unsigned int"
.LASF88:
	.string	"st_blocks"
.LASF113:
	.string	"scene"
.LASF44:
	.string	"_IO_backup_base"
.LASF55:
	.string	"_offset"
.LASF70:
	.string	"is_portal"
.LASF123:
	.string	"dsr_load_scene"
.LASF110:
	.string	"fprintf"
.LASF48:
	.string	"_fileno"
.LASF77:
	.string	"stat"
.LASF131:
	.string	"next_chunk"
.LASF133:
	.string	"puts"
.LASF28:
	.string	"tv_nsec"
.LASF24:
	.string	"size_t"
.LASF14:
	.string	"__mode_t"
.LASF128:
	.string	"GNU C23 14.1.1 20240522 -masm=intel -mtune=generic -march=x86-64 -g -O2 -std=gnu23 -fPIC"
.LASF37:
	.string	"_IO_read_base"
.LASF71:
	.string	"_Bool"
.LASF83:
	.string	"st_gid"
.LASF107:
	.string	"fileno"
.LASF122:
	.string	"get_chunk_len"
.LASF81:
	.string	"st_mode"
.LASF108:
	.string	"free"
.LASF9:
	.string	"__uint64_t"
.LASF76:
	.string	"walls"
.LASF125:
	.string	"path"
.LASF32:
	.string	"timespec"
.LASF22:
	.string	"char"
.LASF61:
	.string	"_mode"
.LASF64:
	.string	"_IO_marker"
.LASF35:
	.string	"_IO_read_ptr"
.LASF132:
	.string	"__PRETTY_FUNCTION__"
.LASF124:
	.string	"fio_read_file"
.LASF121:
	.string	"parse_line"
.LASF79:
	.string	"st_ino"
.LASF38:
	.string	"_IO_write_base"
.LASF25:
	.string	"long long int"
.LASF109:
	.string	"perror"
.LASF99:
	.string	"printf"
.LASF97:
	.string	"BLOCK_TYPE_WALLS"
.LASF43:
	.string	"_IO_save_base"
.LASF10:
	.string	"__dev_t"
.LASF21:
	.string	"__syscall_slong_t"
.LASF98:
	.string	"BLOCK_TYPE_SCENES"
.LASF127:
	.string	"size"
.LASF59:
	.string	"_freeres_buf"
.LASF84:
	.string	"__pad0"
.LASF60:
	.string	"__pad5"
.LASF92:
	.string	"__glibc_reserved"
.LASF69:
	.string	"height"
.LASF111:
	.string	"fopen"
.LASF52:
	.string	"_vtable_offset"
.LASF72:
	.string	"items"
.LASF120:
	.string	"chunk_src_end"
.LASF26:
	.string	"long double"
.LASF134:
	.string	"__builtin_puts"
.LASF12:
	.string	"__gid_t"
.LASF130:
	.string	"BlockType"
.LASF36:
	.string	"_IO_read_end"
.LASF7:
	.string	"short int"
.LASF90:
	.string	"st_mtim"
.LASF8:
	.string	"long int"
.LASF95:
	.string	"length"
.LASF119:
	.string	"token_view"
.LASF104:
	.string	"fread"
.LASF135:
	.string	"__stack_chk_fail"
.LASF67:
	.string	"dsr_Wall"
.LASF115:
	.string	"scene_src"
.LASF117:
	.string	"chunk_src"
.LASF66:
	.string	"_IO_wide_data"
.LASF23:
	.string	"uint64_t"
.LASF103:
	.string	"fclose"
.LASF19:
	.string	"__blksize_t"
.LASF68:
	.string	"vertices"
.LASF11:
	.string	"__uid_t"
.LASF89:
	.string	"st_atim"
.LASF112:
	.string	"scene_path"
.LASF57:
	.string	"_wide_data"
.LASF54:
	.string	"_lock"
.LASF27:
	.string	"tv_sec"
.LASF5:
	.string	"long unsigned int"
.LASF50:
	.string	"_old_offset"
.LASF33:
	.string	"_IO_FILE"
.LASF100:
	.string	"strstr"
.LASF101:
	.string	"__assert_fail"
.LASF2:
	.string	"unsigned char"
.LASF93:
	.string	"StringView"
.LASF39:
	.string	"_IO_write_ptr"
.LASF18:
	.string	"__time_t"
.LASF86:
	.string	"st_size"
.LASF56:
	.string	"_codecvt"
.LASF82:
	.string	"st_uid"
.LASF16:
	.string	"__off_t"
.LASF91:
	.string	"st_ctim"
.LASF78:
	.string	"st_dev"
.LASF6:
	.string	"signed char"
.LASF3:
	.string	"short unsigned int"
.LASF94:
	.string	"view"
.LASF31:
	.string	"double"
.LASF116:
	.string	"line_view"
.LASF20:
	.string	"__blkcnt_t"
.LASF80:
	.string	"st_nlink"
.LASF126:
	.string	"block_type"
.LASF47:
	.string	"_chain"
.LASF85:
	.string	"st_rdev"
.LASF63:
	.string	"FILE"
.LASF96:
	.string	"BLOCK_TYPE_NONE"
.LASF49:
	.string	"_flags2"
.LASF51:
	.string	"_cur_column"
.LASF118:
	.string	"chunk_delim_str"
.LASF17:
	.string	"__off64_t"
.LASF62:
	.string	"_unused2"
.LASF41:
	.string	"_IO_buf_base"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer"
.LASF0:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/load-scene.c"
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
