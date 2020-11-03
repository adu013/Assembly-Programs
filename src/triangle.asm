; triangle.asm
; author: Arindam Dutta
; Date: 04 Nov, 2020
; Architecture: 64 bit
; OS: MacOS
; ----------------------------------------------------------------------------------------------------------------------
; Build and run using:
; nasm -f macho64 triangle.asm && ld -macosx_version_min 10.7.0 -lSystem -o triangle triangle.o && ./triangle



global start

section .text

start:
    mov rdx, output                                 ; holds address of the new byte to write
    mov r8, 1                                       ; initial line length
    mov r9, 0                                       ; numbers of starts written so far

line:
    mov byte [rdx], '*'                             ; write single star
    inc rdx                                         ; advance pointer to next cell to write
    inc r9                                          ; "count" number so far on line
    cmp r9, r8                                      ; comparing the numbers of stars
    jne line                                        ; if not, keep writing

lineDone:
    mov byte [rdx], 10                              ; write new line
    inc rdx                                         ; and move pointer to where next char goes
    inc r8                                          ; next line is one char longer, incrementing
    mov r9, 0                                       ; reset counter
    cmp r8, maxlines
    jng line

done:
    mov rax, 0x02000004
    mov rdi, 1
    mov rsi, output
    mov rdx, dataSize
    syscall

    mov rax, 0x02000001
    xor rdi, rdi
    syscall


section .bss

maxlines    equ 8
dataSize    equ 44

output: resb dataSize
