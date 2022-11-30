org 100h

; cumle = 'harf' dizisindeki tüm elemanları kendinden sonra gelen
; harfle değiştirip yeni oluşan kelimeyi tersten yazdırınız.

MOV CX,4                ; 4 harfimiz olduğu için döngü 4 defa dönecek
MOV SI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız
MOV DI,3                ; ters dizisinin elemanlarına tersten erişmek için kullanacağız

dongu:                  ; döngü başlangıcı

MOV AL,cumle+SI         ; harfi AL register'ına attık
INC AL                  ; bir sonraki harfi elde etmek için 1 ekledik
MOV ters+DI,AL          ; harfi ters dizisinin sonuna ekledik

DEC DI                  ; DI değişkenini azalttık
INC SI                  ; SI değişkenini arttırdık

LOOP dongu              ; döngünün başına döndük

ret

cumle db 'harf'
ters db 4 dup(?)