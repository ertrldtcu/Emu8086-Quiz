org 100h

; Stack üzerine veri1=BCDEh, veri2=AB03h değerlerini yazın. Daha
; sonra bu verileri AX register'ına çekip veri1 ve veri2'nin
; düşük değerlikli 8-bitini dusuk dizisine, yüksek değerlikli
; 8-bitini yuksek dizisine yazınız.

MOV AX,veri1            ; veri1 değerini AX register'ına attık
PUSH AX                 ; AX register'ını stack'e ekledik

MOV AX,veri2            ; veri2 değerini AX register'ına attık
PUSH AX                 ; AX register'ını stack'e ekledik

MOV CX,2                ; 2 sayımız olduğu için döngü 2 defa dönecek
MOV DI,0                ; dusuk ve yuksek dizisinde elemanlara sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

POP AX                  ; stack'in en üstteki değerini AX register'ına attık

MOV dusuk+DI,AL         ; değerin son 8-bitini dusuk dizisine attık
MOV yuksek+DI,AH        ; değerin ilk 8-bitini dusuk dizisine attık

INC DI                  ; DI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

veri1 dw 0BCDEH
veri2 dw 0AB03H
yuksek db 2 dup(?)
dusuk db 2 dup(?)
