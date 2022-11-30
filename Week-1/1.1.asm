org 100h

; 1-  sayilar1= -55,15,-70,-20 dizisindeki elemanları tersten
;    ‘sayilar2’ dizisine aktarınız

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV DI,0                ; sayilar2 dizisinde elemanlara sırayla erişmek için kullanacağız
MOV SI,3                ; sayilar dizisinde son elemandan erişmeye başlayacağımız için burda 3 kullandık
                        ;
dongu1:                 ; döngü başlangıcı
                        ;
MOV AL,sayilar+SI       ; sayilar dizisindeki elemanı AL'ye aldık
MOV sayilar2+DI,AL      ; AL'ye aldığımız değeri sayilar2 dizisine attık
                        ;
DEC SI                  ; SI değişkenini azalttık
INC DI                  ; DI değişkenini arttırdık
                        ;
LOOP dongu1             ; döngünün başına döndük


; 2-  sayilar2 dizisindeki her bir elemanı ‘5’ sayısına bölüp
;    sonucu sayilar3 dizisine aktarınız.

MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek
MOV DI,0                ; sayilar2 dizisinde elemanlara sırayla erişmek için kullanacağız
                        ;
dongu2:                 ; döngü başlangıcı
                        ;
MOV AL,sayilar2+DI      ; sayilar2 dizisindeki elemanı AL'ye aldık
CBW                     ; negatif sayılarla çalıştığımız için AL değişkenini genişlettik (8 byte'tan 16 byte'a)
IDIV [sayi1]            ; AX'i sayi1 yani 5'e böldük (IDIV bölümü AL'ye, kalanı AH'a atar)
MOV sayilar3+DI,AL      ; sonucu sayilar3 dizisine attık
                        ;
INC DI                  ; DI değişkenini arttırdık
                        ;
LOOP dongu2             ;


; 3.  Daha sonra ‘dongu2’ isimli döngünün içinde ‘sayilar3’ dizisindeki
;    her bir elemandan (indis değeri*3) değerini
;    ilgili elemandan çıkararak sonucu ‘yenidizi’ dizisine yazın


MOV CX,4                ; 4 sayımız olduğu için döngü 4 defa dönecek 
MOV SI,0                ; sayilar3 ve yenidizi dizisinde elemanlara sırayla erişmek için kullanacağız
                        ;
dongu3:                 ; döngü başlangıcı
                        ;
MOV AL,3                ; indisleri 3 ile çarparken kullanacağız
MUL SI                  ; indisi AL ile çarptık (sonuç AL'ye gidiyor)
MOV AH,sayilar3+SI      ; sayıyı AH'a attık
MOV yenidizi+SI,AH      ; sayıyı yenidizi'ye attık
SUB yenidizi+SI,AL      ; sayıdan indis*3 çıkarttık
                        ;
INC SI                  ; SI değişkenini arttırdık
                        ;
LOOP dongu3             ;

ret

sayilar db -55,15,-70,-20
sayilar2 db 4 dup(?)
sayilar3 db 4 dup(?)
yenidizi db 4 dup(?)
sayi1 db 5