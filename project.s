	AREA ornek, CODE, READONLY
	ENTRY

; 1. soru 

	ldr r1, =dizi; dizinin baslangic adresi atilir
	mov r2, #0; negatif sayi numarasi
	mov r3, #0; sayac
	mov r4, #0 ; adres degeri
	


dongu
	cmp r3, #25 ; dizi tamamen donulur
	bge done ; kucukse cik
	add r3, r3, #1  ; indexe bir eklenir
	ldr r5, [r1, r4] ; dizinin index degeri yuklenir
	add r4,r4,#4 ; bir sonraki adrese gitmesi için
	cmp r5, #0 ; negatif sayi kontrol yap11l1r 
	bge check 	; buyukse cik
	add r2, r2, #1 ; bir ekle
check
	b dongu 
done

; 2. soru

	mov r5, #0 ; en buyuk satir toplami
	mov r3, #0 ; sayac 
	mov r4, #0 ; index artirmak icin
	mov r6, #0 ; sayac2
	
dongu2
	cmp r6, #5 ; 5 ile kontrol yap
	bge sifirla ; buyukse cik 
	add r6, r6, #1 ; indexi 1 artir 
	ldr r7, [r1, r4] ;r7'ye dizi degerini at 
	add r4, r4, #4  ; bir sonraki adrese gitmesi icin
	add r8, r8, r7  ; satir toplami
	
	add r3, r3, #1 ; bir ekle 
	cmp r3, #25 ; dizinin indexini kontrol et 
	bge bitti
	
	b dongu2

sifirla
	mov r6, #0 ;satir indexini sifirla 
	cmp r5, r8 ; eger en buyuk ise update et 
	bge update
update  
	mov r5, r8 ;r5'e en buyuk degeri at 
	mov r8, #0 ; satir toplamini sifirla
	b dongu2 
	
bitti


; 3. soru 

	mov r6, #0	; counter
	mov r0,#0	; aranan sayi indexi
	mov r12,#-8 ;dizi icinde aranan sayi
	mov r10, #0 ; dizi sayaci
    bl sayiarama ;alt programa gidilir
exit b exit ; fonksiyondan cikmak icin


sayiarama	; sayi arama fonksiyonu
dongu3
	cmp r6, #25 ; index kontrolu 
	bge son 
	ldr r11, [r1, r10] ; r11'e degeri yukle
	add r10, r10, #4 ; dizi indexini artir 
	add r6, r6, #1 ; countera bir ekle
	cmp r12, r11 ; aranan degeri kontrol et
	bne dongu3 ;esit degilse donguye devam
	mov r0, r6 ; eger deger bulunduysa r0'a at
	BX LR ;deger return edilir


dizi  dcd 1,2,3,4,5 
      dcd 6,7,-8,9,10 
	  dcd 11,12,-13,14,15 
      dcd 33,12,22,17,15
	  dcd 11,-21,13,41,-15

son

	END