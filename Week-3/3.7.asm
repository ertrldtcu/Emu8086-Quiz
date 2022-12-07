org 100h

; sayilar = -12,5,-6,9,-13,8 dizisindeki negatif sayıları negatif,
; pozitif sayıları pozitif dizisine atınız.

                        ; dizimize iki defa gezeceğiz, önce negatif sonra pozitif sayıları seçip dizilerine ekleyeceğiz
MOV CX,6                ; dizi uzunluğumuzu CX register'ına attık
MOV DI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız
MOV SI,0                ; negatif dizisine sırayla eklemek için kullanacağız

                        ; önce negatif sayıları negatif dizisine atacağız
dongu1:                 ; döngü başlangıcı

MOV AL,sayilar+DI       ; sayıyı AL register'ına attık
AND AL,10000000b        ; sayının işaret bitini alacak şekilde maskeledik
CMP AL,10000000b        ; sayımızın işaret bitinin 1 olup olmadığına baktık
JNZ dongu1_sonu         ; eğer sayılar eşit değilse yani pozitifse döngünün sonuna gittik
MOV AL,sayilar+DI       ; sayıyı AL register'ına attık
MOV negatif+SI,AL       ; sayıyı negatif dizisine attık
INC SI                  ; counter'ımızı arttırdık   
dongu1_sonu:            ; eğer sayı negatif değilse buraya atladık
INC DI                  ; DI değerimizi arttırdık
LOOP dongu1             ; döngünün başına döndük

                        ; şimdi pozitif sayıları pozitif dizisine atacağız
MOV CX,6                ; dizi uzunluğumuzu CX register'ına attık
MOV DI,0                ; dizinin elemanlarına sırayla erişmek için kullanacağız
MOV SI,0                ; pozitif dizisine sırayla eklemek için kullanacağız

dongu2:                 ; döngü başlangıcı

MOV AL,sayilar+DI       ; sayıyı AL register'ına attık
AND AL,10000000b        ; sayının işaret bitini alacak şekilde maskeledik
CMP AL,10000000b        ; sayımızın işaret bitinin 1 olup olmadığına baktık
JZ dongu2_sonu          ; eğer sayılar eşitse yani negatifse döngünün sonuna gittik
MOV AL,sayilar+DI       ; sayıyı AL register'ına attık
MOV pozitif+SI,AL       ; sayıyı pozitif dizisine attık
INC SI                  ; counter'ımızı arttırdık   
dongu2_sonu:            ; eğer sayı pozitif değilse buraya atladık
INC DI                  ; DI değerimizi arttırdık
LOOP dongu2             ; döngünün başına döndük

bitir:

ret

sayilar db -12,5,-6,9,-13,8
negatif db 6 dup(0)
pozitif db 6 dup(0)
