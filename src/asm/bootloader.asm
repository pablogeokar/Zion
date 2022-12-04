[BITS 16]
[ORG 0x7C00]

call LoadSystem
;jmp 0800h:0000h

LoadSystem:
  mov ah, 02h
  mov al, 1
  mov ch, 0
  mov cl, 2
  mov dh, 0
  mov dl, 80h   ; primeiro disco da ordem de boot 81h segundo disco, 82h terceiro disco....
  mov bx, 0800h ; ES:BX = 0800h:0000h
  mov es, bx
  mov bx, 0000h
  int 13h
ret  

times 510 - ($-$$) db 0
dw 0xAA55