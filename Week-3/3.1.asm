; metin db 'mikro dersi' metnini 'e' karakterine göre ikiye
; ayırıp, birinci parçayı 'metin1' değişkenine, ikinci parçayı
; 'metin2' değişkenine atınız.

data segment
    metin db 'mikro dersi'  ; metin değişkenimizi atadık
ends

extra segment
    metin1 db 11 dup(0)     ; 'e' ile karşılaşılana kadar harfleri buraya atacağız
    metin2 db 11 dup(0)     ; 'e' ile karşılaştıktan sonra harfleri buraya atacağız
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

    MOV AH,'e'              ; karşılaştırma için 'e' yi AH register'ına attık
    MOV CX,11               ; metin uzunluğumuzu CX register'ına attık

    dongu1:                 ; döngü başlangıcı

    DEC CX                  ; CX register'ını el ile azalttık

    LODSB                   ; DS:[SI]'da bulunan değeri AL register'ına attık
    DEC SI                  ; SI değerini azalttık (LODSB otomatik arttırdığı için)
    MOVSB                   ; DS:[SI]'da bulunan değeri ES:[DI]'ya attık

    CMP AL,AH               ; AL ile AH register'larının değerini karşılaştırdık
                            ; yani son eklenen harf 'e' mi diye kontrol ettik 
    JNZ dongu1              ; eğer aynı değilse döngü başına dön

    ADD DI,CX               ; DI register'ına CX yani kalan harf sayısını ekledik
                            ; böylece bundan sonraki kopyalama işlemleri metin2 dizisine olacak

    dongu2:                 ; döngü başlangıcı
    MOVSB                   ; DS:[SI]'da bulunan değeri ES:[DI]'ya attık
    LOOP dongu2             ; döngünün başına döndük

ends

end start
                                                                                                    
