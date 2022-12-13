@echo off
cls
echo Monbtando o arquivo "Bootloader"
nasm -f bin src/bootloader.asm -o binary/bootloader.bin
echo Monbtando o arquivo "kernel"
nasm -f bin src/kernel.asm -o binary/kernel.bin
pause
exit