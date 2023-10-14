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
	.string	"lock problem on increasing"
.LC2:
	.string	"unlock problem on increasing"
.LC3:
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
.LBB14:
.LBB15:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 105 10 view .LVU5
	movl	$10000000, %ecx
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
.LBE15:
.LBE14:
	.loc 1 47 1 view .LVU6
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
.LBB20:
.LBB16:
	.loc 2 105 10 view .LVU7
	movl	$1, %esi
.LBE16:
.LBE20:
.LBB21:
	.loc 1 69 5 view .LVU8
	leaq	.LC1(%rip), %r15
	.loc 1 77 5 view .LVU9
	leaq	.LC2(%rip), %r14
.LBE21:
	.loc 1 47 1 view .LVU10
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	mutex(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
.LVL1:
	.loc 1 50 2 is_stmt 1 view .LVU11
.LBB22:
.LBI14:
	.loc 2 103 1 view .LVU12
.LBB17:
	.loc 2 105 3 view .LVU13
.LBE17:
.LBE22:
	.loc 1 47 1 is_stmt 0 view .LVU14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
.LBB23:
.LBB18:
	.loc 2 105 10 view .LVU15
	movl	$10000000, %ebp
.LBE18:
.LBE23:
	.loc 1 47 1 view .LVU16
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.LBB24:
.LBB19:
	.loc 2 105 10 view .LVU17
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 2 105 10 view .LVU18
	call	__fprintf_chk@PLT
.LVL3:
	.loc 2 105 10 view .LVU19
.LBE19:
.LBE24:
	.loc 1 51 2 is_stmt 1 view .LVU20
	.loc 1 51 16 view .LVU21
	jmp	.L4
.LVL4:
	.p2align 4,,10
	.p2align 3
.L2:
.LBB25:
	.loc 1 69 5 discriminator 1 view .LVU22
	.loc 1 72 4 discriminator 1 view .LVU23
	.loc 1 72 7 is_stmt 0 discriminator 1 view .LVU24
	movl	(%r12), %eax
	.loc 1 74 14 discriminator 1 view .LVU25
	movq	%r13, %rdi
	.loc 1 72 4 discriminator 1 view .LVU26
	addl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 74 4 is_stmt 1 discriminator 1 view .LVU27
	.loc 1 74 14 is_stmt 0 discriminator 1 view .LVU28
	call	pthread_mutex_unlock@PLT
.LVL5:
	movl	%eax, %ebx
.LVL6:
	.loc 1 75 4 is_stmt 1 discriminator 1 view .LVU29
	.loc 1 75 7 is_stmt 0 discriminator 1 view .LVU30
	testl	%eax, %eax
	jne	.L14
	.loc 1 77 5 is_stmt 1 discriminator 1 view .LVU31
.LBE25:
	.loc 1 51 22 discriminator 1 view .LVU32
.LVL7:
	.loc 1 51 16 discriminator 1 view .LVU33
	subl	$1, %ebp
.LVL8:
	.loc 1 51 16 is_stmt 0 discriminator 1 view .LVU34
	je	.L15
.LVL9:
.L4:
	.loc 1 54 3 is_stmt 1 view .LVU35
.LBB26:
	.loc 1 65 4 view .LVU36
	.loc 1 66 4 view .LVU37
	.loc 1 66 14 is_stmt 0 view .LVU38
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL10:
	movl	%eax, %ebx
.LVL11:
	.loc 1 67 4 is_stmt 1 view .LVU39
	.loc 1 67 7 is_stmt 0 view .LVU40
	testl	%eax, %eax
	je	.L2
	.loc 1 69 5 is_stmt 1 view .LVU41
	.loc 1 69 5 view .LVU42
	call	__errno_location@PLT
.LVL12:
	.loc 1 69 5 is_stmt 0 view .LVU43
	movq	%r15, %rdi
	movl	%ebx, (%rax)
	.loc 1 69 5 is_stmt 1 view .LVU44
	call	perror@PLT
.LVL13:
	jmp	.L2
.LVL14:
	.p2align 4,,10
	.p2align 3
.L14:
	.loc 1 77 5 view .LVU45
	.loc 1 77 5 view .LVU46
	call	__errno_location@PLT
.LVL15:
	.loc 1 77 5 is_stmt 0 view .LVU47
	movq	%r14, %rdi
	movl	%ebx, (%rax)
	.loc 1 77 5 is_stmt 1 view .LVU48
	call	perror@PLT
.LVL16:
	.loc 1 77 5 view .LVU49
.LBE26:
	.loc 1 51 22 view .LVU50
	.loc 1 51 16 view .LVU51
	subl	$1, %ebp
.LVL17:
	.loc 1 51 16 is_stmt 0 view .LVU52
	jne	.L4
.LVL18:
.L15:
	.loc 1 81 2 is_stmt 1 view .LVU53
.LBB27:
.LBI27:
	.loc 2 103 1 view .LVU54
.LBB28:
	.loc 2 105 3 view .LVU55
	.loc 2 105 10 is_stmt 0 view .LVU56
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL19:
	.loc 2 105 10 view .LVU57
.LBE28:
.LBE27:
	.loc 1 83 2 is_stmt 1 view .LVU58
	.loc 1 84 1 is_stmt 0 view .LVU59
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL20:
	.loc 1 84 1 view .LVU60
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL21:
	.loc 1 84 1 view .LVU61
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC5:
	.string	"lock problem on decreasing"
.LC6:
	.string	"unlock problem on decreasing"
.LC7:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL22:
.LFB53:
	.loc 1 87 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 87 1 is_stmt 0 view .LVU63
	endbr64
	.loc 1 88 2 is_stmt 1 view .LVU64
	.loc 1 89 2 view .LVU65
	.loc 1 87 1 is_stmt 0 view .LVU66
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
.LBB29:
.LBB30:
	.loc 2 105 10 view .LVU67
	movl	$10000000, %ecx
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
.LBE30:
.LBE29:
	.loc 1 87 1 view .LVU68
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
.LBB35:
.LBB31:
	.loc 2 105 10 view .LVU69
	movl	$1, %esi
.LBE31:
.LBE35:
.LBB36:
	.loc 1 109 5 view .LVU70
	leaq	.LC5(%rip), %r15
	.loc 1 117 5 view .LVU71
	leaq	.LC6(%rip), %r14
.LBE36:
	.loc 1 87 1 view .LVU72
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	mutex(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
.LVL23:
	.loc 1 90 2 is_stmt 1 view .LVU73
.LBB37:
.LBI29:
	.loc 2 103 1 view .LVU74
.LBB32:
	.loc 2 105 3 view .LVU75
.LBE32:
.LBE37:
	.loc 1 87 1 is_stmt 0 view .LVU76
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
.LBB38:
.LBB33:
	.loc 2 105 10 view .LVU77
	movl	$10000000, %ebp
.LBE33:
.LBE38:
	.loc 1 87 1 view .LVU78
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.LBB39:
.LBB34:
	.loc 2 105 10 view .LVU79
	movq	stderr(%rip), %rdi
.LVL24:
	.loc 2 105 10 view .LVU80
	call	__fprintf_chk@PLT
.LVL25:
	.loc 2 105 10 view .LVU81
.LBE34:
.LBE39:
	.loc 1 91 2 is_stmt 1 view .LVU82
	.loc 1 91 16 view .LVU83
	jmp	.L19
.LVL26:
	.p2align 4,,10
	.p2align 3
.L17:
.LBB40:
	.loc 1 109 5 discriminator 1 view .LVU84
	.loc 1 112 4 discriminator 1 view .LVU85
	.loc 1 112 7 is_stmt 0 discriminator 1 view .LVU86
	movl	(%r12), %eax
	.loc 1 114 14 discriminator 1 view .LVU87
	movq	%r13, %rdi
	.loc 1 112 4 discriminator 1 view .LVU88
	subl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 114 4 is_stmt 1 discriminator 1 view .LVU89
	.loc 1 114 14 is_stmt 0 discriminator 1 view .LVU90
	call	pthread_mutex_unlock@PLT
.LVL27:
	movl	%eax, %ebx
.LVL28:
	.loc 1 115 4 is_stmt 1 discriminator 1 view .LVU91
	.loc 1 115 7 is_stmt 0 discriminator 1 view .LVU92
	testl	%eax, %eax
	jne	.L28
	.loc 1 117 5 is_stmt 1 discriminator 1 view .LVU93
.LBE40:
	.loc 1 91 22 discriminator 1 view .LVU94
.LVL29:
	.loc 1 91 16 discriminator 1 view .LVU95
	subl	$1, %ebp
.LVL30:
	.loc 1 91 16 is_stmt 0 discriminator 1 view .LVU96
	je	.L29
.LVL31:
.L19:
	.loc 1 94 3 is_stmt 1 view .LVU97
.LBB41:
	.loc 1 105 4 view .LVU98
	.loc 1 106 4 view .LVU99
	.loc 1 106 14 is_stmt 0 view .LVU100
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL32:
	movl	%eax, %ebx
.LVL33:
	.loc 1 107 4 is_stmt 1 view .LVU101
	.loc 1 107 7 is_stmt 0 view .LVU102
	testl	%eax, %eax
	je	.L17
	.loc 1 109 5 is_stmt 1 view .LVU103
	.loc 1 109 5 view .LVU104
	call	__errno_location@PLT
.LVL34:
	.loc 1 109 5 is_stmt 0 view .LVU105
	movq	%r15, %rdi
	movl	%ebx, (%rax)
	.loc 1 109 5 is_stmt 1 view .LVU106
	call	perror@PLT
.LVL35:
	jmp	.L17
.LVL36:
	.p2align 4,,10
	.p2align 3
.L28:
	.loc 1 117 5 view .LVU107
	.loc 1 117 5 view .LVU108
	call	__errno_location@PLT
.LVL37:
	.loc 1 117 5 is_stmt 0 view .LVU109
	movq	%r14, %rdi
	movl	%ebx, (%rax)
	.loc 1 117 5 is_stmt 1 view .LVU110
	call	perror@PLT
.LVL38:
	.loc 1 117 5 view .LVU111
.LBE41:
	.loc 1 91 22 view .LVU112
	.loc 1 91 16 view .LVU113
	subl	$1, %ebp
.LVL39:
	.loc 1 91 16 is_stmt 0 view .LVU114
	jne	.L19
.LVL40:
.L29:
	.loc 1 121 2 is_stmt 1 view .LVU115
.LBB42:
.LBI42:
	.loc 2 103 1 view .LVU116
.LBB43:
	.loc 2 105 3 view .LVU117
	.loc 2 105 10 is_stmt 0 view .LVU118
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
.LVL41:
	.loc 2 105 10 view .LVU119
.LBE43:
.LBE42:
	.loc 1 122 2 is_stmt 1 view .LVU120
	.loc 1 123 1 is_stmt 0 view .LVU121
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL42:
	.loc 1 123 1 view .LVU122
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL43:
	.loc 1 123 1 view .LVU123
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC8:
	.string	""
.LC9:
	.string	"NOT "
.LC10:
	.string	"pthread_create"
.LC11:
	.string	"pthread_join"
.LC12:
	.string	"%sOK, val = %d.\n"
.LC13:
	.string	"Mutex object not destroyed..\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL44:
.LFB54:
	.loc 1 126 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 126 1 is_stmt 0 view .LVU125
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 137 8 view .LVU126
	xorl	%esi, %esi
.LVL45:
	.loc 1 137 8 view .LVU127
	leaq	increase_fn(%rip), %rdx
	.loc 1 126 1 view .LVU128
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 126 1 view .LVU129
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 127 2 is_stmt 1 view .LVU130
	.loc 1 128 2 view .LVU131
	.loc 1 133 2 view .LVU132
	.loc 1 137 8 is_stmt 0 view .LVU133
	leaq	4(%rsp), %r12
	leaq	8(%rsp), %rdi
.LVL46:
	.loc 1 133 6 view .LVU134
	movl	$0, 4(%rsp)
	.loc 1 137 2 is_stmt 1 view .LVU135
	.loc 1 137 8 is_stmt 0 view .LVU136
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL47:
	.loc 1 138 2 is_stmt 1 view .LVU137
	.loc 1 138 5 is_stmt 0 view .LVU138
	testl	%eax, %eax
	jne	.L50
	.loc 1 143 2 is_stmt 1 view .LVU139
	.loc 1 143 8 is_stmt 0 view .LVU140
	leaq	16(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL48:
	.loc 1 143 8 view .LVU141
	movl	%eax, %ebx
.LVL49:
	.loc 1 144 2 is_stmt 1 view .LVU142
	.loc 1 144 5 is_stmt 0 view .LVU143
	testl	%eax, %eax
	jne	.L49
	.loc 1 153 2 is_stmt 1 view .LVU144
	.loc 1 153 8 is_stmt 0 view .LVU145
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL50:
	.loc 1 153 8 view .LVU146
	movl	%eax, %ebx
.LVL51:
	.loc 1 154 2 is_stmt 1 view .LVU147
	.loc 1 154 5 is_stmt 0 view .LVU148
	testl	%eax, %eax
	jne	.L51
.LVL52:
.L33:
	.loc 1 155 3 is_stmt 1 discriminator 1 view .LVU149
	.loc 1 156 2 discriminator 1 view .LVU150
	.loc 1 156 8 is_stmt 0 discriminator 1 view .LVU151
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL53:
	movl	%eax, %ebx
.LVL54:
	.loc 1 157 2 is_stmt 1 discriminator 1 view .LVU152
	.loc 1 157 5 is_stmt 0 discriminator 1 view .LVU153
	testl	%eax, %eax
	jne	.L52
.LVL55:
.L34:
	.loc 1 158 3 is_stmt 1 discriminator 1 view .LVU154
	.loc 1 163 2 discriminator 1 view .LVU155
	.loc 1 163 12 is_stmt 0 discriminator 1 view .LVU156
	movl	4(%rsp), %ecx
	xorl	%r12d, %r12d
	.loc 1 165 2 discriminator 1 view .LVU157
	leaq	.LC9(%rip), %rax
	leaq	.LC8(%rip), %rdx
.LBB44:
.LBB45:
	.loc 2 112 10 discriminator 1 view .LVU158
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
.LBE45:
.LBE44:
	.loc 1 163 12 discriminator 1 view .LVU159
	testl	%ecx, %ecx
	.loc 1 165 2 discriminator 1 view .LVU160
	cmovne	%rax, %rdx
	.loc 1 163 12 discriminator 1 view .LVU161
	sete	%r12b
.LVL56:
	.loc 1 165 2 is_stmt 1 discriminator 1 view .LVU162
.LBB47:
.LBI44:
	.loc 2 110 1 discriminator 1 view .LVU163
.LBB46:
	.loc 2 112 3 discriminator 1 view .LVU164
	.loc 2 112 10 is_stmt 0 discriminator 1 view .LVU165
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL57:
	.loc 2 112 10 discriminator 1 view .LVU166
.LBE46:
.LBE47:
	.loc 1 166 2 is_stmt 1 discriminator 1 view .LVU167
	.loc 1 168 3 discriminator 1 view .LVU168
	.loc 1 168 9 is_stmt 0 discriminator 1 view .LVU169
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
.LVL58:
	movl	%eax, %ebx
.LVL59:
	.loc 1 169 3 is_stmt 1 discriminator 1 view .LVU170
	.loc 1 169 6 is_stmt 0 discriminator 1 view .LVU171
	testl	%eax, %eax
	jne	.L53
.LVL60:
.L30:
	.loc 1 175 1 view .LVU172
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L54
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL61:
	.loc 1 175 1 view .LVU173
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL62:
	.loc 1 175 1 view .LVU174
	ret
.LVL63:
.L51:
	.cfi_restore_state
	.loc 1 155 3 is_stmt 1 view .LVU175
	.loc 1 155 3 view .LVU176
	call	__errno_location@PLT
.LVL64:
	.loc 1 155 3 is_stmt 0 view .LVU177
	leaq	.LC11(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 155 3 is_stmt 1 view .LVU178
	call	perror@PLT
.LVL65:
	jmp	.L33
.LVL66:
.L53:
	.loc 1 171 4 view .LVU179
	.loc 1 171 4 view .LVU180
	call	__errno_location@PLT
.LVL67:
	.loc 1 171 4 is_stmt 0 view .LVU181
	leaq	.LC13(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 171 4 is_stmt 1 view .LVU182
	call	perror@PLT
.LVL68:
	.loc 1 171 4 view .LVU183
	.loc 1 174 2 view .LVU184
	jmp	.L30
.LVL69:
.L52:
	.loc 1 158 3 view .LVU185
	.loc 1 158 3 view .LVU186
	call	__errno_location@PLT
.LVL70:
	.loc 1 158 3 is_stmt 0 view .LVU187
	leaq	.LC11(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 158 3 is_stmt 1 view .LVU188
	call	perror@PLT
.LVL71:
	jmp	.L34
.LVL72:
.L50:
	.loc 1 158 3 is_stmt 0 view .LVU189
	movl	%eax, %ebx
	.loc 1 140 3 is_stmt 1 view .LVU190
	.loc 1 140 3 view .LVU191
.LVL73:
.L49:
	.loc 1 146 3 view .LVU192
	.loc 1 146 3 view .LVU193
	call	__errno_location@PLT
.LVL74:
	leaq	.LC10(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 146 3 view .LVU194
	call	perror@PLT
.LVL75:
	.loc 1 146 3 view .LVU195
	.loc 1 147 3 view .LVU196
	movl	$1, %edi
	call	exit@PLT
.LVL76:
.L54:
	.loc 1 175 1 is_stmt 0 view .LVU197
	call	__stack_chk_fail@PLT
.LVL77:
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
	.long	0xb48
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x22
	.long	.LASF96
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL22
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x36
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x23
	.byte	0x8
	.uleb128 0xc
	.long	0x44
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x6
	.byte	0x2
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
	.uleb128 0x24
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x25
	.long	0x67
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x8
	.long	.LASF10
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x73
	.uleb128 0x8
	.long	.LASF11
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x73
	.uleb128 0x3
	.long	0x97
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x1b
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
	.uleb128 0x8
	.long	.LASF42
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0xa3
	.uleb128 0x26
	.long	.LASF97
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0x15
	.long	.LASF43
	.uleb128 0x3
	.long	0x23e
	.uleb128 0x3
	.long	0xa3
	.uleb128 0xf
	.long	0x97
	.long	0x25d
	.uleb128 0x10
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
	.uleb128 0xf
	.long	0x97
	.long	0x286
	.uleb128 0x10
	.long	0x36
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x22a
	.uleb128 0xc
	.long	0x286
	.uleb128 0x27
	.long	.LASF76
	.byte	0xa
	.byte	0x91
	.byte	0xe
	.long	0x286
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x6
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
	.uleb128 0x8
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
	.uleb128 0x8
	.long	.LASF62
	.byte	0x9
	.byte	0x1b
	.byte	0x1b
	.long	0x36
	.uleb128 0x28
	.long	.LASF65
	.byte	0x38
	.byte	0x9
	.byte	0x38
	.byte	0x7
	.long	0x389
	.uleb128 0xd
	.long	.LASF63
	.byte	0x3a
	.byte	0x8
	.long	0x389
	.uleb128 0xd
	.long	.LASF64
	.byte	0x3b
	.byte	0xc
	.long	0x73
	.byte	0
	.uleb128 0xf
	.long	0x97
	.long	0x399
	.uleb128 0x10
	.long	0x36
	.byte	0x37
	.byte	0
	.uleb128 0x8
	.long	.LASF65
	.byte	0x9
	.byte	0x3e
	.byte	0x1e
	.long	0x365
	.uleb128 0x1b
	.long	0x399
	.uleb128 0x29
	.byte	0x28
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0x3d5
	.uleb128 0xd
	.long	.LASF66
	.byte	0x45
	.byte	0x1c
	.long	0x2e3
	.uleb128 0xd
	.long	.LASF63
	.byte	0x46
	.byte	0x8
	.long	0x3d5
	.uleb128 0xd
	.long	.LASF64
	.byte	0x47
	.byte	0xc
	.long	0x73
	.byte	0
	.uleb128 0xf
	.long	0x97
	.long	0x3e5
	.uleb128 0x10
	.long	0x36
	.byte	0x27
	.byte	0
	.uleb128 0x8
	.long	.LASF67
	.byte	0x9
	.byte	0x48
	.byte	0x3
	.long	0x3aa
	.uleb128 0x3
	.long	0x92
	.uleb128 0x3
	.long	0x9e
	.uleb128 0xc
	.long	0x3f6
	.uleb128 0x2a
	.byte	0x7
	.byte	0x4
	.long	0x3d
	.byte	0xb
	.byte	0x30
	.byte	0x1
	.long	0x43f
	.uleb128 0x9
	.long	.LASF68
	.byte	0
	.uleb128 0x9
	.long	.LASF69
	.byte	0x1
	.uleb128 0x9
	.long	.LASF70
	.byte	0x2
	.uleb128 0x9
	.long	.LASF71
	.byte	0x3
	.uleb128 0x9
	.long	.LASF72
	.byte	0
	.uleb128 0x9
	.long	.LASF73
	.byte	0x1
	.uleb128 0x9
	.long	.LASF74
	.byte	0x2
	.uleb128 0x9
	.long	.LASF75
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LASF77
	.byte	0x1
	.byte	0x2b
	.byte	0x11
	.long	0x3e5
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x11
	.long	.LASF78
	.byte	0x2
	.byte	0x5f
	.long	0x67
	.long	0x470
	.uleb128 0x4
	.long	0x67
	.uleb128 0x4
	.long	0x3f6
	.uleb128 0x12
	.byte	0
	.uleb128 0x16
	.long	.LASF79
	.value	0x312
	.long	0x67
	.long	0x485
	.uleb128 0x4
	.long	0x485
	.byte	0
	.uleb128 0x3
	.long	0x3e5
	.uleb128 0x11
	.long	.LASF80
	.byte	0xb
	.byte	0xdb
	.long	0x67
	.long	0x4a4
	.uleb128 0x4
	.long	0x359
	.uleb128 0x4
	.long	0x4a4
	.byte	0
	.uleb128 0x3
	.long	0x44
	.uleb128 0x2c
	.long	.LASF81
	.byte	0xc
	.value	0x270
	.byte	0xd
	.long	0x4bc
	.uleb128 0x4
	.long	0x67
	.byte	0
	.uleb128 0x11
	.long	.LASF82
	.byte	0xb
	.byte	0xca
	.long	0x67
	.long	0x4e0
	.uleb128 0x4
	.long	0x4e5
	.uleb128 0x4
	.long	0x4ef
	.uleb128 0x4
	.long	0x4f4
	.uleb128 0x4
	.long	0x46
	.byte	0
	.uleb128 0x3
	.long	0x359
	.uleb128 0xc
	.long	0x4e0
	.uleb128 0x3
	.long	0x3a5
	.uleb128 0xc
	.long	0x4ea
	.uleb128 0x3
	.long	0x4f9
	.uleb128 0x2d
	.long	0x44
	.long	0x508
	.uleb128 0x4
	.long	0x44
	.byte	0
	.uleb128 0x11
	.long	.LASF83
	.byte	0x2
	.byte	0x5d
	.long	0x67
	.long	0x528
	.uleb128 0x4
	.long	0x28b
	.uleb128 0x4
	.long	0x67
	.uleb128 0x4
	.long	0x3fb
	.uleb128 0x12
	.byte	0
	.uleb128 0x16
	.long	.LASF84
	.value	0x343
	.long	0x67
	.long	0x53d
	.uleb128 0x4
	.long	0x485
	.byte	0
	.uleb128 0x2e
	.long	.LASF98
	.byte	0xa
	.value	0x324
	.byte	0xd
	.long	0x550
	.uleb128 0x4
	.long	0x3f6
	.byte	0
	.uleb128 0x2f
	.long	.LASF99
	.byte	0xd
	.byte	0x25
	.byte	0xd
	.long	0x55c
	.uleb128 0x3
	.long	0x67
	.uleb128 0x16
	.long	.LASF85
	.value	0x31a
	.long	0x67
	.long	0x576
	.uleb128 0x4
	.long	0x485
	.byte	0
	.uleb128 0x17
	.long	.LASF88
	.byte	0x7d
	.byte	0x5
	.long	0x67
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d1
	.uleb128 0x1c
	.long	.LASF86
	.byte	0x7d
	.byte	0xe
	.long	0x67
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0x1c
	.long	.LASF87
	.byte	0x7d
	.byte	0x1a
	.long	0x3f1
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0x18
	.string	"val"
	.byte	0x7f
	.byte	0x6
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xb
	.string	"ret"
	.byte	0x7f
	.byte	0xb
	.long	0x67
	.long	.LLST18
	.long	.LVUS18
	.uleb128 0xb
	.string	"ok"
	.byte	0x7f
	.byte	0x10
	.long	0x67
	.long	.LLST19
	.long	.LVUS19
	.uleb128 0x18
	.string	"t1"
	.byte	0x80
	.byte	0xc
	.long	0x359
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"t2"
	.byte	0x80
	.byte	0x10
	.long	0x359
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.long	0xaf6
	.quad	.LBI44
	.byte	.LVU163
	.long	.LLRL20
	.byte	0xa5
	.long	0x64f
	.uleb128 0xe
	.long	0xb04
	.long	.LLST21
	.long	.LVUS21
	.uleb128 0xa
	.quad	.LVL57
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
	.quad	.LC12
	.byte	0
	.byte	0
	.uleb128 0x5
	.quad	.LVL47
	.long	0x4bc
	.long	0x67f
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
	.uleb128 0x5
	.quad	.LVL48
	.long	0x4bc
	.long	0x6af
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
	.uleb128 0x5
	.quad	.LVL50
	.long	0x48a
	.long	0x6c6
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x5
	.quad	.LVL53
	.long	0x48a
	.long	0x6dd
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x5
	.quad	.LVL58
	.long	0x470
	.long	0x6fc
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.byte	0
	.uleb128 0x7
	.quad	.LVL64
	.long	0x550
	.uleb128 0x5
	.quad	.LVL65
	.long	0x53d
	.long	0x728
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x7
	.quad	.LVL67
	.long	0x550
	.uleb128 0x5
	.quad	.LVL68
	.long	0x53d
	.long	0x754
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.byte	0
	.uleb128 0x7
	.quad	.LVL70
	.long	0x550
	.uleb128 0x5
	.quad	.LVL71
	.long	0x53d
	.long	0x780
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x7
	.quad	.LVL74
	.long	0x550
	.uleb128 0x5
	.quad	.LVL75
	.long	0x53d
	.long	0x7ac
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x5
	.quad	.LVL76
	.long	0x4a9
	.long	0x7c3
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x7
	.quad	.LVL77
	.long	0xb37
	.byte	0
	.uleb128 0x17
	.long	.LASF89
	.byte	0x56
	.byte	0x7
	.long	0x44
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x961
	.uleb128 0x1d
	.string	"arg"
	.byte	0x56
	.long	0x44
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0xb
	.string	"i"
	.byte	0x58
	.byte	0x6
	.long	0x67
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0xb
	.string	"ip"
	.byte	0x59
	.byte	0x10
	.long	0x961
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x1e
	.long	.LLRL13
	.long	0x8b9
	.uleb128 0x1f
	.long	.LASF90
	.byte	0x69
	.long	0x67
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x5
	.quad	.LVL27
	.long	0x528
	.long	0x85a
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x5
	.quad	.LVL32
	.long	0x561
	.long	0x872
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.quad	.LVL34
	.long	0x550
	.uleb128 0x5
	.quad	.LVL35
	.long	0x53d
	.long	0x897
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.quad	.LVL37
	.long	0x550
	.uleb128 0xa
	.quad	.LVL38
	.long	0x53d
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	0xb11
	.quad	.LBI29
	.byte	.LVU74
	.long	.LLRL11
	.byte	0x5a
	.long	0x909
	.uleb128 0xe
	.long	0xb2a
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x13
	.long	0xb1f
	.uleb128 0xa
	.quad	.LVL25
	.long	0x508
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
	.quad	.LC4
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0xb11
	.quad	.LBI42
	.byte	.LVU116
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.byte	0x79
	.uleb128 0xe
	.long	0xb2a
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x13
	.long	0xb1f
	.uleb128 0xa
	.quad	.LVL41
	.long	0xb40
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
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
	.uleb128 0x17
	.long	.LASF91
	.byte	0x2e
	.byte	0x7
	.long	0x44
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0xaf6
	.uleb128 0x1d
	.string	"arg"
	.byte	0x2e
	.long	0x44
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0xb
	.string	"i"
	.byte	0x30
	.byte	0x6
	.long	0x67
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0xb
	.string	"ip"
	.byte	0x31
	.byte	0x10
	.long	0x961
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1e
	.long	.LLRL5
	.long	0xa4e
	.uleb128 0x1f
	.long	.LASF90
	.byte	0x41
	.long	0x67
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x5
	.quad	.LVL5
	.long	0x528
	.long	0x9ef
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x5
	.quad	.LVL10
	.long	0x561
	.long	0xa07
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.quad	.LVL12
	.long	0x550
	.uleb128 0x5
	.quad	.LVL13
	.long	0x53d
	.long	0xa2c
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x7
	.quad	.LVL15
	.long	0x550
	.uleb128 0xa
	.quad	.LVL16
	.long	0x53d
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	0xb11
	.quad	.LBI14
	.byte	.LVU12
	.long	.LLRL3
	.byte	0x32
	.long	0xa9e
	.uleb128 0xe
	.long	0xb2a
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x13
	.long	0xb1f
	.uleb128 0xa
	.quad	.LVL3
	.long	0x508
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
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0xb11
	.quad	.LBI27
	.byte	.LVU54
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.byte	0x51
	.uleb128 0xe
	.long	0xb2a
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x13
	.long	0xb1f
	.uleb128 0xa
	.quad	.LVL19
	.long	0xb40
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
	.uleb128 0x21
	.long	.LASF92
	.byte	0x6e
	.long	0x67
	.long	0xb11
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x6e
	.byte	0x20
	.long	0x3fb
	.uleb128 0x12
	.byte	0
	.uleb128 0x21
	.long	.LASF93
	.byte	0x67
	.long	0x67
	.long	0xb37
	.uleb128 0x1a
	.long	.LASF95
	.byte	0x67
	.byte	0x1b
	.long	0x28b
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x67
	.byte	0x3c
	.long	0x3fb
	.uleb128 0x12
	.byte	0
	.uleb128 0x30
	.long	.LASF100
	.long	.LASF100
	.uleb128 0x31
	.long	.LASF101
	.long	.LASF102
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
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
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
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.byte	0
	.byte	0
	.uleb128 0x31
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
.LVUS16:
	.uleb128 0
	.uleb128 .LVU134
	.uleb128 .LVU134
	.uleb128 0
.LLST16:
	.byte	0x6
	.quad	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL46-.LVL44
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL46-.LVL44
	.uleb128 .LFE54-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS17:
	.uleb128 0
	.uleb128 .LVU127
	.uleb128 .LVU127
	.uleb128 0
.LLST17:
	.byte	0x6
	.quad	.LVL44
	.byte	0x4
	.uleb128 .LVL44-.LVL44
	.uleb128 .LVL45-.LVL44
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL45-.LVL44
	.uleb128 .LFE54-.LVL44
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS18:
	.uleb128 .LVU137
	.uleb128 .LVU141
	.uleb128 .LVU142
	.uleb128 .LVU146
	.uleb128 .LVU146
	.uleb128 .LVU147
	.uleb128 .LVU147
	.uleb128 .LVU149
	.uleb128 .LVU149
	.uleb128 .LVU152
	.uleb128 .LVU152
	.uleb128 .LVU154
	.uleb128 .LVU154
	.uleb128 .LVU170
	.uleb128 .LVU170
	.uleb128 .LVU172
	.uleb128 .LVU172
	.uleb128 .LVU173
	.uleb128 .LVU175
	.uleb128 .LVU177
	.uleb128 .LVU177
	.uleb128 .LVU179
	.uleb128 .LVU179
	.uleb128 .LVU181
	.uleb128 .LVU181
	.uleb128 .LVU185
	.uleb128 .LVU185
	.uleb128 .LVU187
	.uleb128 .LVU187
	.uleb128 .LVU189
	.uleb128 .LVU189
	.uleb128 .LVU192
	.uleb128 .LVU197
	.uleb128 0
.LLST18:
	.byte	0x6
	.quad	.LVL47
	.byte	0x4
	.uleb128 .LVL47-.LVL47
	.uleb128 .LVL48-1-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL49-.LVL47
	.uleb128 .LVL50-1-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL50-1-.LVL47
	.uleb128 .LVL51-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL51-.LVL47
	.uleb128 .LVL52-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL52-.LVL47
	.uleb128 .LVL54-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL54-.LVL47
	.uleb128 .LVL55-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL55-.LVL47
	.uleb128 .LVL59-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL59-.LVL47
	.uleb128 .LVL60-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL60-.LVL47
	.uleb128 .LVL61-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL63-.LVL47
	.uleb128 .LVL64-1-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL64-1-.LVL47
	.uleb128 .LVL66-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL66-.LVL47
	.uleb128 .LVL67-1-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL67-1-.LVL47
	.uleb128 .LVL69-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL69-.LVL47
	.uleb128 .LVL70-1-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL70-1-.LVL47
	.uleb128 .LVL72-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL72-.LVL47
	.uleb128 .LVL73-.LVL47
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL76-.LVL47
	.uleb128 .LFE54-.LVL47
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS19:
	.uleb128 .LVU162
	.uleb128 .LVU174
	.uleb128 .LVU179
	.uleb128 .LVU185
	.uleb128 .LVU197
	.uleb128 0
.LLST19:
	.byte	0x6
	.quad	.LVL56
	.byte	0x4
	.uleb128 .LVL56-.LVL56
	.uleb128 .LVL62-.LVL56
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL66-.LVL56
	.uleb128 .LVL69-.LVL56
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL76-.LVL56
	.uleb128 .LFE54-.LVL56
	.uleb128 0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LVUS21:
	.uleb128 .LVU163
	.uleb128 .LVU166
.LLST21:
	.byte	0x8
	.quad	.LVL56
	.uleb128 .LVL57-.LVL56
	.uleb128 0xa
	.byte	0x3
	.quad	.LC12
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 0
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST8:
	.byte	0x6
	.quad	.LVL22
	.byte	0x4
	.uleb128 .LVL22-.LVL22
	.uleb128 .LVL24-.LVL22
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL24-.LVL22
	.uleb128 .LVL43-.LVL22
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL43-.LVL22
	.uleb128 .LFE53-.LVL22
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 .LVU83
	.uleb128 .LVU84
	.uleb128 .LVU84
	.uleb128 .LVU95
	.uleb128 .LVU95
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU113
	.uleb128 .LVU113
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU115
.LLST9:
	.byte	0x6
	.quad	.LVL25
	.byte	0x4
	.uleb128 .LVL25-.LVL25
	.uleb128 .LVL26-.LVL25
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL26-.LVL25
	.uleb128 .LVL29-.LVL25
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL29-.LVL25
	.uleb128 .LVL30-.LVL25
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL25
	.uleb128 .LVL38-.LVL25
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL38-.LVL25
	.uleb128 .LVL39-.LVL25
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL25
	.uleb128 .LVL40-.LVL25
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 .LVU73
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST10:
	.byte	0x6
	.quad	.LVL23
	.byte	0x4
	.uleb128 .LVL23-.LVL23
	.uleb128 .LVL24-.LVL23
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL24-.LVL23
	.uleb128 .LVL43-.LVL23
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL43-.LVL23
	.uleb128 .LFE53-.LVL23
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS14:
	.uleb128 .LVU84
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU97
	.uleb128 .LVU101
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 .LVU107
	.uleb128 .LVU107
	.uleb128 .LVU109
	.uleb128 .LVU109
	.uleb128 .LVU122
.LLST14:
	.byte	0x6
	.quad	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL28-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL28-.LVL26
	.uleb128 .LVL31-.LVL26
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL33-.LVL26
	.uleb128 .LVL34-1-.LVL26
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL34-1-.LVL26
	.uleb128 .LVL36-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL36-.LVL26
	.uleb128 .LVL37-1-.LVL26
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL37-1-.LVL26
	.uleb128 .LVL42-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS12:
	.uleb128 .LVU74
	.uleb128 .LVU81
.LLST12:
	.byte	0x8
	.quad	.LVL23
	.uleb128 .LVL25-.LVL23
	.uleb128 0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.byte	0
.LVUS15:
	.uleb128 .LVU116
	.uleb128 .LVU119
.LLST15:
	.byte	0x8
	.quad	.LVL40
	.uleb128 .LVL41-.LVL40
	.uleb128 0xa
	.byte	0x3
	.quad	.LC7
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU18
	.uleb128 .LVU18
	.uleb128 .LVU61
	.uleb128 .LVU61
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
	.uleb128 .LVL21-.LVL0
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL21-.LVL0
	.uleb128 .LFE52-.LVL0
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS1:
	.uleb128 .LVU21
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU33
	.uleb128 .LVU33
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 .LVU53
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
	.uleb128 .LVL7-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.LVL3
	.uleb128 .LVL8-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL8-.LVL3
	.uleb128 .LVL16-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL16-.LVL3
	.uleb128 .LVL17-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL17-.LVL3
	.uleb128 .LVL18-.LVL3
	.uleb128 0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 .LVU11
	.uleb128 .LVU18
	.uleb128 .LVU18
	.uleb128 .LVU61
	.uleb128 .LVU61
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
	.uleb128 .LVL21-.LVL1
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL21-.LVL1
	.uleb128 .LFE52-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS6:
	.uleb128 .LVU22
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 .LVU35
	.uleb128 .LVU39
	.uleb128 .LVU43
	.uleb128 .LVU43
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 .LVU60
.LLST6:
	.byte	0x6
	.quad	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LVL9-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL11-.LVL4
	.uleb128 .LVL12-1-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL12-1-.LVL4
	.uleb128 .LVL14-.LVL4
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL14-.LVL4
	.uleb128 .LVL15-1-.LVL4
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL15-1-.LVL4
	.uleb128 .LVL20-.LVL4
	.uleb128 0x1
	.byte	0x53
	.byte	0
.LVUS4:
	.uleb128 .LVU12
	.uleb128 .LVU19
.LLST4:
	.byte	0x8
	.quad	.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.byte	0
.LVUS7:
	.uleb128 .LVU54
	.uleb128 .LVU57
.LLST7:
	.byte	0x8
	.quad	.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0xa
	.byte	0x3
	.quad	.LC3
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
	.quad	.LBB14
	.byte	0x4
	.uleb128 .LBB14-.LBB14
	.uleb128 .LBE14-.LBB14
	.byte	0x4
	.uleb128 .LBB20-.LBB14
	.uleb128 .LBE20-.LBB14
	.byte	0x4
	.uleb128 .LBB22-.LBB14
	.uleb128 .LBE22-.LBB14
	.byte	0x4
	.uleb128 .LBB23-.LBB14
	.uleb128 .LBE23-.LBB14
	.byte	0x4
	.uleb128 .LBB24-.LBB14
	.uleb128 .LBE24-.LBB14
	.byte	0
.LLRL5:
	.byte	0x5
	.quad	.LBB21
	.byte	0x4
	.uleb128 .LBB21-.LBB21
	.uleb128 .LBE21-.LBB21
	.byte	0x4
	.uleb128 .LBB25-.LBB21
	.uleb128 .LBE25-.LBB21
	.byte	0x4
	.uleb128 .LBB26-.LBB21
	.uleb128 .LBE26-.LBB21
	.byte	0
.LLRL11:
	.byte	0x5
	.quad	.LBB29
	.byte	0x4
	.uleb128 .LBB29-.LBB29
	.uleb128 .LBE29-.LBB29
	.byte	0x4
	.uleb128 .LBB35-.LBB29
	.uleb128 .LBE35-.LBB29
	.byte	0x4
	.uleb128 .LBB37-.LBB29
	.uleb128 .LBE37-.LBB29
	.byte	0x4
	.uleb128 .LBB38-.LBB29
	.uleb128 .LBE38-.LBB29
	.byte	0x4
	.uleb128 .LBB39-.LBB29
	.uleb128 .LBE39-.LBB29
	.byte	0
.LLRL13:
	.byte	0x5
	.quad	.LBB36
	.byte	0x4
	.uleb128 .LBB36-.LBB36
	.uleb128 .LBE36-.LBB36
	.byte	0x4
	.uleb128 .LBB40-.LBB36
	.uleb128 .LBE40-.LBB36
	.byte	0x4
	.uleb128 .LBB41-.LBB36
	.uleb128 .LBE41-.LBB36
	.byte	0
.LLRL20:
	.byte	0x5
	.quad	.LBB44
	.byte	0x4
	.uleb128 .LBB44-.LBB44
	.uleb128 .LBE44-.LBB44
	.byte	0x4
	.uleb128 .LBB47-.LBB44
	.uleb128 .LBE47-.LBB44
	.byte	0
.LLRL22:
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
.LASF99:
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
.LASF90:
	.string	"err_ret"
.LASF64:
	.string	"__align"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF38:
	.string	"_freeres_buf"
.LASF96:
	.string	"GNU C17 11.3.0 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF50:
	.string	"__prev"
.LASF85:
	.string	"pthread_mutex_lock"
.LASF51:
	.string	"__next"
.LASF87:
	.string	"argv"
.LASF42:
	.string	"FILE"
.LASF76:
	.string	"stderr"
.LASF43:
	.string	"_IO_marker"
.LASF46:
	.string	"long long int"
.LASF80:
	.string	"pthread_join"
.LASF82:
	.string	"pthread_create"
.LASF8:
	.string	"long int"
.LASF92:
	.string	"printf"
.LASF30:
	.string	"_cur_column"
.LASF98:
	.string	"perror"
.LASF93:
	.string	"fprintf"
.LASF59:
	.string	"__spins"
.LASF70:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF81:
	.string	"exit"
.LASF29:
	.string	"_old_offset"
.LASF102:
	.string	"__builtin_fwrite"
.LASF4:
	.string	"unsigned char"
.LASF86:
	.string	"argc"
.LASF79:
	.string	"pthread_mutex_destroy"
.LASF6:
	.string	"signed char"
.LASF35:
	.string	"_codecvt"
.LASF47:
	.string	"long long unsigned int"
.LASF89:
	.string	"decrease_fn"
.LASF3:
	.string	"unsigned int"
.LASF94:
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
.LASF88:
	.string	"main"
.LASF36:
	.string	"_wide_data"
.LASF37:
	.string	"_freeres_list"
.LASF69:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF39:
	.string	"__pad5"
.LASF84:
	.string	"pthread_mutex_unlock"
.LASF54:
	.string	"__lock"
.LASF56:
	.string	"__owner"
.LASF72:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF5:
	.string	"short unsigned int"
.LASF91:
	.string	"increase_fn"
.LASF53:
	.string	"__pthread_mutex_s"
.LASF101:
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
.LASF95:
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
.LASF83:
	.string	"__fprintf_chk"
.LASF100:
	.string	"__stack_chk_fail"
.LASF58:
	.string	"__kind"
.LASF65:
	.string	"pthread_attr_t"
.LASF62:
	.string	"pthread_t"
.LASF97:
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
