org 100h

; cumle = 'hepsibuyuk' dizisindeki tüm elemanları büyük harfe
; çevirip tersten buyukharf dizisine aktarınız.

MOV CX,10               ; 10 harfimiz olduğu için döngü 10 defa dönecek
MOV DI,9                ; cumle dizisinin elemanlarına tersten erişmek için kullanacağız
MOV SI,0                ; buyukharf dizisinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL, cumle+DI        ; harfi AL register'ına attık
                        ; -32 = 11100000b (signed)
ADD AL,11100000b        ; küçük harflerden 32 çıkarınca büyük harf elde edilir
MOV buyukharf+SI,AL     ; büyük harfi buyukharf dizisine attık

DEC DI                  ; DI değişkenini azalttık
INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

cumle db 'hepsibuyuk'
buyukharf db 10 dup(?)
