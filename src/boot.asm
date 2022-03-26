[BITS 16]
[ORG 0x7C00]
;   Habilita o modo gráfico atribuindo os endereços AH e AL
  mov ah,0x00 ; Tipo de função
  mov al,0x13
  int 0x10
;   PARÂMETROS UTILIZADOS
  mov al,0x01 ; cor do pixel
  mov bh,0x00 ; número da página
  mov cx,0x00 ; posição X
  mov dx,0x00 ; posição Y

LOOP:
  mov ah,0x0C
  int 0x10 ; chama a função de vídeo    
  inc cx ; avança para o pixl a direita
  cmp cx,0x0140 ; verifica se igual a 320
  jne LOOP ; continua se ainda não é 320
  mov cx,0x00 ; volta para a posição 0 do eixo X
  inc dx ; avança para a próxima linha
  cmp dx,0xC8 ; verifica se chegou ao limite inferior
  jne LOOP
  mov dx,0x00 ; volta para a primeira linha
  inc al ; pula para a próxima cor
  cmp al,0xFF ; verifica se é a última cor
  je RESETCOR
  jmp LOOP

RESETCOR:
  mov al,0x00  ; reinicia cor
  jmp LOOP
times 510 - ($-$$) db 0
db 0x55
db 0xAA