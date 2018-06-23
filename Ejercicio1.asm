; #########################################################################

      .386
      .model flat, stdcall    
      option casemap :none   ; case sensitive

; #########################################################################

      include \masm32\include\windows.inc
      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc

      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib

; #########################################################################
.data
      ;acá van los datos
      szDlgTitle     db "Ejercicio 1",0
      szMsg         db "El mayor es "
      mayor         db "         ",0
      num1          dw 12
      num2          dw 34
      num3          dw 16

.code
         ;acá va el código
         include bin2txt.inc
start:
    mov ax, num1
    cmp ax, num2
    jl menor1
    cmp ax, num3
    jl menor2
    jmp final

menor1:
    mov ax, num2
    cmp ax, num3
    jl menor2
    jmp final

menor2:
    mov ax, num3

final:
    mov edi, offset mayor
    call bin2txt
    push MB_OK
    push offset szDlgTitle
    push offset szMsg
    push 0
    call MessageBox
    push 0
    call ExitProcess

    ; --------------------------------------------------------
    ; The following are the same function calls using MASM
    ; "invoke" syntax. It is clearer code, it is type checked
    ; against a function prototype and it is less error prone.
    ; --------------------------------------------------------

    ; invoke MessageBox,0,ADDR szMsg,ADDR szDlgTitle,MB_OK
    ; invoke ExitProcess,0

end start