.text
.code32



.global startup
startup:

    movl $stack_top, %esp

    call check_multiboot
    call check_cpuid

    movl $0x2f4b2f4f, 0xb8000
    hlt



check_multiboot:

    cmpl $0x36d76289, %eax
    jne check_multiboot_failed
    ret

    check_multiboot_failed:

        movb $'0', %al
        jmp panic



check_cpuid:

    // copy flags register to eax and ecx
    pushfl
    popl %eax
    movl %eax, %ecx

    // flip the ID bit and copy eax back to the flags register
    xorl $(1 << 21), %eax
    pushl %eax
    popfl

    // copy flags register back to eax
    pushfl
    popl %eax

    // copy ecx back to the flags register
    pushl %ecx
    popfl

    // if eax and ecx are equal, then the ID bit was not flipped, and cpuid is not supported
    cmpl %ecx, %eax
    je check_cpuid_failed
    ret

    check_cpuid_failed:

        movb $'1', %al
        jmp panic



panic:

    movl $0x4f524f45, 0xb8000
    movl $0x4f3a4f52, 0xb8004
    movl $0x4f204f20, 0xb8008
    movb %al,         0xb800a
    hlt
