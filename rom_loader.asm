; BIOS ROM loader
;
; This program disable the ROM on 0000-3FFF and copy to this place the image from 5000-8FFF
; At the end it jumps to 0000 to start the new monitor from RAM
;
; Denis Chertkov, denis@chertkov.info ,20260911

        ORG $4100

start:
        DI

        ; Disable ROM: write something to the port 38h
        ; XOR A
        OUT ($38),A

        ; New monitor image:
        ; 5000-8FFF -> 0000-3FFF
        LD HL,$5000
        LD DE,$0000
        LD BC,$4000
        LDIR

        ; Write 55h to 000Dh (unused 3 bytes) to test RAM
        LD HL,000Dh
        LD (HL),'R'
        INC HL
        LD (HL),'A'
        INC HL
        LD (HL),'M'

        JP $0000