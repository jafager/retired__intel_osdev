multiboot_magic_number      equ     0xe85250d6
multiboot_architecture      equ     0
multiboot_header_length     equ     multiboot_header_end - multiboot_header_begin
multiboot_checksum          equ     0x100000000 - (multiboot_magic_number + multiboot_architecture + multiboot_header_length)
multiboot_end_tag_type      equ     0
multiboot_end_tag_flags     equ     0
multiboot_end_tag_length    equ     multiboot_end_tag_end - multiboot_end_tag_begin



section .multiboot_header
align 4



multiboot_header_begin:

    dd multiboot_magic_number
    dd multiboot_architecture
    dd multiboot_header_length
    dd multiboot_checksum
    
    multiboot_end_tag_begin:

        dw multiboot_end_tag_type
        dw multiboot_end_tag_flags
        dd multiboot_end_tag_length

    multiboot_end_tag_end:

multiboot_header_end:
