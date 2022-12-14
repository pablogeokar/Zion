@echo off
cls
echo Montando o arquivo "Bootloader.bin"
nasm -f bin src/bootloader.asm -o binary/bootloader.bin
echo Montando o arquivo "kernel.bin"
nasm -f bin src/kernel.asm -o binary/kernel.bin
echo Montando o arquivo "window.bin"
nasm -f bin src/window.asm -o binary/window.bin
pause
exit