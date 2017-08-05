.section .multiboot_header, "a"
.balign 4

multiboot_header_begin:

    // magic number for multiboot2
    .long 0xe85250d6

    // architecture (protected mode i386)
    .long 0

    // header length
    .long multiboot_header_end - multiboot_header_begin

    // checksum
    .long -(0xe85250d6 + 0 + (multiboot_header_end - multiboot_header_begin))

    // end tag
    end_tag_begin:

        // type
        .word 0

        // flags
        .word 0

        // length
        .long end_tag_end - end_tag_begin

    end_tag_end:

multiboot_header_end:
