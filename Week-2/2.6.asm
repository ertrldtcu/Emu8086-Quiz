org 100h

; sayilar = 20,69,17,15 dizisindeki elemanların her birinin sadece ilk 2
; ve son 2 bitindeki değerleri alıp bunları sayilar2 dizisine atınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL,sayilar+SI       ; sayıyı AL register'ına attık
AND AL,11000011b        ; AL register'ını maskeledik
MOV sayilar2+SI,AL      ; sonucu sayilar2 dizisine attık

INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

sayilar db 20,69,17,15
sayilar2 db 4 dup(?)
