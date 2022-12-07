; kelime1 = 'bukelime' ve kelime = 'bUkelimE' değişkenlerini
; harf harf kontrol eden ediniz. Eğer değişkenler aynıysa 'kontrol'
; değişkenini 1, değilse 0 yapınız. Ardında 'kontrol' değişkeninin
; durumlarını 'flag' dizisine kaydediniz.

data segment
    kelime1 db 'bukelime'
    kontrol db 0
ends

extra segment
    kelime db 'bUkelimE'
    flag db 8 dup(0)        ; flag dizisini 0 ile doldurduk bu yüzden sadece farklı harflerde dizinin ilgili elemanını 1 yapacağız
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

    MOV CX,8                ; kelime uzunluğumuzu CX register'ına attık

    JMP dongu               ; set etiketine girmemesi için dongu'ye gittik

    set:                    ; set başlangıcı
    MOV kontrol,1           ; kontrol değişkenine 1 attık
    ADD DI,7                ; DI register'ına 7 ekledik (flag dizisinde çalışmak için)        
    MOV ES:[DI],1           ; manuel olarak flag dizisine eriştik ve 1 yazdık
    SUB DI,7                ; DI register'ından 7 çıkardık (kelime dizisinde çalışmak için)
    LOOP dongu              ; döngüye döndük

    dongu:                  ; döngü başlangıcı
    JCXZ bitir              ; CX 0 olduysa bitir etiketine gittik
    CMPSB                   ; DS:[SI] ile ES:[DI] elemanlarını karşılaştırdık
    JNZ set                 ; eğer farklıysa set etiketine gittik
    MOV kontrol,0           ; farklı değilse kontrol değişkenini 0 yaptık
    LOOP dongu              ; döngü başlangıcına döndük
    
    bitir:

ends

end start
                                                                                                    
