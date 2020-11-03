; hello_world.asm
; author: Arindam Dutta
; Date: 03 Nov, 2020
; Architecture: 64 bit
; OS: MacOS
; ----------------------------------------------------------------------------------------------------------------------
; Build and run using:
; nasm -f macho64 hello_world.asm && ld -macosx_version_min 10.7.0 -lSystem -o hello_world hello_world.o && ./hello_world



global start

section .text

start:
    mov rax, 0x02000004         ; syscall for write
    mov rdi, 1                  ; file handle 1 for stdout
    mov rsi, message            ; address of string to output
    mov rdx, message_length     ; bytes count

    syscall                     ; invokes operating system to do the write

    mov rax, 0x02000001         ; syscall for exit
    xor rdi, rdi                ; exit code 0

    syscall                     ; invokes operating system to do the write

section .data
    message: db "Hello World!", 10
    message_length: equ $-message
