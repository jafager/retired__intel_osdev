section .text
bits 32



extern stack_top
extern serial_init
extern serial_puts



global startup
startup:

    mov esp, stack_top

    call serial_init

    mov eax, message_ready
    call serial_puts

    mov dword [0xb8000], 0x2f4b2f4f

    hlt



message_ready:

    db `Ready.\r\n\0`
