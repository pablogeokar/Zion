@echo off
nasm -f bin src/asm/boot.asm -o build/boot.bin
exit