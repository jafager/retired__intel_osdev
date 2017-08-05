.text



.global startup
startup:

    movl $stack_top, %esp

    call check_multiboot

    movl $0x2f4b2f4f, 0xb8000
    hlt



check_multiboot:

    cmp $0x36d76289, %eax
    jne check_multiboot_failed
    ret

    check_multiboot_failed:

        movb '0', %al
        jmp panic
        



panic:

    movl $0x4f524f45, 0xb8000
    movl $0x4f3a4f52, 0xb8004
    movl $0x4f204f20, 0xb8008
    movb %al,         0xb800a
    hlt
