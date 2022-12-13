[BITS 16]
[ORG 0000h]

jmp OSMain

;=======================================
; Directives and inclusions=============
;---------------------------------------
%INCLUDE "src/hardware/monitor.lib"

;=======================================
; Starting the System
;---------------------------------------
OSMain:
  call ConfigSegment
  call ConfigStack
  call VGA.SetVideoMode
  call DrawBackground
  call EffectInit
  jmp END
;=======================================

;=======================================
; Kernel Functions  
;---------------------------------------
ConfigSegment:
  mov ax, es
  mov ds, ax
ret    

ConfigStack:
  mov ax, 7D00h
  mov ss, ax    ; 7D00h:03FEh
  mov sp, 03FEh
ret
;=======================================

; reinicia o computador após o preenchimento de qualquer tecla
END:
  mov ah, 00h
  int 16h
  mov ax, 0040h
  mov ds, ax
  mov ax, 1234h
  mov [0072h], ax
  jmp 0FFFFh:0000h
