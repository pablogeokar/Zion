[BITS 16]
[ORG 0x7C00]

call HelloWorld ; Primeira Forma de hello World
call JumpLine

call PointerString ; Segunda forma de hello World
call PrintString

call PointerBuffer
call ReadString
call PointerStringBuffer
call PrintString
jmp $


HelloWorld:
  mov ah, 0eh ; AH + AL = AX
  mov al, 48h
  int 10h
  mov al, 65h
  int 10h
  mov al, 6ch
  int 10h
  mov al, 6ch
  int 10h
  mov al, 20h
  int 10h
  mov al, 57h
  int 10h
  mov al, 6fh
  int 10h
  mov al, 72h
  int 10h
  mov al, 6ch
  int 10h
  mov al, 64h
  int 10h
  ret

JumpLine:
  mov ah, 0eh
  mov al, 0ah
  int 10h
  mov al, 0dh
  int 10h
  ret

PointerString:
  mov si, hello

PointerStringBuffer:
  mov si, buffer
  ret

PrintString:
  mov ah, 0eh  
  mov al, [si]
  print:
    int 10h
    inc si
    mov al,[si]
    cmp al,0
    jne print
  ret    

PointerBuffer:
  mov di, buffer

ReadString:
  mov ah, 00h ; Lê um caracter do teclado
  int 16h
  mov ah, 0eh
  int 10h
  mov [di], al
  cmp al, 0dh ; 0dh tecla ENTER
  jne ReadString
  mov ah, 0eh,
  int 10h
ret  

hello db "Hello World!",13,10,0
buffer times 20 db 0 ; buffer de 20 posições

;mov ax, 0x4f02
;mov bx, 0x0115
;int 0x10
times 510 - ($-$$) db 0
dw 0xAA55