	.file	"simplesync.c"
	.text
.Ltext0:
	.file 0 "/home/chris/ECE/6th_Semester/OS/os-lab-exer3/sync" "simplesync.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LVL0:
.LFB52:
	.file 1 "simplesync.c"
	.loc 1 47 1 view -0
	.cfi_startproc
	.loc 1 47 1 is_stmt 0 view .LVU1
	endbr64
	.loc 1 48 2 is_stmt 1 view .LVU2
	.loc 1 49 2 view .LVU3
	.loc 1 47 1 is_stmt 0 view .LVU4
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 47 1 view .LVU5
	movq	%rdi, %rbx
.LVL1:
	.loc 1 50 2 is_stmt 1 view .LVU6
.LBB12:
.LBI12:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 103 1 view .LVU7
.LBB13:
	.loc 2 105 3 view .LVU8
	.loc 2 105 10 is_stmt 0 view .LVU9
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 2 105 10 view .LVU10
	movl	$10000000, %ecx
	leaq	.LC0(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.LVL3:
	.loc 2 105 10 view .LVU11
.LBE13:
.LBE12:
	.loc 1 51 2 is_stmt 1 view .LVU12
	.loc 1 51 16 view .LVU13
.LBB15:
.LBB14:
	.loc 2 105 10 is_stmt 0 view .LVU14
	movl	$10000000, %eax
.LVL4:
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 2 105 10 view .LVU15
.LBE14:
.LBE15:
	.loc 1 54 3 is_stmt 1 view .LVU16
	.loc 1 59 4 view .LVU17
	lock addl	$1, (%rbx)
	.loc 1 77 5 view .LVU18
	.loc 1 51 22 view .LVU19
.LVL5:
	.loc 1 51 16 view .LVU20
	subl	$1, %eax
.LVL6:
	.loc 1 51 16 is_stmt 0 view .LVU21
	jne	.L2
	.loc 1 81 2 is_stmt 1 view .LVU22
.LVL7:
.LBB16:
.LBI16:
	.loc 2 103 1 view .LVU23
.LBB17:
	.loc 2 105 3 view .LVU24
	.loc 2 105 10 is_stmt 0 view .LVU25
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
.LVL8:
	.loc 2 105 10 view .LVU26
.LBE17:
.LBE16:
	.loc 1 83 2 is_stmt 1 view .LVU27
	.loc 1 84 1 is_stmt 0 view .LVU28
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL9:
	.loc 1 84 1 view .LVU29
	ret
	.cfi_endproc
.LFE52:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL10:
.LFB53:
	.loc 1 87 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 87 1 is_stmt 0 view .LVU31
	endbr64
	.loc 1 88 2 is_stmt 1 view .LVU32
	.loc 1 89 2 view .LVU33
	.loc 1 87 1 is_stmt 0 view .LVU34
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 87 1 view .LVU35
	movq	%rdi, %rbx
.LVL11:
	.loc 1 90 2 is_stmt 1 view .LVU36
.LBB18:
.LBI18:
	.loc 2 103 1 view .LVU37
.LBB19:
	.loc 2 105 3 view .LVU38
	.loc 2 105 10 is_stmt 0 view .LVU39
	movq	stderr(%rip), %rdi
.LVL12:
	.loc 2 105 10 view .LVU40
	movl	$10000000, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.LVL13:
	.loc 2 105 10 view .LVU41
.LBE19:
.LBE18:
	.loc 1 91 2 is_stmt 1 view .LVU42
	.loc 1 91 16 view .LVU43
.LBB21:
.LBB20:
	.loc 2 105 10 is_stmt 0 view .LVU44
	movl	$10000000, %eax
.LVL14:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 2 105 10 view .LVU45
.LBE20:
.LBE21:
	.loc 1 94 3 is_stmt 1 view .LVU46
	.loc 1 99 4 view .LVU47
	lock subl	$1, (%rbx)
	.loc 1 117 5 view .LVU48
	.loc 1 91 22 view .LVU49
.LVL15:
	.loc 1 91 16 view .LVU50
	subl	$1, %eax
.LVL16:
	.loc 1 91 16 is_stmt 0 view .LVU51
	jne	.L7
	.loc 1 121 2 is_stmt 1 view .LVU52
.LVL17:
.LBB22:
.LBI22:
	.loc 2 103 1 view .LVU53
.LBB23:
	.loc 2 105 3 view .LVU54
	.loc 2 105 10 is_stmt 0 view .LVU55
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL18:
	.loc 2 105 10 view .LVU56
.LBE23:
.LBE22:
	.loc 1 122 2 is_stmt 1 view .LVU57
	.loc 1 123 1 is_stmt 0 view .LVU58
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL19:
	.loc 1 123 1 view .LVU59
	ret
	.cfi_endproc
.LFE53:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"NOT "
.LC6:
	.string	"pthread_create"
.LC7:
	.string	"pthread_join"
.LC8:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL20:
.LFB54:
	.loc 1 126 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 126 1 is_stmt 0 view .LVU61
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 137 8 view .LVU62
	xorl	%esi, %esi
.LVL21:
	.loc 1 137 8 view .LVU63
	leaq	increase_fn(%rip), %rdx
	.loc 1 126 1 view .LVU64
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 126 1 view .LVU65
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 127 2 is_stmt 1 view .LVU66
	.loc 1 128 2 view .LVU67
	.loc 1 133 2 view .LVU68
	.loc 1 137 8 is_stmt 0 view .LVU69
	leaq	4(%rsp), %r12
	leaq	8(%rsp), %rdi
.LVL22:
	.loc 1 133 6 view .LVU70
	movl	$0, 4(%rsp)
	.loc 1 137 2 is_stmt 1 view .LVU71
	.loc 1 137 8 is_stmt 0 view .LVU72
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL23:
	.loc 1 138 2 is_stmt 1 view .LVU73
	.loc 1 138 5 is_stmt 0 view .LVU74
	testl	%eax, %eax
	jne	.L26
	.loc 1 143 2 is_stmt 1 view .LVU75
	.loc 1 143 8 is_stmt 0 view .LVU76
	leaq	16(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL24:
	.loc 1 143 8 view .LVU77
	movl	%eax, %ebx
.LVL25:
	.loc 1 144 2 is_stmt 1 view .LVU78
	.loc 1 144 5 is_stmt 0 view .LVU79
	testl	%eax, %eax
	jne	.L25
	.loc 1 153 2 is_stmt 1 view .LVU80
	.loc 1 153 8 is_stmt 0 view .LVU81
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL26:
	.loc 1 153 8 view .LVU82
	movl	%eax, %ebx
.LVL27:
	.loc 1 154 2 is_stmt 1 view .LVU83
	.loc 1 154 5 is_stmt 0 view .LVU84
	testl	%eax, %eax
	jne	.L27
.LVL28:
.L13:
	.loc 1 155 3 is_stmt 1 discriminator 1 view .LVU85
	.loc 1 156 2 discriminator 1 view .LVU86
	.loc 1 156 8 is_stmt 0 discriminator 1 view .LVU87
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL29:
	movl	%eax, %ebx
.LVL30:
	.loc 1 157 2 is_stmt 1 discriminator 1 view .LVU88
	.loc 1 157 5 is_stmt 0 discriminator 1 view .LVU89
	testl	%eax, %eax
	jne	.L28
.LVL31:
.L14:
	.loc 1 158 3 is_stmt 1 discriminator 1 view .LVU90
	.loc 1 163 2 discriminator 1 view .LVU91
	.loc 1 163 12 is_stmt 0 discriminator 1 view .LVU92
	movl	4(%rsp), %ecx
	xorl	%r12d, %r12d
	.loc 1 165 2 discriminator 1 view .LVU93
	leaq	.LC5(%rip), %rax
	leaq	.LC4(%rip), %rdx
.LBB24:
.LBB25:
	.loc 2 112 10 discriminator 1 view .LVU94
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
.LBE25:
.LBE24:
	.loc 1 163 12 discriminator 1 view .LVU95
	testl	%ecx, %ecx
	.loc 1 165 2 discriminator 1 view .LVU96
	cmovne	%rax, %rdx
	.loc 1 163 12 discriminator 1 view .LVU97
	sete	%r12b
.LVL32:
	.loc 1 165 2 is_stmt 1 discriminator 1 view .LVU98
.LBB27:
.LBI24:
	.loc 2 110 1 discriminator 1 view .LVU99
.LBB26:
	.loc 2 112 3 discriminator 1 view .LVU100
	.loc 2 112 10 is_stmt 0 discriminator 1 view .LVU101
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL33:
	.loc 2 112 10 discriminator 1 view .LVU102
.LBE26:
.LBE27:
	.loc 1 166 2 is_stmt 1 discriminator 1 view .LVU103
	.loc 1 171 4 discriminator 1 view .LVU104
	.loc 1 174 2 discriminator 1 view .LVU105
	.loc 1 175 1 is_stmt 0 discriminator 1 view .LVU106
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L29
	.loc 1 175 1 view .LVU107
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
.LVL34:
	.loc 1 175 1 view .LVU108
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL35:
	.loc 1 175 1 view .LVU109
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL36:
.L27:
	.cfi_restore_state
	.loc 1 155 3 is_stmt 1 view .LVU110
	.loc 1 155 3 view .LVU111
	call	__errno_location@PLT
.LVL37:
	.loc 1 155 3 is_stmt 0 view .LVU112
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 155 3 is_stmt 1 view .LVU113
	call	perror@PLT
.LVL38:
	jmp	.L13
.LVL39:
.L28:
	.loc 1 158 3 view .LVU114
	.loc 1 158 3 view .LVU115
	call	__errno_location@PLT
.LVL40:
	.loc 1 158 3 is_stmt 0 view .LVU116
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 158 3 is_stmt 1 view .LVU117
	call	perror@PLT
.LVL41:
	jmp	.L14
.LVL42:
.L26:
	.loc 1 158 3 is_stmt 0 view .LVU118
	movl	%eax, %ebx
	.loc 1 140 3 is_stmt 1 view .LVU119
	.loc 1 140 3 view .LVU120
.LVL43:
.L25:
	.loc 1 146 3 view .LVU121
	.loc 1 146 3 view .LVU122
	call	__errno_location@PLT
.LVL44:
	leaq	.LC6(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 146 3 view .LVU123
	call	perror@PLT
.LVL45:
	.loc 1 146 3 view .LVU124
	.loc 1 147 3 view .LVU125
	movl	$1, %edi
	call	exit@PLT
.LVL46:
.L29:
	.loc 1 175 1 is_stmt 0 view .LVU126
	call	__stack_chk_fail@PLT
.LVL47:
	.cfi_endproc
.LFE54:
	.size	main, .-main
	.globl	mutex
	.bss
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 10 "/usr/include/stdio.h"
	.file 11 "/usr/include/pthread.h"
	.file 12 "/usr/include/stdlib.h"
	.file 13 "/usr/include/errno.h"
	.file 14 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9bb
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x21
	.long	.LASF93
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL18
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x6
	.long	.LASF9
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x36
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x22
	.byte	0x8
	.uleb128 0xa
	.long	0x44
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x23
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x24
	.long	0x67
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x6
	.long	.LASF10
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x73
	.uleb128 0x6
	.long	.LASF11
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x73
	.uleb128 0x3
	.long	0x97
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x1a
	.long	0x97
	.uleb128 0x14
	.long	.LASF48
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.long	0x22a
	.uleb128 0x1
	.long	.LASF13
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x67
	.byte	0
	.uleb128 0x1
	.long	.LASF14
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0x92
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0x92
	.byte	0x10
	.uleb128 0x1
	.long	.LASF16
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0x92
	.byte	0x18
	.uleb128 0x1
	.long	.LASF17
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0x92
	.byte	0x20
	.uleb128 0x1
	.long	.LASF18
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0x92
	.byte	0x28
	.uleb128 0x1
	.long	.LASF19
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0x92
	.byte	0x30
	.uleb128 0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0x92
	.byte	0x38
	.uleb128 0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0x92
	.byte	0x40
	.uleb128 0x1
	.long	.LASF22
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0x92
	.byte	0x48
	.uleb128 0x1
	.long	.LASF23
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0x92
	.byte	0x50
	.uleb128 0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0x92
	.byte	0x58
	.uleb128 0x1
	.long	.LASF25
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x243
	.byte	0x60
	.uleb128 0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x248
	.byte	0x68
	.uleb128 0x1
	.long	.LASF27
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x67
	.byte	0x70
	.uleb128 0x1
	.long	.LASF28
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x67
	.byte	0x74
	.uleb128 0x1
	.long	.LASF29
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x7a
	.byte	0x78
	.uleb128 0x1
	.long	.LASF30
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x52
	.byte	0x80
	.uleb128 0x1
	.long	.LASF31
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x59
	.byte	0x82
	.uleb128 0x1
	.long	.LASF32
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x24d
	.byte	0x83
	.uleb128 0x1
	.long	.LASF33
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x25d
	.byte	0x88
	.uleb128 0x1
	.long	.LASF34
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0x86
	.byte	0x90
	.uleb128 0x1
	.long	.LASF35
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x267
	.byte	0x98
	.uleb128 0x1
	.long	.LASF36
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x271
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF37
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x248
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF38
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0x44
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0x2a
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF40
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x67
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x276
	.byte	0xc4
	.byte	0
	.uleb128 0x6
	.long	.LASF42
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0xa3
	.uleb128 0x25
	.long	.LASF94
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0x15
	.long	.LASF43
	.uleb128 0x3
	.long	0x23e
	.uleb128 0x3
	.long	0xa3
	.uleb128 0xe
	.long	0x97
	.long	0x25d
	.uleb128 0xf
	.long	0x36
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x236
	.uleb128 0x15
	.long	.LASF44
	.uleb128 0x3
	.long	0x262
	.uleb128 0x15
	.long	.LASF45
	.uleb128 0x3
	.long	0x26c
	.uleb128 0xe
	.long	0x97
	.long	0x286
	.uleb128 0xf
	.long	0x36
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x22a
	.uleb128 0xa
	.long	0x286
	.uleb128 0x26
	.long	.LASF76
	.byte	0xa
	.byte	0x91
	.byte	0xe
	.long	0x286
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF47
	.uleb128 0x14
	.long	.LASF49
	.byte	0x10
	.byte	0x7
	.byte	0x33
	.byte	0x10
	.long	0x2d2
	.uleb128 0x1
	.long	.LASF50
	.byte	0x7
	.byte	0x35
	.byte	0x23
	.long	0x2d2
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0x7
	.byte	0x36
	.byte	0x23
	.long	0x2d2
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	0x2aa
	.uleb128 0x6
	.long	.LASF52
	.byte	0x7
	.byte	0x37
	.byte	0x3
	.long	0x2aa
	.uleb128 0x14
	.long	.LASF53
	.byte	0x28
	.byte	0x8
	.byte	0x16
	.byte	0x8
	.long	0x359
	.uleb128 0x1
	.long	.LASF54
	.byte	0x8
	.byte	0x18
	.byte	0x7
	.long	0x67
	.byte	0
	.uleb128 0x1
	.long	.LASF55
	.byte	0x8
	.byte	0x19
	.byte	0x10
	.long	0x3d
	.byte	0x4
	.uleb128 0x1
	.long	.LASF56
	.byte	0x8
	.byte	0x1a
	.byte	0x7
	.long	0x67
	.byte	0x8
	.uleb128 0x1
	.long	.LASF57
	.byte	0x8
	.byte	0x1c
	.byte	0x10
	.long	0x3d
	.byte	0xc
	.uleb128 0x1
	.long	.LASF58
	.byte	0x8
	.byte	0x20
	.byte	0x7
	.long	0x67
	.byte	0x10
	.uleb128 0x1
	.long	.LASF59
	.byte	0x8
	.byte	0x22
	.byte	0x9
	.long	0x60
	.byte	0x14
	.uleb128 0x1
	.long	.LASF60
	.byte	0x8
	.byte	0x23
	.byte	0x9
	.long	0x60
	.byte	0x16
	.uleb128 0x1
	.long	.LASF61
	.byte	0x8
	.byte	0x24
	.byte	0x14
	.long	0x2d7
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.long	.LASF62
	.byte	0x9
	.byte	0x1b
	.byte	0x1b
	.long	0x36
	.uleb128 0x27
	.long	.LASF65
	.byte	0x38
	.byte	0x9
	.byte	0x38
	.byte	0x7
	.long	0x389
	.uleb128 0xb
	.long	.LASF63
	.byte	0x3a
	.byte	0x8
	.long	0x389
	.uleb128 0xb
	.long	.LASF64
	.byte	0x3b
	.byte	0xc
	.long	0x73
	.byte	0
	.uleb128 0xe
	.long	0x97
	.long	0x399
	.uleb128 0xf
	.long	0x36
	.byte	0x37
	.byte	0
	.uleb128 0x6
	.long	.LASF65
	.byte	0x9
	.byte	0x3e
	.byte	0x1e
	.long	0x365
	.uleb128 0x1a
	.long	0x399
	.uleb128 0x28
	.byte	0x28
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0x3d5
	.uleb128 0xb
	.long	.LASF66
	.byte	0x45
	.byte	0x1c
	.long	0x2e3
	.uleb128 0xb
	.long	.LASF63
	.byte	0x46
	.byte	0x8
	.long	0x3d5
	.uleb128 0xb
	.long	.LASF64
	.byte	0x47
	.byte	0xc
	.long	0x73
	.byte	0
	.uleb128 0xe
	.long	0x97
	.long	0x3e5
	.uleb128 0xf
	.long	0x36
	.byte	0x27
	.byte	0
	.uleb128 0x6
	.long	.LASF67
	.byte	0x9
	.byte	0x48
	.byte	0x3
	.long	0x3aa
	.uleb128 0x3
	.long	0x92
	.uleb128 0x3
	.long	0x9e
	.uleb128 0xa
	.long	0x3f6
	.uleb128 0x29
	.byte	0x7
	.byte	0x4
	.long	0x3d
	.byte	0xb
	.byte	0x30
	.byte	0x1
	.long	0x43f
	.uleb128 0x7
	.long	.LASF68
	.byte	0
	.uleb128 0x7
	.long	.LASF69
	.byte	0x1
	.uleb128 0x7
	.long	.LASF70
	.byte	0x2
	.uleb128 0x7
	.long	.LASF71
	.byte	0x3
	.uleb128 0x7
	.long	.LASF72
	.byte	0
	.uleb128 0x7
	.long	.LASF73
	.byte	0x1
	.uleb128 0x7
	.long	.LASF74
	.byte	0x2
	.uleb128 0x7
	.long	.LASF75
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF77
	.byte	0x1
	.byte	0x2b
	.byte	0x11
	.long	0x3e5
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x10
	.long	.LASF78
	.byte	0x2
	.byte	0x5f
	.long	0x67
	.long	0x470
	.uleb128 0x4
	.long	0x67
	.uleb128 0x4
	.long	0x3f6
	.uleb128 0x11
	.byte	0
	.uleb128 0x10
	.long	.LASF79
	.byte	0xb
	.byte	0xdb
	.long	0x67
	.long	0x48a
	.uleb128 0x4
	.long	0x359
	.uleb128 0x4
	.long	0x48a
	.byte	0
	.uleb128 0x3
	.long	0x44
	.uleb128 0x2b
	.long	.LASF80
	.byte	0xc
	.value	0x270
	.byte	0xd
	.long	0x4a2
	.uleb128 0x4
	.long	0x67
	.byte	0
	.uleb128 0x2c
	.long	.LASF95
	.byte	0xa
	.value	0x324
	.byte	0xd
	.long	0x4b5
	.uleb128 0x4
	.long	0x3f6
	.byte	0
	.uleb128 0x2d
	.long	.LASF96
	.byte	0xd
	.byte	0x25
	.byte	0xd
	.long	0x4c1
	.uleb128 0x3
	.long	0x67
	.uleb128 0x10
	.long	.LASF81
	.byte	0xb
	.byte	0xca
	.long	0x67
	.long	0x4ea
	.uleb128 0x4
	.long	0x4ef
	.uleb128 0x4
	.long	0x4f9
	.uleb128 0x4
	.long	0x4fe
	.uleb128 0x4
	.long	0x46
	.byte	0
	.uleb128 0x3
	.long	0x359
	.uleb128 0xa
	.long	0x4ea
	.uleb128 0x3
	.long	0x3a5
	.uleb128 0xa
	.long	0x4f4
	.uleb128 0x3
	.long	0x503
	.uleb128 0x2e
	.long	0x44
	.long	0x512
	.uleb128 0x4
	.long	0x44
	.byte	0
	.uleb128 0x10
	.long	.LASF82
	.byte	0x2
	.byte	0x5d
	.long	0x67
	.long	0x532
	.uleb128 0x4
	.long	0x28b
	.uleb128 0x4
	.long	0x67
	.uleb128 0x4
	.long	0x3fb
	.uleb128 0x11
	.byte	0
	.uleb128 0x16
	.long	.LASF85
	.byte	0x7d
	.byte	0x5
	.long	0x67
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x742
	.uleb128 0x1b
	.long	.LASF83
	.byte	0x7d
	.byte	0xe
	.long	0x67
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x1b
	.long	.LASF84
	.byte	0x7d
	.byte	0x1a
	.long	0x3f1
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x17
	.string	"val"
	.byte	0x7f
	.byte	0x6
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x9
	.string	"ret"
	.byte	0x7f
	.byte	0xb
	.long	0x67
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x9
	.string	"ok"
	.byte	0x7f
	.byte	0x10
	.long	0x67
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x17
	.string	"t1"
	.byte	0x80
	.byte	0xc
	.long	0x359
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.string	"t2"
	.byte	0x80
	.byte	0x10
	.long	0x359
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.long	0x969
	.quad	.LBI24
	.byte	.LVU99
	.long	.LLRL16
	.byte	0xa5
	.long	0x60b
	.uleb128 0xc
	.long	0x977
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0xd
	.quad	.LVL33
	.long	0x455
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.uleb128 0x8
	.quad	.LVL23
	.long	0x4c6
	.long	0x63b
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x8
	.quad	.LVL24
	.long	0x4c6
	.long	0x66b
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x8
	.quad	.LVL26
	.long	0x470
	.long	0x682
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x8
	.quad	.LVL29
	.long	0x470
	.long	0x699
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.quad	.LVL37
	.long	0x4b5
	.uleb128 0x8
	.quad	.LVL38
	.long	0x4a2
	.long	0x6c5
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x12
	.quad	.LVL40
	.long	0x4b5
	.uleb128 0x8
	.quad	.LVL41
	.long	0x4a2
	.long	0x6f1
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x12
	.quad	.LVL44
	.long	0x4b5
	.uleb128 0x8
	.quad	.LVL45
	.long	0x4a2
	.long	0x71d
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x8
	.quad	.LVL46
	.long	0x48f
	.long	0x734
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x12
	.quad	.LVL47
	.long	0x9aa
	.byte	0
	.uleb128 0x16
	.long	.LASF86
	.byte	0x56
	.byte	0x7
	.long	0x44
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x853
	.uleb128 0x1c
	.string	"arg"
	.byte	0x56
	.long	0x44
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x9
	.string	"i"
	.byte	0x58
	.byte	0x6
	.long	0x67
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x9
	.string	"ip"
	.byte	0x59
	.byte	0x10
	.long	0x853
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x1d
	.long	0x7a8
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x69
	.long	0x67
	.byte	0
	.uleb128 0x18
	.long	0x984
	.quad	.LBI18
	.byte	.LVU37
	.long	.LLRL9
	.byte	0x5a
	.long	0x7fb
	.uleb128 0xc
	.long	0x99d
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x13
	.long	0x992
	.uleb128 0xd
	.quad	.LVL13
	.long	0x512
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x984
	.quad	.LBI22
	.byte	.LVU53
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.byte	0x79
	.uleb128 0xc
	.long	0x99d
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x13
	.long	0x992
	.uleb128 0xd
	.quad	.LVL18
	.long	0x9b3
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x6e
	.uleb128 0x16
	.long	.LASF87
	.byte	0x2e
	.byte	0x7
	.long	0x44
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x969
	.uleb128 0x1c
	.string	"arg"
	.byte	0x2e
	.long	0x44
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x9
	.string	"i"
	.byte	0x30
	.byte	0x6
	.long	0x67
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x9
	.string	"ip"
	.byte	0x31
	.byte	0x10
	.long	0x853
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1d
	.long	0x8be
	.uleb128 0x1e
	.long	.LASF88
	.byte	0x41
	.long	0x67
	.byte	0
	.uleb128 0x18
	.long	0x984
	.quad	.LBI12
	.byte	.LVU7
	.long	.LLRL3
	.byte	0x32
	.long	0x911
	.uleb128 0xc
	.long	0x99d
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x13
	.long	0x992
	.uleb128 0xd
	.quad	.LVL3
	.long	0x512
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x984
	.quad	.LBI16
	.byte	.LVU23
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.byte	0x51
	.uleb128 0xc
	.long	0x99d
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x13
	.long	0x992
	.uleb128 0xd
	.quad	.LVL8
	.long	0x9b3
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF89
	.byte	0x6e
	.long	0x67
	.long	0x984
	.uleb128 0x19
	.long	.LASF91
	.byte	0x6e
	.byte	0x20
	.long	0x3fb
	.uleb128 0x11
	.byte	0
	.uleb128 0x20
	.long	.LASF90
	.byte	0x67
	.long	0x67
	.long	0x9aa
	.uleb128 0x19
	.long	.LASF92
	.byte	0x67
	.byte	0x1b
	.long	0x28b
	.uleb128 0x19
	.long	.LASF91
	.byte	0x67
	.byte	0x3c
	.long	0x3fb
	.uleb128 0x11
	.byte	0
	.uleb128 0x2f
	.long	.LASF97
	.long	.LASF97
	.uleb128 0x30
	.long	.LASF98
	.long	.LASF99
	.byte	0xe
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xa
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 25
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x21
	.sleb128 2
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
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
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
	.uleb128 0x24
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x17
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x17
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
	.uleb128 0x29
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x2a
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS12:
	.uleb128 0
	.uleb128 .LVU70
	.uleb128 .LVU70
	.uleb128 0
.LLST12:
	.byte	0x6
	.quad	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL22-.LVL20
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL22-.LVL20
	.uleb128 .LFE54-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS13:
	.uleb128 0
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 0
.LLST13:
	.byte	0x6
	.quad	.LVL20
	.byte	0x4
	.uleb128 .LVL20-.LVL20
	.uleb128 .LVL21-.LVL20
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL21-.LVL20
	.uleb128 .LFE54-.LVL20
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS14:
	.uleb128 .LVU73
	.uleb128 .LVU77
	.uleb128 .LVU78
	.uleb128 .LVU82
	.uleb128 .LVU82
	.uleb128 .LVU83
	.uleb128 .LVU83
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU109
	.uleb128 .LVU110
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU116
	.uleb128 .LVU116
	.uleb128 .LVU118
	.uleb128 .LVU118
	.uleb128 .LVU121
	.uleb128 .LVU126
	.uleb128 0
.LLST14:
	.byte	0x6
	.quad	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-1-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL25-.LVL23
	.uleb128 .LVL26-1-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL26-1-.LVL23
	.uleb128 .LVL27-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL27-.LVL23
	.uleb128 .LVL28-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL28-.LVL23
	.uleb128 .LVL30-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL30-.LVL23
	.uleb128 .LVL31-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL31-.LVL23
	.uleb128 .LVL35-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL36-.LVL23
	.uleb128 .LVL37-1-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-1-.LVL23
	.uleb128 .LVL39-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL39-.LVL23
	.uleb128 .LVL40-1-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-1-.LVL23
	.uleb128 .LVL42-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL42-.LVL23
	.uleb128 .LVL43-.LVL23
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL23
	.uleb128 .LFE54-.LVL23
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS15:
	.uleb128 .LVU98
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU110
	.uleb128 .LVU126
	.uleb128 0
.LLST15:
	.byte	0x6
	.quad	.LVL32
	.byte	0x4
	.uleb128 .LVL32-.LVL32
	.uleb128 .LVL34-.LVL32
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL34-.LVL32
	.uleb128 .LVL36-.LVL32
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL46-.LVL32
	.uleb128 .LFE54-.LVL32
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 .LVU99
	.uleb128 .LVU102
.LLST17:
	.byte	0x8
	.quad	.LVL32
	.uleb128 .LVL33-.LVL32
	.uleb128 0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.byte	0
.LVUS6:
	.uleb128 0
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 0
.LLST6:
	.byte	0x6
	.quad	.LVL10
	.byte	0x4
	.uleb128 .LVL10-.LVL10
	.uleb128 .LVL12-.LVL10
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL12-.LVL10
	.uleb128 .LVL19-.LVL10
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL19-.LVL10
	.uleb128 .LFE53-.LVL10
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS7:
	.uleb128 .LVU43
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU50
	.uleb128 .LVU50
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU56
.LLST7:
	.byte	0x6
	.quad	.LVL13
	.byte	0x4
	.uleb128 .LVL13-.LVL13
	.uleb128 .LVL14-.LVL13
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL13
	.uleb128 .LVL15-.LVL13
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL15-.LVL13
	.uleb128 .LVL16-.LVL13
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL13
	.uleb128 .LVL18-1-.LVL13
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 .LVU36
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 0
.LLST8:
	.byte	0x6
	.quad	.LVL11
	.byte	0x4
	.uleb128 .LVL11-.LVL11
	.uleb128 .LVL12-.LVL11
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL12-.LVL11
	.uleb128 .LVL19-.LVL11
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL19-.LVL11
	.uleb128 .LFE53-.LVL11
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 .LVU37
	.uleb128 .LVU41
.LLST10:
	.byte	0x8
	.quad	.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.byte	0
.LVUS11:
	.uleb128 .LVU53
	.uleb128 .LVU56
.LLST11:
	.byte	0x8
	.quad	.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST0:
	.byte	0x6
	.quad	.LVL0
	.byte	0x4
	.uleb128 .LVL0-.LVL0
	.uleb128 .LVL2-.LVL0
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL2-.LVL0
	.uleb128 .LVL9-.LVL0
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL9-.LVL0
	.uleb128 .LFE52-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS1:
	.uleb128 .LVU13
	.uleb128 .LVU15
	.uleb128 .LVU15
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU21
	.uleb128 .LVU21
	.uleb128 .LVU26
.LLST1:
	.byte	0x6
	.quad	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LVL5-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL3
	.uleb128 .LVL6-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL3
	.uleb128 .LVL8-1-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 .LVU6
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST2:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL9-.LVL1
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL9-.LVL1
	.uleb128 .LFE52-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS4:
	.uleb128 .LVU7
	.uleb128 .LVU11
.LLST4:
	.byte	0x8
	.quad	.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.byte	0
.LVUS5:
	.uleb128 .LVU23
	.uleb128 .LVU26
.LLST5:
	.byte	0x8
	.quad	.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB54
	.quad	.LFE54-.LFB54
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
.LLRL3:
	.byte	0x5
	.quad	.LBB12
	.byte	0x4
	.uleb128 .LBB12-.LBB12
	.uleb128 .LBE12-.LBB12
	.byte	0x4
	.uleb128 .LBB15-.LBB12
	.uleb128 .LBE15-.LBB12
	.byte	0
.LLRL9:
	.byte	0x5
	.quad	.LBB18
	.byte	0x4
	.uleb128 .LBB18-.LBB18
	.uleb128 .LBE18-.LBB18
	.byte	0x4
	.uleb128 .LBB21-.LBB18
	.uleb128 .LBE21-.LBB18
	.byte	0
.LLRL16:
	.byte	0x5
	.quad	.LBB24
	.byte	0x4
	.uleb128 .LBB24-.LBB24
	.uleb128 .LBE24-.LBB24
	.byte	0x4
	.uleb128 .LBB27-.LBB24
	.uleb128 .LBE27-.LBB24
	.byte	0
.LLRL18:
	.byte	0x7
	.quad	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.quad	.LFB54
	.uleb128 .LFE54-.LFB54
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF96:
	.string	"__errno_location"
.LASF78:
	.string	"__printf_chk"
.LASF48:
	.string	"_IO_FILE"
.LASF24:
	.string	"_IO_save_end"
.LASF7:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF34:
	.string	"_offset"
.LASF75:
	.string	"PTHREAD_MUTEX_DEFAULT"
.LASF49:
	.string	"__pthread_internal_list"
.LASF71:
	.string	"PTHREAD_MUTEX_ADAPTIVE_NP"
.LASF18:
	.string	"_IO_write_ptr"
.LASF13:
	.string	"_flags"
.LASF67:
	.string	"pthread_mutex_t"
.LASF55:
	.string	"__count"
.LASF33:
	.string	"_lock"
.LASF88:
	.string	"err_ret"
.LASF64:
	.string	"__align"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF38:
	.string	"_freeres_buf"
.LASF93:
	.string	"GNU C17 11.3.0 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF50:
	.string	"__prev"
.LASF51:
	.string	"__next"
.LASF84:
	.string	"argv"
.LASF42:
	.string	"FILE"
.LASF76:
	.string	"stderr"
.LASF43:
	.string	"_IO_marker"
.LASF46:
	.string	"long long int"
.LASF79:
	.string	"pthread_join"
.LASF81:
	.string	"pthread_create"
.LASF8:
	.string	"long int"
.LASF89:
	.string	"printf"
.LASF30:
	.string	"_cur_column"
.LASF95:
	.string	"perror"
.LASF90:
	.string	"fprintf"
.LASF59:
	.string	"__spins"
.LASF70:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF80:
	.string	"exit"
.LASF29:
	.string	"_old_offset"
.LASF99:
	.string	"__builtin_fwrite"
.LASF4:
	.string	"unsigned char"
.LASF83:
	.string	"argc"
.LASF6:
	.string	"signed char"
.LASF35:
	.string	"_codecvt"
.LASF47:
	.string	"long long unsigned int"
.LASF86:
	.string	"decrease_fn"
.LASF3:
	.string	"unsigned int"
.LASF91:
	.string	"__fmt"
.LASF32:
	.string	"_shortbuf"
.LASF17:
	.string	"_IO_write_base"
.LASF41:
	.string	"_unused2"
.LASF14:
	.string	"_IO_read_ptr"
.LASF77:
	.string	"mutex"
.LASF63:
	.string	"__size"
.LASF21:
	.string	"_IO_buf_end"
.LASF66:
	.string	"__data"
.LASF12:
	.string	"char"
.LASF57:
	.string	"__nusers"
.LASF85:
	.string	"main"
.LASF36:
	.string	"_wide_data"
.LASF37:
	.string	"_freeres_list"
.LASF69:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF39:
	.string	"__pad5"
.LASF54:
	.string	"__lock"
.LASF56:
	.string	"__owner"
.LASF72:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF5:
	.string	"short unsigned int"
.LASF87:
	.string	"increase_fn"
.LASF53:
	.string	"__pthread_mutex_s"
.LASF98:
	.string	"fwrite"
.LASF2:
	.string	"long unsigned int"
.LASF19:
	.string	"_IO_write_end"
.LASF11:
	.string	"__off64_t"
.LASF60:
	.string	"__elision"
.LASF27:
	.string	"_fileno"
.LASF26:
	.string	"_chain"
.LASF52:
	.string	"__pthread_list_t"
.LASF74:
	.string	"PTHREAD_MUTEX_ERRORCHECK"
.LASF40:
	.string	"_mode"
.LASF68:
	.string	"PTHREAD_MUTEX_TIMED_NP"
.LASF10:
	.string	"__off_t"
.LASF23:
	.string	"_IO_backup_base"
.LASF20:
	.string	"_IO_buf_base"
.LASF28:
	.string	"_flags2"
.LASF44:
	.string	"_IO_codecvt"
.LASF16:
	.string	"_IO_read_base"
.LASF92:
	.string	"__stream"
.LASF61:
	.string	"__list"
.LASF31:
	.string	"_vtable_offset"
.LASF45:
	.string	"_IO_wide_data"
.LASF73:
	.string	"PTHREAD_MUTEX_RECURSIVE"
.LASF22:
	.string	"_IO_save_base"
.LASF82:
	.string	"__fprintf_chk"
.LASF97:
	.string	"__stack_chk_fail"
.LASF58:
	.string	"__kind"
.LASF65:
	.string	"pthread_attr_t"
.LASF62:
	.string	"pthread_t"
.LASF94:
	.string	"_IO_lock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"simplesync.c"
.LASF1:
	.string	"/home/chris/ECE/6th_Semester/OS/os-lab-exer3/sync"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
