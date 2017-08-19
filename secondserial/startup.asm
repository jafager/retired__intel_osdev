section .text
bits 32



extern stack_top
extern serial_init
extern serial_puts



global startup
startup:

    ; set up the initial stack
    mov esp, stack_top

    ; initialize the serial port
    call serial_init

    ; send the ready message to the serial port
    mov eax, message_ready
    call serial_puts

    ; put the green OK in the upper-left corner of the text console
    mov dword [0xb8000], 0x2f4b2f4f

    ; hang the processor
    hlt



message_ready:

    db `Ready.\r\n\0`
