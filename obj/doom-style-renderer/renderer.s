	.file	"renderer.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer" "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/renderer.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/renderer.c"
	.align 8
.LC1:
	.string	"surface->pixel_format.bytes_per_pixel == 4 && \"Unsupported pixel format\""
	.text
	.p2align 4
	.globl	dsr_render
	.type	dsr_render, @function
dsr_render:
.LVL0:
.LFB1298:
	.file 1 "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/renderer.c"
	.loc 1 9 50 view -0
	.cfi_startproc
	.loc 1 9 50 is_stmt 0 view .LVU1
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	sub	rsp, 16
	.cfi_def_cfa_offset 48
	.loc 1 9 50 view .LVU2
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	.loc 1 10 3 is_stmt 1 view .LVU3
	cmp	BYTE PTR 13[rdi], 4
	jne	.L6
	.loc 1 20 21 is_stmt 0 view .LVU4
	movss	xmm0, DWORD PTR .LC2[rip]
	mulss	xmm0, DWORD PTR [rdx]
	mov	rbx, rdx
	.loc 1 13 3 is_stmt 1 view .LVU5
.LVL1:
	.loc 1 14 3 view .LVU6
	.loc 1 17 3 view .LVU7
	.loc 1 19 3 view .LVU8
	mov	r12, rdi
	mov	rbp, rsi
	.loc 1 20 5 is_stmt 0 view .LVU9
	cvtss2sd	xmm0, xmm0
	call	tan@PLT
.LVL2:
	.loc 1 27 3 view .LVU10
	mov	rcx, rsp
	mov	rdx, rbx
	.loc 1 20 5 view .LVU11
	movapd	xmm1, xmm0
	.loc 1 20 37 discriminator 1 view .LVU12
	pxor	xmm0, xmm0
	.loc 1 27 3 view .LVU13
	mov	rsi, rbp
	mov	rdi, r12
	.loc 1 20 37 discriminator 1 view .LVU14
	cvtss2sd	xmm0, DWORD PTR 8[rbx]
	.loc 1 20 29 discriminator 1 view .LVU15
	mulsd	xmm0, xmm1
	.loc 1 20 59 discriminator 1 view .LVU16
	addsd	xmm0, xmm0
	cvtsd2ss	xmm0, xmm0
	.loc 1 21 3 is_stmt 1 view .LVU17
	.loc 1 21 43 is_stmt 0 view .LVU18
	movaps	xmm1, xmm0
	divss	xmm1, DWORD PTR 4[rbx]
	.loc 1 19 22 view .LVU19
	unpcklps	xmm0, xmm1
	movlps	QWORD PTR [rsp], xmm0
	.loc 1 27 3 is_stmt 1 view .LVU20
	call	dsr_render_walls@PLT
.LVL3:
	.loc 1 28 1 is_stmt 0 view .LVU21
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L7
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
.LVL4:
	.loc 1 28 1 view .LVU22
	pop	rbp
	.cfi_def_cfa_offset 16
.LVL5:
	.loc 1 28 1 view .LVU23
	pop	r12
	.cfi_def_cfa_offset 8
.LVL6:
	.loc 1 28 1 view .LVU24
	ret
.LVL7:
.L6:
	.cfi_restore_state
	.loc 1 10 3 is_stmt 1 discriminator 1 view .LVU25
	lea	rcx, __PRETTY_FUNCTION__.0[rip]
	mov	edx, 10
.LVL8:
	.loc 1 10 3 is_stmt 0 discriminator 1 view .LVU26
	lea	rsi, .LC0[rip]
.LVL9:
	.loc 1 10 3 discriminator 1 view .LVU27
	lea	rdi, .LC1[rip]
.LVL10:
	.loc 1 10 3 discriminator 1 view .LVU28
	call	__assert_fail@PLT
.LVL11:
.L7:
	.loc 1 28 1 view .LVU29
	call	__stack_chk_fail@PLT
.LVL12:
	.cfi_endproc
.LFE1298:
	.size	dsr_render, .-dsr_render
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"dsr_render"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC2:
	.long	1056964608
	.text
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-intn.h"
	.file 4 "/usr/include/bits/stdint-uintn.h"
	.file 5 "/home/randompigyt/Hogxel-Engine/external/cglm/include/cglm/types.h"
	.file 6 "/home/randompigyt/Hogxel-Engine/src/common/camera.h"
	.file 7 "/home/randompigyt/Hogxel-Engine/include/doom-style-renderer.h"
	.file 8 "/usr/include/bits/mathcalls.h"
	.file 9 "/usr/include/assert.h"
	.file 10 "/home/randompigyt/Hogxel-Engine/external/cglm/include/cglm/cam.h"
	.file 11 "/home/randompigyt/Hogxel-Engine/external/cglm/include/cglm/clipspace/view_rh.h"
	.file 12 "/home/randompigyt/Hogxel-Engine/external/cglm/include/cglm/vec3.h"
	.file 13 "/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/render-walls.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7dc
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x18
	.long	.LASF90
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x26
	.byte	0x17
	.long	0x2e
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x2
	.byte	0x29
	.byte	0x14
	.long	0x70
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x16
	.long	0x3c
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x4
	.long	.LASF12
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.long	0x43
	.uleb128 0x1a
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0xe
	.long	0x98
	.uleb128 0x4
	.long	.LASF14
	.byte	0x3
	.byte	0x1a
	.byte	0x13
	.long	0x64
	.uleb128 0x4
	.long	.LASF15
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.long	0x51
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4
	.byte	0x1a
	.byte	0x14
	.long	0x77
	.uleb128 0x4
	.long	.LASF17
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x8a
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF18
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF19
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF20
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF21
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF22
	.uleb128 0x4
	.long	.LASF23
	.byte	0x5
	.byte	0x4f
	.byte	0x21
	.long	0x103
	.uleb128 0xc
	.long	0xe9
	.long	0x113
	.uleb128 0x7
	.long	0x43
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.long	.LASF24
	.byte	0x5
	.byte	0x50
	.byte	0x21
	.long	0x11f
	.uleb128 0xc
	.long	0xe9
	.long	0x12f
	.uleb128 0x7
	.long	0x43
	.byte	0x2
	.byte	0
	.uleb128 0x15
	.long	.LASF25
	.byte	0x51
	.long	0x139
	.uleb128 0xc
	.long	0xe9
	.long	0x149
	.uleb128 0x7
	.long	0x43
	.byte	0x3
	.byte	0
	.uleb128 0xc
	.long	0xe9
	.long	0x15f
	.uleb128 0x7
	.long	0x43
	.byte	0x1
	.uleb128 0x7
	.long	0x43
	.byte	0x1
	.byte	0
	.uleb128 0x15
	.long	.LASF26
	.byte	0x59
	.long	0x169
	.uleb128 0x1b
	.long	0xe9
	.byte	0x10
	.long	0x180
	.uleb128 0x7
	.long	0x43
	.byte	0x3
	.uleb128 0x7
	.long	0x43
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	0x9f
	.uleb128 0x1c
	.long	.LASF91
	.byte	0x7
	.byte	0x4
	.long	0x3c
	.byte	0x6
	.byte	0x6
	.byte	0x6
	.long	0x1aa
	.uleb128 0x10
	.long	.LASF27
	.byte	0
	.uleb128 0x10
	.long	.LASF28
	.byte	0x1
	.uleb128 0x10
	.long	.LASF29
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.long	.LASF36
	.byte	0x2c
	.byte	0x6
	.byte	0xd
	.long	0x212
	.uleb128 0x1d
	.string	"fov"
	.byte	0x6
	.byte	0xe
	.byte	0x9
	.long	0xe9
	.byte	0
	.uleb128 0x1
	.long	.LASF30
	.byte	0x6
	.byte	0xf
	.byte	0x9
	.long	0xe9
	.byte	0x4
	.uleb128 0x1
	.long	.LASF31
	.byte	0x6
	.byte	0x11
	.byte	0x9
	.long	0xe9
	.byte	0x8
	.uleb128 0x1
	.long	.LASF32
	.byte	0x6
	.byte	0x12
	.byte	0x9
	.long	0xe9
	.byte	0xc
	.uleb128 0x1
	.long	.LASF33
	.byte	0x6
	.byte	0x14
	.byte	0x8
	.long	0x113
	.byte	0x10
	.uleb128 0x1
	.long	.LASF34
	.byte	0x6
	.byte	0x15
	.byte	0x8
	.long	0x113
	.byte	0x1c
	.uleb128 0x1
	.long	.LASF35
	.byte	0x6
	.byte	0x17
	.byte	0x15
	.long	0x185
	.byte	0x28
	.byte	0
	.uleb128 0xe
	.long	0x1aa
	.uleb128 0xd
	.long	.LASF37
	.byte	0x1c
	.byte	0x7
	.byte	0x27
	.long	0x2da
	.uleb128 0x1
	.long	.LASF38
	.byte	0x7
	.byte	0x28
	.byte	0xb
	.long	0xb0
	.byte	0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x7
	.byte	0x29
	.byte	0xb
	.long	0xb0
	.byte	0x1
	.uleb128 0x1
	.long	.LASF40
	.byte	0x7
	.byte	0x2b
	.byte	0xc
	.long	0xbc
	.byte	0x4
	.uleb128 0x1
	.long	.LASF41
	.byte	0x7
	.byte	0x2c
	.byte	0xc
	.long	0xbc
	.byte	0x8
	.uleb128 0x1
	.long	.LASF42
	.byte	0x7
	.byte	0x2d
	.byte	0xc
	.long	0xbc
	.byte	0xc
	.uleb128 0x1
	.long	.LASF43
	.byte	0x7
	.byte	0x2e
	.byte	0xc
	.long	0xbc
	.byte	0x10
	.uleb128 0x1
	.long	.LASF44
	.byte	0x7
	.byte	0x30
	.byte	0xb
	.long	0xb0
	.byte	0x14
	.uleb128 0x1
	.long	.LASF45
	.byte	0x7
	.byte	0x31
	.byte	0xb
	.long	0xb0
	.byte	0x15
	.uleb128 0x1
	.long	.LASF46
	.byte	0x7
	.byte	0x32
	.byte	0xb
	.long	0xb0
	.byte	0x16
	.uleb128 0x1
	.long	.LASF47
	.byte	0x7
	.byte	0x33
	.byte	0xb
	.long	0xb0
	.byte	0x17
	.uleb128 0x1
	.long	.LASF48
	.byte	0x7
	.byte	0x35
	.byte	0xb
	.long	0xb0
	.byte	0x18
	.uleb128 0x1
	.long	.LASF49
	.byte	0x7
	.byte	0x36
	.byte	0xb
	.long	0xb0
	.byte	0x19
	.uleb128 0x1
	.long	.LASF50
	.byte	0x7
	.byte	0x37
	.byte	0xb
	.long	0xb0
	.byte	0x1a
	.uleb128 0x1
	.long	.LASF51
	.byte	0x7
	.byte	0x38
	.byte	0xb
	.long	0xb0
	.byte	0x1b
	.byte	0
	.uleb128 0xd
	.long	.LASF52
	.byte	0x30
	.byte	0x7
	.byte	0x3b
	.long	0x328
	.uleb128 0x1
	.long	.LASF53
	.byte	0x7
	.byte	0x3c
	.byte	0xb
	.long	0xa4
	.byte	0
	.uleb128 0x1
	.long	.LASF54
	.byte	0x7
	.byte	0x3c
	.byte	0x12
	.long	0xa4
	.byte	0x4
	.uleb128 0x1
	.long	.LASF55
	.byte	0x7
	.byte	0x3d
	.byte	0xb
	.long	0xa4
	.byte	0x8
	.uleb128 0x1
	.long	.LASF56
	.byte	0x7
	.byte	0x3f
	.byte	0x1a
	.long	0x217
	.byte	0xc
	.uleb128 0x1
	.long	.LASF57
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0x96
	.byte	0x28
	.byte	0
	.uleb128 0xd
	.long	.LASF58
	.byte	0x18
	.byte	0x7
	.byte	0x44
	.long	0x35c
	.uleb128 0x1
	.long	.LASF59
	.byte	0x7
	.byte	0x45
	.byte	0x8
	.long	0x149
	.byte	0
	.uleb128 0x1
	.long	.LASF54
	.byte	0x7
	.byte	0x47
	.byte	0x9
	.long	0xe9
	.byte	0x10
	.uleb128 0x1
	.long	.LASF60
	.byte	0x7
	.byte	0x49
	.byte	0x8
	.long	0x35c
	.byte	0x14
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF61
	.uleb128 0x1e
	.byte	0x18
	.byte	0x7
	.byte	0x52
	.byte	0x3
	.long	0x394
	.uleb128 0x1
	.long	.LASF62
	.byte	0x7
	.byte	0x52
	.byte	0x3
	.long	0x394
	.byte	0
	.uleb128 0x1
	.long	.LASF63
	.byte	0x7
	.byte	0x52
	.byte	0x3
	.long	0xc8
	.byte	0x8
	.uleb128 0x1
	.long	.LASF64
	.byte	0x7
	.byte	0x52
	.byte	0x3
	.long	0xc8
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.long	0x328
	.uleb128 0xd
	.long	.LASF65
	.byte	0x18
	.byte	0x7
	.byte	0x51
	.long	0x3b3
	.uleb128 0x1
	.long	.LASF66
	.byte	0x7
	.byte	0x52
	.byte	0x1c
	.long	0x363
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x399
	.uleb128 0x1f
	.long	.LASF67
	.byte	0x8
	.byte	0x8f
	.byte	0x1
	.long	0xe9
	.long	0x3ce
	.uleb128 0x5
	.long	0xe9
	.byte	0
	.uleb128 0x20
	.long	.LASF92
	.byte	0xd
	.byte	0x7
	.byte	0x6
	.long	0x3ef
	.uleb128 0x5
	.long	0x3ef
	.uleb128 0x5
	.long	0x3f4
	.uleb128 0x5
	.long	0x3f9
	.uleb128 0x5
	.long	0x3fe
	.byte	0
	.uleb128 0x9
	.long	0x2da
	.uleb128 0x9
	.long	0x3b3
	.uleb128 0x9
	.long	0x212
	.uleb128 0x9
	.long	0xe9
	.uleb128 0x21
	.string	"tan"
	.byte	0x8
	.byte	0x42
	.byte	0x1
	.long	0xf0
	.long	0x419
	.uleb128 0x5
	.long	0xf0
	.byte	0
	.uleb128 0x22
	.long	.LASF68
	.byte	0x9
	.byte	0x43
	.byte	0xd
	.long	0x43a
	.uleb128 0x5
	.long	0x180
	.uleb128 0x5
	.long	0x180
	.uleb128 0x5
	.long	0x3c
	.uleb128 0x5
	.long	0x180
	.byte	0
	.uleb128 0x23
	.long	.LASF93
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.quad	.LFB1298
	.quad	.LFE1298-.LFB1298
	.uleb128 0x1
	.byte	0x9c
	.long	0x54a
	.uleb128 0x11
	.long	.LASF69
	.byte	0x8
	.byte	0x25
	.long	0x3ef
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x11
	.long	.LASF70
	.byte	0x8
	.byte	0x46
	.long	0x3f4
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x11
	.long	.LASF71
	.byte	0x9
	.byte	0x2a
	.long	0x3f9
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x24
	.long	.LASF94
	.long	0x55a
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.uleb128 0x25
	.long	.LASF95
	.byte	0x1
	.byte	0xd
	.byte	0x8
	.long	0x15f
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x26
	.long	.LASF75
	.byte	0x1
	.byte	0x11
	.byte	0x8
	.long	0xf7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.quad	.LVL2
	.long	0x403
	.uleb128 0x17
	.quad	.LVL3
	.long	0x3ce
	.long	0x4fe
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x17
	.quad	.LVL11
	.long	0x419
	.long	0x53c
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.byte	0
	.uleb128 0x16
	.quad	.LVL12
	.long	0x7d6
	.byte	0
	.uleb128 0xc
	.long	0x9f
	.long	0x55a
	.uleb128 0x7
	.long	0x43
	.byte	0xa
	.byte	0
	.uleb128 0xe
	.long	0x54a
	.uleb128 0xa
	.long	.LASF73
	.byte	0xa
	.value	0x176
	.long	0x59f
	.uleb128 0x3
	.string	"eye"
	.byte	0xa
	.value	0x176
	.byte	0xf
	.long	0x3fe
	.uleb128 0x3
	.string	"dir"
	.byte	0xa
	.value	0x176
	.byte	0x19
	.long	0x3fe
	.uleb128 0x3
	.string	"up"
	.byte	0xa
	.value	0x176
	.byte	0x23
	.long	0x3fe
	.uleb128 0xb
	.long	.LASF72
	.byte	0xa
	.value	0x176
	.byte	0x2c
	.long	0x59f
	.byte	0
	.uleb128 0x9
	.long	0x12f
	.uleb128 0x12
	.long	.LASF74
	.byte	0xb
	.byte	0x4b
	.long	0x5ec
	.uleb128 0x6
	.string	"eye"
	.byte	0xb
	.byte	0x4b
	.byte	0x12
	.long	0x3fe
	.uleb128 0x6
	.string	"dir"
	.byte	0xb
	.byte	0x4b
	.byte	0x1c
	.long	0x3fe
	.uleb128 0x6
	.string	"up"
	.byte	0xb
	.byte	0x4b
	.byte	0x26
	.long	0x3fe
	.uleb128 0xf
	.long	.LASF72
	.byte	0xb
	.byte	0x4b
	.byte	0x2f
	.long	0x59f
	.uleb128 0x27
	.long	.LASF76
	.byte	0xb
	.byte	0x4c
	.byte	0x16
	.long	0x113
	.byte	0x8
	.byte	0
	.uleb128 0x12
	.long	.LASF77
	.byte	0xb
	.byte	0x22
	.long	0x63f
	.uleb128 0x6
	.string	"eye"
	.byte	0xb
	.byte	0x22
	.byte	0x14
	.long	0x3fe
	.uleb128 0xf
	.long	.LASF78
	.byte	0xb
	.byte	0x22
	.byte	0x1e
	.long	0x3fe
	.uleb128 0x6
	.string	"up"
	.byte	0xb
	.byte	0x22
	.byte	0x2b
	.long	0x3fe
	.uleb128 0xf
	.long	.LASF72
	.byte	0xb
	.byte	0x22
	.byte	0x34
	.long	0x59f
	.uleb128 0x13
	.string	"f"
	.byte	0x16
	.long	0x113
	.uleb128 0x13
	.string	"u"
	.byte	0x19
	.long	0x113
	.uleb128 0x13
	.string	"s"
	.byte	0x1c
	.long	0x113
	.byte	0
	.uleb128 0xa
	.long	.LASF79
	.byte	0xc
	.value	0x2c6
	.long	0x66f
	.uleb128 0x3
	.string	"a"
	.byte	0xc
	.value	0x2c6
	.byte	0x16
	.long	0x3fe
	.uleb128 0x3
	.string	"b"
	.byte	0xc
	.value	0x2c6
	.byte	0x1e
	.long	0x3fe
	.uleb128 0xb
	.long	.LASF72
	.byte	0xc
	.value	0x2c6
	.byte	0x26
	.long	0x3fe
	.byte	0
	.uleb128 0xa
	.long	.LASF80
	.byte	0xc
	.value	0x2b4
	.long	0x6aa
	.uleb128 0x3
	.string	"a"
	.byte	0xc
	.value	0x2b4
	.byte	0x15
	.long	0x3fe
	.uleb128 0x3
	.string	"b"
	.byte	0xc
	.value	0x2b4
	.byte	0x1d
	.long	0x3fe
	.uleb128 0xb
	.long	.LASF72
	.byte	0xc
	.value	0x2b4
	.byte	0x25
	.long	0x3fe
	.uleb128 0x28
	.string	"c"
	.byte	0xc
	.value	0x2b5
	.byte	0x8
	.long	0x113
	.byte	0
	.uleb128 0xa
	.long	.LASF81
	.byte	0xc
	.value	0x289
	.long	0x6cf
	.uleb128 0x3
	.string	"v"
	.byte	0xc
	.value	0x289
	.byte	0x19
	.long	0x3fe
	.uleb128 0x29
	.long	.LASF82
	.byte	0xc
	.value	0x28a
	.byte	0x9
	.long	0xe9
	.byte	0
	.uleb128 0xa
	.long	.LASF83
	.byte	0xc
	.value	0x164
	.long	0x6ff
	.uleb128 0x3
	.string	"v"
	.byte	0xc
	.value	0x164
	.byte	0x15
	.long	0x3fe
	.uleb128 0x3
	.string	"s"
	.byte	0xc
	.value	0x164
	.byte	0x1e
	.long	0xe9
	.uleb128 0xb
	.long	.LASF72
	.byte	0xc
	.value	0x164
	.byte	0x26
	.long	0x3fe
	.byte	0
	.uleb128 0xa
	.long	.LASF84
	.byte	0xc
	.value	0x137
	.long	0x72f
	.uleb128 0x3
	.string	"a"
	.byte	0xc
	.value	0x137
	.byte	0x13
	.long	0x3fe
	.uleb128 0x3
	.string	"b"
	.byte	0xc
	.value	0x137
	.byte	0x1b
	.long	0x3fe
	.uleb128 0xb
	.long	.LASF72
	.byte	0xc
	.value	0x137
	.byte	0x23
	.long	0x3fe
	.byte	0
	.uleb128 0xa
	.long	.LASF85
	.byte	0xc
	.value	0x119
	.long	0x75f
	.uleb128 0x3
	.string	"a"
	.byte	0xc
	.value	0x119
	.byte	0x13
	.long	0x3fe
	.uleb128 0x3
	.string	"b"
	.byte	0xc
	.value	0x119
	.byte	0x1b
	.long	0x3fe
	.uleb128 0xb
	.long	.LASF72
	.byte	0xc
	.value	0x119
	.byte	0x23
	.long	0x3fe
	.byte	0
	.uleb128 0x14
	.long	.LASF86
	.byte	0xe1
	.long	0xe9
	.long	0x778
	.uleb128 0x6
	.string	"v"
	.byte	0xc
	.byte	0xe1
	.byte	0x14
	.long	0x3fe
	.byte	0
	.uleb128 0x14
	.long	.LASF87
	.byte	0xd3
	.long	0xe9
	.long	0x791
	.uleb128 0x6
	.string	"v"
	.byte	0xc
	.byte	0xd3
	.byte	0x15
	.long	0x3fe
	.byte	0
	.uleb128 0x14
	.long	.LASF88
	.byte	0xc2
	.long	0xe9
	.long	0x7b4
	.uleb128 0x6
	.string	"a"
	.byte	0xc
	.byte	0xc2
	.byte	0x13
	.long	0x3fe
	.uleb128 0x6
	.string	"b"
	.byte	0xc
	.byte	0xc2
	.byte	0x1b
	.long	0x3fe
	.byte	0
	.uleb128 0x12
	.long	.LASF89
	.byte	0xc
	.byte	0x9c
	.long	0x7d6
	.uleb128 0x6
	.string	"a"
	.byte	0xc
	.byte	0x9c
	.byte	0x14
	.long	0x3fe
	.uleb128 0xf
	.long	.LASF72
	.byte	0xc
	.byte	0x9c
	.byte	0x1c
	.long	0x3fe
	.byte	0
	.uleb128 0x2a
	.long	.LASF96
	.long	.LASF96
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
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 35
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0x21
	.sleb128 8
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 33
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0x21
	.sleb128 16
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x18
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
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
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
.LVUS0:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 .LVU25
	.uleb128 .LVU25
	.uleb128 .LVU28
	.uleb128 .LVU28
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST0:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 .LVL6-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL6-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL10-.Ltext0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL10-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.Ltext0
	.uleb128 .LFE1298-.Ltext0
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU23
	.uleb128 .LVU23
	.uleb128 .LVU25
	.uleb128 .LVU25
	.uleb128 .LVU27
	.uleb128 .LVU27
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST1:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 .LVL5-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL5-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL9-.Ltext0
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL9-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.Ltext0
	.uleb128 .LFE1298-.Ltext0
	.uleb128 0x1
	.byte	0x56
	.byte	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU25
	.uleb128 .LVU25
	.uleb128 .LVU26
	.uleb128 .LVU26
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST2:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL2-1-.Ltext0
	.uleb128 .LVL4-.Ltext0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL4-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL8-.Ltext0
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL8-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL11-.Ltext0
	.uleb128 .LFE1298-.Ltext0
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS3:
	.uleb128 .LVU6
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 .LVU25
	.uleb128 .LVU29
	.uleb128 0
.LLST3:
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL1-.Ltext0
	.uleb128 0x42
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x20
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x16
	.byte	0x93
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x20
	.byte	0x4
	.uleb128 .LVL11-.Ltext0
	.uleb128 .LFE1298-.Ltext0
	.uleb128 0x16
	.byte	0x93
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x20
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF55:
	.string	"stride"
.LASF83:
	.string	"glm_vec3_scale"
.LASF39:
	.string	"bytes_per_pixel"
.LASF44:
	.string	"r_bits"
.LASF48:
	.string	"r_shift"
.LASF95:
	.string	"view"
.LASF60:
	.string	"is_portal"
.LASF78:
	.string	"center"
.LASF57:
	.string	"pixels"
.LASF58:
	.string	"dsr_Wall"
.LASF30:
	.string	"aspect_ratio"
.LASF76:
	.string	"target"
.LASF86:
	.string	"glm_vec3_norm"
.LASF7:
	.string	"short int"
.LASF59:
	.string	"vertices"
.LASF43:
	.string	"a_mask"
.LASF69:
	.string	"surface"
.LASF85:
	.string	"glm_vec3_add"
.LASF94:
	.string	"__PRETTY_FUNCTION__"
.LASF91:
	.string	"hog_ProjType"
.LASF34:
	.string	"direction"
.LASF18:
	.string	"long long int"
.LASF10:
	.string	"__uint32_t"
.LASF90:
	.string	"GNU C23 14.1.1 20240522 -masm=intel -mtune=generic -march=x86-64 -g -O2 -std=gnu23 -fPIC"
.LASF82:
	.string	"norm"
.LASF66:
	.string	"walls"
.LASF15:
	.string	"uint8_t"
.LASF93:
	.string	"dsr_render"
.LASF65:
	.string	"dsr_Scene"
.LASF53:
	.string	"width"
.LASF26:
	.string	"mat4"
.LASF21:
	.string	"float"
.LASF81:
	.string	"glm_vec3_normalize"
.LASF67:
	.string	"sqrtf"
.LASF13:
	.string	"char"
.LASF11:
	.string	"long int"
.LASF77:
	.string	"glm_lookat_rh"
.LASF8:
	.string	"__uint8_t"
.LASF2:
	.string	"unsigned char"
.LASF75:
	.string	"proj_plane_size"
.LASF31:
	.string	"near_clipping_plane"
.LASF73:
	.string	"glm_look"
.LASF56:
	.string	"pixel_format"
.LASF19:
	.string	"long double"
.LASF28:
	.string	"HOG_PERSPECTIVE_PROJECTION"
.LASF35:
	.string	"proj_type"
.LASF40:
	.string	"r_mask"
.LASF6:
	.string	"signed char"
.LASF64:
	.string	"capacity"
.LASF20:
	.string	"long long unsigned int"
.LASF71:
	.string	"camera"
.LASF16:
	.string	"uint32_t"
.LASF42:
	.string	"b_mask"
.LASF54:
	.string	"height"
.LASF4:
	.string	"unsigned int"
.LASF49:
	.string	"g_shift"
.LASF84:
	.string	"glm_vec3_sub"
.LASF80:
	.string	"glm_vec3_cross"
.LASF45:
	.string	"g_bits"
.LASF3:
	.string	"short unsigned int"
.LASF70:
	.string	"scene"
.LASF51:
	.string	"a_shift"
.LASF47:
	.string	"a_bits"
.LASF14:
	.string	"int32_t"
.LASF92:
	.string	"dsr_render_walls"
.LASF52:
	.string	"dsr_Surface"
.LASF61:
	.string	"_Bool"
.LASF23:
	.string	"vec2"
.LASF24:
	.string	"vec3"
.LASF25:
	.string	"vec4"
.LASF12:
	.string	"__uint64_t"
.LASF27:
	.string	"HOG_PROJECTION_NONE"
.LASF32:
	.string	"far_clipping_plane"
.LASF5:
	.string	"long unsigned int"
.LASF89:
	.string	"glm_vec3_copy"
.LASF22:
	.string	"double"
.LASF38:
	.string	"bits_per_pixel"
.LASF88:
	.string	"glm_vec3_dot"
.LASF41:
	.string	"g_mask"
.LASF62:
	.string	"items"
.LASF72:
	.string	"dest"
.LASF37:
	.string	"dsr_PixelFormat"
.LASF63:
	.string	"count"
.LASF9:
	.string	"__int32_t"
.LASF79:
	.string	"glm_vec3_crossn"
.LASF87:
	.string	"glm_vec3_norm2"
.LASF50:
	.string	"b_shift"
.LASF29:
	.string	"HOG_ORTHOGRAPHIC_PROJECTION"
.LASF46:
	.string	"b_bits"
.LASF33:
	.string	"position"
.LASF96:
	.string	"__stack_chk_fail"
.LASF68:
	.string	"__assert_fail"
.LASF17:
	.string	"uint64_t"
.LASF74:
	.string	"glm_look_rh"
.LASF36:
	.string	"hog_Camera"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer"
.LASF0:
	.string	"/home/randompigyt/Hogxel-Engine/src/doom-style-renderer/renderer.c"
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
