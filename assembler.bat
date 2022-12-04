@echo off
cls
echo Monbtando o arquivo "Bootloader"
nasm -f bin src/asm/bootloader.asm -o binary/bootloader.bin
echo Monbtando o arquivo "Boot"
nasm -f bin src/asm/boot.asm -o binary/boot.bin
echo Monbtando o arquivo "kernel"
nasm -f bin src/asm/kernel.asm -o binary/kernel.bin
exit