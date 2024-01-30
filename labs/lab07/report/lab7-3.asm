%include 'in_out.asm'

section .data
    msg1 db 'Введите значение x: ', 0h
    msg2 db 'Введите значение a: ', 0h
    msg3 db 'f(x) = ', 0h

section .bss
    x resb 10
    a resb 10

section .text
    global _start

_start:
    ; Ввод значения x
    mov eax, msg1
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    ; Преобразуем введенное значение в число
    call atoi
    mov [x], eax

    ; Ввод значения a
    mov eax, msg2
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    ; Преобразуем введенное значение в число
    call atoi
    mov [a], eax

    ; Сравнение x и a
    mov eax, [x]
    cmp eax, [a]

    ; Если x > a, то решение: a + x
    jg solve_equation

    ; Если x ≤ a, то решение: x
    mov eax, [x]
    jmp print_result

solve_equation:
    mov eax, [a]
    add eax, [x]

print_result:
    mov ebx, eax
    mov eax, msg3
    call sprint
    mov eax, ebx
    call iprintLF

    ; Завершаем программу
    call quit

