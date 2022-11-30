org 100h

; sayilar = -10,-20,30,-40 dizisindeki sayıları sayilar2 = 3,4,7,6 sayılarına
; bölüp kalanları kalan, bölümleri bolum dizisine aktarınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL,sayilar+SI       ; bölünecek sayıyı AL register'ına attık
MOV BL,sayilar2+SI      ; bölüm sayısını BL register'ına attık
IDIV BL                 ; böldük
MOV kalan+SI,AH         ; kalanı (AH) kalan dizisine attık
MOV bolum+SI,AL         ; bölümü (AL) bolum dizisine attık

INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

sayilar db -10,-20,30,-40
sayilar2 db 3,4,7,6
kalan db 4 dup(?)
bolum db 4 dup(?)
