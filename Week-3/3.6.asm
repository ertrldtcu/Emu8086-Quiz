org 100h

; 8-bitlik işaretsiz iki sayının toplanması sonucunda
; eğer taşma varsa tasma değişkeninin değerini 1 yapınız.

MOV AL,sayi2                ; sayi2 değerini AL register'ına attık
ADD sayi1,AL                ; sayi1 değerine AL ekledik
LAHF                        ; flag register'ının düşük değerli 8 bitini AH register'ına aktardık
AND AH,00000001b            ; AH register'ını mask'leyerek sadece CF değerini aldık
MOV tasma,AH                ; bu değeri tasma değişkenine taşıdık

ret

sayi1 db 18
sayi2 db 240
tasma db 0
