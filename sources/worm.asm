;   This file is part of the Nemox computer worm
;   
;   I am not responsible for any kind of damage 
;   that is done via Nemox.
;
;   The development of Nemox will last at least
;   some weeks cuz ASM is pretty new ro me but
;   I think I'll manage it.
;
;   The Nemox computer worm will feature some concepts
;   borrowed from the Dridex trojan such as:
;       - Spreading via local Network Ports
;       - Self-obfuscation while runtime
:       - Polymorphism via mutex naming
;    This is everything... Yeah! Nemox is meant to be 
;    simple but aggressive as hell...
;    
;
section .text
global _start

point db ".",0
copyright db "Timo Sarkar MIT 2020"
