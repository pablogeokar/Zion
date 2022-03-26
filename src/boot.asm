[BITS 16]
[ORG 0x7C00]

jmp main

main:
  mov si,string ; si=&string
  call printstr  
  ;hit ; CPU idle

printstr:
  lodsb ; al=&si[0]
  cmp al,0 ; FLAGS 0
  jnz print
  ret

print: 
  mov ah,0Eh
  int 10h
  jmp printstr

string db "MEnsagem do teste",13,10,0

times 510 - ($-$$) db 0
dw 0xAA55