org 100h

; sayilar = 10,20,30,40 dizisindeki elemanları sayilar2 = 3,4,7,6
; dizisindeki sayılara bölüp, sadece kalanları kalan dizisine atınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL, sayilar+SI      ; sayıyı AL register'ına attık
CBW                     ; bölme işleminden önce AL'yi AX'e genişlettik
DIV sayilar2+SI         ; sayıyı sayilar2'de, aynı indisteki sayıya böldük
MOV kalan+SI,AH         ; kalanı (AH) kalan dizisinin aynı indisine attık

INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

sayilar db 10,20,30,40
sayilar2 db 3,4,7,6
kalan db 4 dup(?)
