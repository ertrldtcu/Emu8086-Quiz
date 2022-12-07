; metin db 'bu dizi icindeki bosluklari bulun' dizisindeki boşluk
; karakterlerinin sayısını bulup 'bosluksayisi' değişkenine atınız.

data segment
    metin db 'bu dizi icindeki bosluklari bulun'
    bosluksayisi db 0
ends

stack segment
    dw   128  dup(0)        ; boş alan
ends

code segment
start:

    MOV AX, data
    MOV DS, AX              ; data segment başlangıcını ayarladık
    MOV ES, AX              ; extra segment başlangıcını ayarladık

    MOV AL,' '              ; karşılaştırma için AL register'ına ' ' (boşluk) attık
    MOV CX,33               ; metin uzunluğumuzu CX register'ına attık

    karsilastir:            ; döngü başlangıcı
    SCASB                   ; AL register'ındaki değer (boşluk) ile ES:[DI] değerini karşılaştırdık
    JZ arttir               ; eğer değerler aynıysa arttir etiketine gittik
    LOOP karsilastir        ; döngünün başına döndük

    arttir:                 ; döngü başlangıcı
    JCXZ bitir              ; eğer CX 0 ise yani metin bitmişse bitir etiketine gittik
    INC bosluksayisi        ; bul değişkenini arttırdık
    LOOP karsilastir        ; diğer döngüye geri döndük (CX değerinin azalması için LOOP kullandık)

    bitir:

ends

end start
                                                                                                    
