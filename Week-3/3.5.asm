org 100h

; sayilar = 12,-15,4,7,-9 dizisindeki her bir elemanın
; değerini loop döngüsü kullanmadan 2 arttırınız.

MOV CX,5
MOV SI,0

dongu:                  ; döngü başlangıcı

MOV AL,sayilar+SI       ; AL register'ına sayımızı attık
ADD AL,2                ; AL register'ına 2 ekledik
MOV sayilar+SI,AL       ; AL register'ındaki değeri dizimize geri attık
INC SI                  ; SI değerini arttırdık
DEC CX                  ; CX değerini azalttık
JCXZ bitir              ; CX 0 ise bitir etiketine gittik
JMP dongu
                                                         
bitir:                                                         
                                                         
ret

sayilar db 12,-15,4,7,-9
