org 100h

; işaretsiz sayilar = 15,25,60,35 dizisindeki elemanların her
; birinin küp - 2 değerini kup dizisine yazdırınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AX,sayilar+SI       ; sayıyı AL register'ına attık
MOV BX,sayilar+SI       ; sayıyı çarpma işleminde kullanmak için BX register'ına da attık
MUL BX                  ; çarptık
MUL BX                  ; tekrar çarptık, böylece küpünü almış olduk
SUB AX,2                ; 2 çıkarttık
MOV kup+SI,AX           ; sonucu dizimize attık

ADD SI,2                ; SI değişkenini arttırdık
                        ; dizimiz word'lerden oluştuğu için sonraki elemana geçerken 2 ekledik

LOOP dongu              ; döngünün başına döndük

ret

; büyük sayılar elde edeceğimiz için dw yani 2 byte'lık alanlar kullandık
sayilar dw 15,25,60,35
kup dw 4 dup(?)
