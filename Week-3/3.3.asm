; metin1 db 'bir dizi' ve metin2 db 'bir Dizi' dizilerini karşılaptırıp
; aynı elemanların sayısını 'ayni' değişkenine atınız.

data segment
    metin1 db 'bir dizi'
    ayni db 0
ends

extra segment
    metin2 db 'bir Dizi'
ends

stack segment
    dw   128  dup(0)        ; boş alan
ends

code segment
start:

    MOV AX, data
    MOV DS, AX              ; data segment başlangıcını ayarladık
    MOV AX, extra
    MOV ES, AX              ; extra segment başlangıcını ayarladık

    MOV CX,8                ; metin uzunluğumuzu CX register'ına attık

    karsilastir:            ; döngü başlangıcı
    CMPSB                   ; DS:[SI] ile ES:[DI] değerlerini karşılaştırdık
    JZ arttir               ; eğer değerler aynıysa arttir etiketine gittik
    LOOP karsilastir        ; döngünün başına döndük

    arttir:                 ; döngü başlangıcı
    INC ayni                ; bul değişkenini arttırdık
    LOOP karsilastir        ; diğer döngüye geri döndük (CX değerinin azalması için LOOP kullandık)

ends

end start
                                                                                                    
