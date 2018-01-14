# This assembler code is Copyright (C) 2009 Billy Holmes at gonoph.net
# Copyright (C) 2010,2018 (fixed a logic bug, and to run in newer gcc)
# Released and Licensed under GPLv2
# http://www.gonoph.net/gpl-2.0.txt
# Lyrics upon which it is based by Richard O'Brien and Richard Hartley
# http://en.wikipedia.org/wiki/The_Rocky_Horror_Picture_Show
# Coded in gnu assembler
# Why? Couldn't resist

.global main
.section .data
.set _right, 0x00000001
.set _hands, 0x00000002
.set _knees, 0xffffffff

hips:
   .long 0x0
tight:
   .long 0x0

.section .text
   .align 4

# it's just a:

main:
   jmp timewarp

timewarp:
   jmp left
step:
   shr $0x1, %eax
   movl $_hands, (hips)
   movl $_knees, (tight)
   push (hips)
   push (tight)
   call _pelvic_thrust
   call _drives_insane
left:
   xor %eax, %eax
   inc %eax
   jmp step
_pelvic_thrust:
   pop %eax
   pop %ebx
   pop %ebx
   push %eax
   ret
_drives_insane:
   pop %eax
   push $again
   ret
again:
   jmp timewarp
