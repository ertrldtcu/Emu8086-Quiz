; sayi = -2,-1,-3,-1,9,-1 dizisinde AL register'ı içinde bulunan
; değeri (AL=-1) arayıp ve bu değerin dizi içinde kaç kez geçtiğini
; 'bul' değişkenine yazınız.

data segment
    sayi db -2,-1,-3,-1,9,-1
    bul db 0
ends

stack segment
    dw   128  dup(0)        ; boş alan
ends

code segment
start:

    MOV AX, data
    MOV DS, AX              ; data segment başlangıcını ayarladık
    MOV ES, AX              ; extra segment başlangıcını ayarladık
                            ; SCASB komutu extra segment'i ile çalıştığı için extra segment'inin başlangıcını data segment'i ile aynı yaptık

    MOV AL,-1               ; karşılaştırma için AL register'ına -1 attık
    MOV CX,6                ; dizi uzunluğumuzu CX register'ına attık

    karsilastir:            ; döngü başlangıcı
    SCASB                   ; AL register'ındaki değer (-1) ile ES:[DI] değerini karşılaştırdık
    JZ arttir               ; eğer değerler aynıysa arttir etiketine gittik
    LOOP karsilastir        ; döngünün başına döndük

    arttir:                 ; döngü başlangıcı
    INC bul                 ; bul değişkenini arttırdık
    LOOP karsilastir        ; diğer döngüye geri döndük (CX değerinin azalması için LOOP kullandık)

ends

end start
                                                                                                    
