org 100h

; dizi = -6,9,8,-12 dizisindeki elemanlar için kendisinden sonra gelen elemandan
; çıkarıp bunları yeni dizisine atınız. (1. eleman olduğu gibi alınacaktır.)

MOV AL,dizi             ; dizinin ilk elemanını AL register'ına attık
MOV yeni,AL             ; AL'deki değeri yani ilk elemanı yeni dizisine attık

MOV CX,3                ; ilk eleman hariç 3 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL,dizi+SI          ; sayıyı AL register'ına attık
INC SI                  ; SI değişkenini arttırdık
MOV AH,dizi+SI          ; bir sonraki sayıyı AH register'ına attık
SUB AL,AH               ; sayımızdan bir sonraki sayıyı çıkarttık
MOV yeni+SI,AL          ; sonucu yeni dizisine attık

LOOP dongu              ; döngünün başına döndük

ret

dizi db -6,9,8,-12
yeni db 4 dup(?)
