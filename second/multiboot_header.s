multiboot_magic_number = 0xe85250d6
multiboot_architecture = 0
multiboot_header_length = multiboot_header_end - multiboot_header_begin
multiboot_checksum = -(multiboot_magic_number + multiboot_architecture + multiboot_header_length)
multiboot_end_tag_type = 0
multiboot_end_tag_flags = 0
multiboot_end_tag_length = multiboot_end_tag_end - multiboot_end_tag_begin



.section .multiboot_header, "a"
.balign 4



multiboot_header_begin:

    .long multiboot_magic_number
    .long multiboot_architecture
    .long multiboot_header_length
    .long multiboot_checksum
    
    multiboot_end_tag_begin:

        .word multiboot_end_tag_type
        .word multiboot_end_tag_flags
        .long multiboot_end_tag_length

    multiboot_end_tag_end:

multiboot_header_end:
