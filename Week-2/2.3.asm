org 100h

; sayilar = 10,20,30,40 dizisindeki elemanların her birinin sadece
; son 4 bitindeki değerleri alıp bunları sayilar2 dizisine atınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL, sayilar+SI      ; sayıyı AL register'ına attık
AND sayilar2+SI,AL      ; sayilar2 dizisinin AL register'ındaki sayıyla maskeledik
                        ; AND işleminin sonucu yine operand1 yani sayilar2+SI yerine kaydedilir
INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

sayilar db 10,20,30,40
sayilar2 db 4 dup(00001111b) ; maskeleme işlemi için binary son 4 biti 1 yaptık (AND)
