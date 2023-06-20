.section .data

pilot_0_str:
    .string   "Pierre Gasly\0"
pilot_1_str:
    .string   "Charles Leclerc\0"
pilot_2_str:
    .string   "Max Verstappen\0"
pilot_3_str:                       
    .string   "Lando Norris\0"
pilot_4_str:
    .string   "Sebastian Vettel\0"
pilot_5_str:
    .string   "Daniel Ricciardo\0"
pilot_6_str: 
    .string   "Lance Stroll\0"
pilot_7_str:
    .string   "Carlos Sainz\0"
pilot_8_str:
    .string   "Antonio Giovinazzi\0"
pilot_9_str:
    .string   "Kevin Magnussen\0"
pilot_10_str:
    .string  "Alexander Albon\0"
pilot_11_str:
    .string  "Nicholas Latifi\0"
pilot_12_str:
    .string  "Lewis Hamilton\0"
pilot_13_str:
    .string  "Romain Grosjean\0"
pilot_14_str:
    .string  "George Russell\0"
pilot_15_str:
    .string  "Sergio Perez\0"
pilot_16_str:
    .string  "Daniil Kvyat\0"
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"
pilot_19_str:
    .string  "Valtteri Bottas\0"

numero_id:
.long 0

invalid_pilot_str:	
.string "Invalid\0"

LOW:
    .string "LOW\0"

MEDIUM:
    .string "MEDIUM\0"

HIGH:
    .string "HIGH\0"

# Variabili dove salvo i valori: max,sommavelocità e il numero righe per la creazione delll'ultima riga nell'output
rpm_max:
    .long 0
temperatura_max:
    .long 0
velocita_max:   
    .long 0
somma_velocita:
    .long 0
numero_righe:
    .long 0


.section .text
    .global telemetry

telemetry:
    movl 4(%esp),%esi   # salvo l'indirizzo della stringa in esi
    movl 8(%esp),%edi   # salvo l'output (il file nel quale andrò a scrivere i risultati del processo)
                        # per confrontarli devo avere gli indirizzi della stringa
                        # il puntatore a quella stringa specifica 
                        # vado a lavorare su una nuova parte dello stack senza toccare quella vecchia
    pushl %ebp 
    movl %esp,%ebp      # prendo esp e lo metto come base 

    pushl %ebx 
    pushl %ecx 
    pushl %edx
# creo una variabile temporanea poi chiamo "controlla_ID"
trova_pilota:
movl $0, numero_id
leal pilot_0_str, %ebx
xorl %ecx, %ecx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_1_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_2_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_3_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_4_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_5_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_6_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_7_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_8_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_9_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_10_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_11_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_12_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_13_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_14_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_15_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_16_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_17_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_18_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola

xorl %ecx, %ecx
xorl %eax, %eax
leal pilot_19_str, %ebx
call controlla_ID
cmpl $0, %ebx
jne controlla_virgola
jmp invalid

.type controlla_ID, @function
controlla_ID:
	movb (%esi,%ecx), %dl   # sposto il carattere puntato nel file di input dereferenziato ecx in dh(nella parte alta)
	movb (%ebx,%ecx), %dh   # sposto il carattere della stringa del pilota che sto controllando deferenziato ecx in dl (nella parte bassa)
	cmpb %dl, %dh   # faccio il confronto
	je fine_stringa # se uguale controllo carattere per carattere
	cmpb $10, %dl   # controlllo se dl = \n
	je trova        # controllo se fine testo
	incl %edx
	incl numero_id
	xorl %ebx,%ebx
	jmp fine

	fine_stringa:
		cmpb $0, %dh
		jne incrementa
		cmpb $0, %dl
		jne incrementa
		trova:
		cmpb $0, %dh
		jne incrementa
		xorl %ebx, %ebx
		movl $1, %ebx
		incl %ecx
		jmp fine
		incrementa:
			incl %ecx
			jmp controlla_ID

fine:
	addl %ecx, %esi
	movl numero_id, %eax
	xorl %ecx,%ecx
	ret     

controlla_virgola:
    xorl %ecx, %ecx
    xorl %ebx, %ebx
    xorl %edx, %edx
controlla_virgola2:
    movb (%esi,%ecx),%dh
    inc %ecx 
    cmpb $0,%dh
    je ultima_riga
    check_virgola:
        cmp $44,%dh
        jne controlla_virgola2

    call atoi
    # a questo punto devo vedere se i due ID dei piloti coincidono altrimenti devo passare al prossimo

    cmpl %eax,%ebx
    jne prossima_riga
    # se diversi devo passare alla prossima riga 
    # se sono uguali vuol dire che devo stampare tutta la riga (però in orine diverso da come ricevo i dati)


    movl %esi,%edx                                      # mi salvo nel registro edx il puntatore alla stringa quindi inizia puntando il tempo
    call copy_funzione                                  # copio i caratteri fino ad arrivare alla virgola 
    # salvo la velocità all'interno di una variabile in quanto dovrò stamparli in ordine diverso 
    call atoi
    pushl %ebx                                          # salvo ebx ovverò la velocità sullo stack per poterla poppare quando sarà necessaro in quanto l'ordine di stampa è     
                                                        # diverso da ciò che riesco a ricavare dal file di input

    call atoi 
    
    
    confronto_rpm_max:  
        cmpl rpm_max,%ebx                               # comparo rmp_max con il valore di ebx che contiene l'rpm attuale
        jl verifica_rpm_alti                            # se inferiore non mi salvo il valore e passo alle eticchette di stampa (low, medium hight)
        movl %ebx,rpm_max                               # se maggiore mi salvo il valore di ebx in rpm_max
    
    verifica_rpm_alti:
        cmpl $10000,%ebx
        jg assenga_rpm_alti
        jle verifica_rpm_medi                   # se non è maggiore controllo se è nella categoria dei medi
            assenga_rpm_alti:
                leal HIGH,%edx                   # se è maggiore allora posso metterlo come valore HIGH
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_rpm
            
    verifica_rpm_medi:
        cmpl $5000,%ebx 
        jg comparazione2
        jl verifica_rpm_bassi                           # se non è maggiore controllo se è nella categoria dei bassi
            comparazione2:                              # se arrivo qui allora la sicuramente >5000
                cmpl $10000,%ebx                        # !!! ricontrollo che non sia maggiore di 10000
                jle assenga_rpm_medi      
                        assenga_rpm_medi:               # se arrivo qui allora sicuramente anche <= 10000 quindi (5000<x<10000)
                        leal MEDIUM,%edx                # se è maggiore allora lo metto come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_rpm

    verifica_rpm_bassi:
        cmpl $5000,%ebx
        jle assenga_rpm_bassi
            assenga_rpm_bassi:
                    leal LOW,%edx                       # se è maggiore allora lo metto come valore LOW
                    call copy_funzione                  # copio ciò che cè in edx nel file di output
                    jmp fine_rpm

    fine_rpm:
        movb $44,(%edi)
        incl %edi                                       # per non rischare di sovrascrivere

    call atoi
    
    confronto_temperatura_max:
        cmp temperatura_max,%ebx                        # comparo temperatura_max con il valore di ebx che effettivamente contiene l'rpm
        jl verifica_temperatura_alta                    # in caso sia minore vado a vedere che valore assegnargli(low medium high)
        movl %ebx,temperatura_max
    
    verifica_temperatura_alta:
        cmpl $110,%ebx
        jg assenga_temperatura_alta
        jle verifica_temperatura_media
            assenga_temperatura_alta:
                leal HIGH,%edx                           # se è maggiore allora posso metterlo come valore HIGH
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_temperatura
            
    verifica_temperatura_media:
        cmpl $90,%ebx 
        jg comparazionetmp2
        jle verifica_temperatura_bassa
            comparazionetmp2:                           # se arrivo qui allora è >90
                cmpl $110,%ebx                
                jle assenga_temperatura_media      
                        assenga_temperatura_media:      
                        leal MEDIUM,%edx                # lo salvo come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_temperatura

    verifica_temperatura_bassa:
        cmpl $90,%ebx
        jle assenga_temperatura_bassa
            assenga_temperatura_bassa:
                    leal LOW,%edx               # se è minore allora lo metto come valore LOW
                    call copy_funzione          # copio ciò che cè in edx nel file di output
                    jmp fine_temperatura

    fine_temperatura:
        movb $44,(%edi)
        incl %edi                       # per non rischare di sovrascrivere

    popl %ebx
    #
    confronto_velocita_max:
        cmp velocita_max,%ebx        
        jl verifica_velocita_alta    
        movl %ebx,velocita_max
    #
    verifica_velocita_alta:
        cmpl $250,%ebx
        jg assenga_velocita_alta
        jle verifica_velocita_media
            assenga_velocita_alta:
                leal HIGH,%edx                           # se è maggiore allora posso metterlo come valore HIGH
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_velocita
            
    verifica_velocita_media:
        cmpl $100,%ebx 
        jg comparazione3
        jle verifica_velocita_bassa
            comparazione3:                              # se arrivo qui allora è >100
                cmpl $250,%ebx                
                jle assenga_velocita_media   
                        assenga_velocita_media:        
                        leal MEDIUM,%edx                # lo metto come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_velocita

    verifica_velocita_bassa:
        cmpl $100,%ebx
        jle assenga_velocita_bassa
            assenga_velocita_bassa:
                    leal LOW,%edx               # se è minore allora posso metterlo come valore LOW
                    call copy_funzione          # copio ciò che cè in edx nel file di output
                    jmp fine_velocita

    fine_velocita:
        addl %ebx,somma_velocita    
        cmp $0,%ebx                     # comparo lo 0(null) con ebx se lo è allora non aggiungo nulla
        incl numero_righe
        movb $10,(%edi)                 # gli metto la virgola
        incl %edi
        jmp salva_posizione
    prossima_riga:
        movb (%esi,%ecx),%dh
        inc %ecx
        cmpb $10,%dh
        jne prossima_riga
        salva_posizione:
        addl %ecx,%esi
        jmp controlla_virgola

    ultima_riga:
        movl rpm_max,%ebx
        call itoa                   # trasformo il valore di rpm_max in una stringa
        movl $44,(%edi)             # ci aggiungo la virgola
        incl %edi                   # incremento edi
        movl temperatura_max,%ebx   # il ragionamento è analogo per le altre variabili
        call itoa
        movl $44,(%edi)
        incl %edi
        movl velocita_max,%ebx
        call itoa
        movl $44,(%edi)
        incl %edi
        movl somma_velocita,%eax
        movl numero_righe,%ebx
        xorl %edx,%edx
        divl %ebx
        movl %eax,%ebx
        call itoa
    jmp end                      # vado all'etichetta

# funzioni:

invalid:
    leal invalid_pilot_str,%edx     # stampo invalid
    call copy_funzione
    jmp end

copy_funzione:
    pushl %ebp  # devo modificare l'ebp
    pushl %ecx  
    pushl %eax                                 
    # adesso lo devo cambiare 
    movl %esp,%ebp
    xorl %ecx,%ecx          # lo resetto in quanto lo devo usare come indice per la deferenziazione 
    
    copy_loop:
        movb (%edx,%ecx),%ah        # ho estratto il carattere(edx[ecx] o *(edx+ecx))
        inc %ecx
        cmpb $0,%ah                 # quando io arrivo al terminatore capisco che sono arrivato alla fine e non copio !!!
        je return_copy
        movb %ah,(%edi)             # al posto di fare la deferenziazione incremento edi
        incl %edi
        cmpb $44,%ah                # qesto mi copia la virgola
        je return_copy              # se sono arrivato qui alla fine torno al coopy_loop di prima,significha che non ho trovato ne il terminatore ne la virgola 
        jmp copy_loop

    return_copy:
        movl %ebp,%esp 
        # faccio popl dei registri
        popl %eax
        popl %ecx
        popl %ebp
        ret 


atoi: # mi salvo il risultato in ebx
    pushl %ebp                      # pusho evetuali registri
    pushl %eax                      # me lo salvo perchè poi la mul me lo va a cambiare
    movl %esp,%ebp
    xorl %edx,%edx
    xorl %eax,%eax                  # vado ad azzerare sempre il contenuto di eax {che ricordiamo essere il contatore dei piloti}
    movl $10,%ebx                   
    # eax me lo devo salvare all'interno della funzione
    atoi_loop:
        movb (%esi,%ecx),%dl 
        cmpb $10,%dl               # comparo per vedere se trovo il carattere di terminazione
        je return_atoi
        cmpb $44,%dl               # comparo per vedere se trovo una virgola
        je return_atoi 
        mulw %bx                    # vado a moltiplicare *10 il valore di eax {che inizialmente è 0}
        movb (%esi,%ecx),%dl 
        incl %ecx                    # incremento ecx per puntare al carattere successivo 
        subb $48,%dl 
        addl %edx,%eax              # vado ad aggiungere il contenuto di eax in dl 
        jmp atoi_loop

    return_atoi:
        movl %eax,%ebx              # mi salvo l'ID del pilota in ebx per poterlo confrontare 
        movl %ebp,%esp              # da fare sempre
        popl %eax                   # ripristino il precedente eax 
        popl %ebp                   # ripristino il base ponter
        incl %ecx                   # occhio!
        ret 

itoa:
    pushl %ebp
    movl %esp,%ebp
    movl %ebx,%eax                 # metto ebx in eax per fare le divisioni e contare che potenza del 10 mi serve
    pushl %ebx                     # mi salvo ebx anche nello stack
    movl $10,%ebx                  
    xorl %ecx,%ecx                 # resetto ecx che userò da contatore per la potenza di 10
    esp_dieci:
        cmpl $10,%eax              # finchè la variabile da copiare è maggiore di 10 
        jle fine_esp_dieci
        xorl %edx,%edx
        divw %bx                   # la divido per 10 
        incb %cl                   # incremento in contatore
        jmp esp_dieci
    fine_esp_dieci:
        movl $1,%eax               # metto 1 in eax per poi moltiplicarla per 10 e ottenere la potenza di 10 che mi serve
        pushl %ecx                 # mi salvo il contatore che utilizzerò come indice anche nell'ultimo loop
    potenza:
        cmpb $0,%cl                # finchè il contatore è maggiore di 0 (se ecx 0, significa 10^0 == 1)
        je fine_potenza
        mull %ebx                  # moltiplico eax per 10
        subb $1,%cl     
        jmp potenza
    fine_potenza:
        movl %eax,%ebx             # sposto la potenza di 10 su ebx
        popl %ecx                  # in ecx ci rimetto il contatore
        popl %eax                  # in eax metto l'intero da copiare
        movb $10,%ch
    estrzione_cifre: 
        cmpb $0,%cl                # finchè il contatore è positivo 
        jl return_itoa
        xorl %edx,%edx
        divw %bx                   # estraggo la cifra più significativa
        addl $48,%eax              # aggiungo 48 per "convertirla" in char
        movb %al,(%edi)            # la copio nel file
        inc %edi
        pushl %edx                 # mi salvo il resto nello stack
        xorl %edx,%edx  
        movl %ebx,%eax             # metto la potenza di 10 per l'estrazione in eax
        movl $10,%ebx
        divw %bx                   # la divido per 10
        movl %eax,%ebx             # la rimetto in ebx per la prossima divisione
        popl %eax                  # riprendo il resto dallo stack
        subb $1,%cl                # decremento il contatore
        jmp estrzione_cifre
    return_itoa:
        movl %ebp,%esp
        popl %ebp
        ret

end:        
    popl %edx
    popl %ecx 
    popl %ebx
    movb $10,(%edi)
    incl %edi
    movb $0,(%edi)
    movl %ebp,%esp
    popl %ebp
    ret





/*
.section .data

pilot_0_str:
    .string   "Pierre Gasly\0"
pilot_1_str:
    .string   "Charles Leclerc\0"
pilot_2_str:
    .string   "Max Verstappen\0"
pilot_3_str:                       
    .string   "Lando Norris\0"
pilot_4_str:
    .string   "Sebastian Vettel\0"
pilot_5_str:
    .string   "Daniel Ricciardo\0"
pilot_6_str: 
    .string   "Lance Stroll\0"
pilot_7_str:
    .string   "Carlos Sainz\0"
pilot_8_str:
    .string   "Antonio Giovinazzi\0"
pilot_9_str:
    .string   "Kevin Magnussen\0"
pilot_10_str:
    .string  "Alexander Albon\0"
pilot_11_str:
    .string  "Nicholas Latifi\0"
pilot_12_str:
    .string  "Lewis Hamilton\0"
pilot_13_str:
    .string  "Romain Grosjean\0"
pilot_14_str:
    .string  "George Russell\0"
pilot_15_str:
    .string  "Sergio Perez\0"
pilot_16_str:
    .string  "Daniil Kvyat\0"
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"
pilot_19_str:
    .string  "Valtteri Bottas\0"


invalid_pilot_str:	
.string "Invalid\0"

LOW:
    .string "LOW\0"

MEDIUM:
    .string "MEDIUM\0"

HIG:
    .string "HIGH\0"

# Variabili dove devo salvare il max,medium,min,sommavelocità e numero righe per la creazione delll'ultima riga
rpm_max:
    .long 0
temperatura_max:
    .long 0
velocita_max:   
    .long 0
somma_velocita:
    .long 0
numero_righe:
    .long 0


.section .text
    .global telemetry

telemetry:
    movl 4(%esp),%esi   # salvo l'indirizzo della stringa in esi
    movl 8(%esp),%edi   # salvo l'output{ovvero dove scriverò}
                        # per confrontarli devo avere gli indirizzi della stringa
                        # il puntatore a quella stringa specifica 
                        # vado a lavorare su una nuova parte dello stack senza toccare quella vecchia
    pushl %ebp 
    movl %esp,%ebp      # prendo esp e lo metto come base 

    pushl %ebx 
    pushl %ecx 
    pushl %edx

caricamento_registro:
    leal pilot_19_str,%ebx
    pushl %ebx

    leal pilot_18_str,%ebx
    pushl %ebx

    leal pilot_17_str,%ebx
    pushl %ebx

    leal pilot_16_str,%ebx
    pushl %ebx

    leal pilot_15_str,%ebx
    pushl %ebx

    leal pilot_14_str,%ebx
    pushl %ebx

    leal pilot_13_str,%ebx
    pushl %ebx

    leal pilot_12_str,%ebx
    pushl %ebx 

    leal pilot_11_str,%ebx
    pushl %ebx 

    leal pilot_10_str,%ebx
    pushl %ebx

    leal pilot_9_str,%ebx
    pushl %ebx

    leal pilot_8_str,%ebx
    pushl %ebx

    leal pilot_7_str,%ebx
    pushl %ebx

    leal pilot_6_str,%ebx
    pushl %ebx

    leal pilot_5_str,%ebx
    pushl %ebx

    leal pilot_4_str,%ebx
    pushl %ebx

    leal pilot_3_str,%ebx
    pushl %ebx

    leal pilot_2_str,%ebx
    pushl %ebx

    leal pilot_1_str,%ebx
    pushl %ebx

    leal pilot_0_str,%ebx
    pushl %ebx


movl $0,%eax    # parto dal primo pilota
jmp etichetta

controllo_ID_pilota:        
    inc %eax
    etichetta:
        cmp $20,%eax            # se arriva a 20 allora so che ho superato tutti i piloti quindi sarà sicuramente invalido
        je fail                 # se è uguale mi salti nella funzione fail
        xorl %ecx,%ecx          # resetto ecx  
        popl %ebx               # sto tirando fuori dallo stack il pilota{mi salvo la stringa da controllare}

        ciclo_confronto:            
            # cmp (%esi,%ecx),(%ebi,%ecx) = "to many references" perchè accede troppe volte alla memoria 
            movb (%esi,%ecx),%dh   # (esi[ecx]),sposto il carattere puntato nel file di input dereferenziato ecx in dh{nella parte alta}
            movb (%ebx,%ecx),%dl   # (ebx[ecx]),sposto il carattere della stringa del pilota che sto controllando deferenziato ecx in dl{nella parte bassa}
            inc %ecx       

            if_terminatori:
                cmpb $10,%dh                # controllo se è uguale al carattere di terminazione,se si allora devo controllare che anche l'altro lo sia,l'unico caso in cui quando i caratteri sono diversi hai capito che sei arrivato alla fine 
                jne end_if_terminatori
                cmpb $0,%dl                 # se è uguale allora sono arrivato ad entrambi i terminatori quindi è corretto quindi ho trovato il mio pilota 
                je end_controllo_ID_pilota
                jmp controllo_ID_pilota     # qui si capisce che sono diversi in quanto uno dei due è arrivato al carattere di terminazione 

            end_if_terminatori:
                cmpb %dh,%dl                # confronto i due caratteri 
                je ciclo_confronto          # controllo che i due caratteri siano uguali se lo sono torno al ciclo di confronto confrontando i prossimi caratteri
                jmp controllo_ID_pilota     # se non sono uguali salta a controllare il pilota successivo

end_controllo_ID_pilota:                # nota in eax cè l'ID del pilota 
                                        # in esi ho il puntatore alla prossima riga 
    addl %ecx,%esi                      # così le linee passate non servono più salvarle,ecx lo posso resettare 
    xorl %ecx,%ecx      

controllo_fino_alla_virgola:
    movb (%esi,%ecx),%dh
    inc %ecx 
    cmpb $0,%dh
    je ultima_riga
    check_virgola:
        cmp $44,%dh
        jne controllo_fino_alla_virgola

    call atoi
    # a questo punto devo vedere se i due ID dei piloti coincidono altrimenti devo passare al prossimo

    cmpl %eax,%ebx
    jne prossima_riga
    # se diversi devo passare alla prossima riga 
    # se sono uguali vuol dire che devo stampare tutta la riga {però in orine diverso da come ricevo i dati!!!}


    movl %esi,%edx                                      # mi salvo nel registro edx il puntatore alla stringa quindi inizia puntando il tempo
    call copy_funzione                                  # copio i caratteri fino ad arrivare alla virgola 
    # salvo la velocità all'interno di una variabile in quanto dovrò stamparli in ordine diverso 
    call atoi
    pushl %ebx                                          # salvo ebx ovverò la velocità sullo stack per poterla poppare quando sarà necessaro in quanto l'ordine di stampa è     
                                                        # diverso da ciò che riesco a ricavare dal file di input

    call atoi 
    
    confronto_rpm_max:  
        cmpl rpm_max,%ebx                               # comparo rmp_max con il valore di ebx che effettivamente contiene l'rpm
        jl verifica_rpm_alti                            # faccio saltare nella prima verifica tanto si va a posizionare in base al valore
        movl %ebx,rpm_max                               # altrimenti sposto ciò che cè in ebx in rpm max poi inizia a posizionarsi
    
    verifica_rpm_alti:
        cmpl $10000,%ebx
        jg assenga_rpm_alti
        jle verifica_rpm_medi
            assenga_rpm_alti:
                leal HIG,%edx                           # se è maggiore allora posso metterlo come valore HIG
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_assegnamento_rpm
            
    verifica_rpm_medi:
        cmpl $5000,%ebx 
        jg comparazione2
        jl verifica_rpm_bassi
            comparazione2:                              # se arrivo qui allora la sicuramente >5000
                cmpl $10000,%ebx                
                jle assenga_rpm_medi      
                        assenga_rpm_medi:               # se arrivo qui allora sicuramente anche <= 10000 quindi (5000<x<10000)
                        leal MEDIUM,%edx                # se è maggiore allora posso metterlo come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_assegnamento_rpm

    verifica_rpm_bassi:
        cmpl $5000,%ebx
        jle assenga_rpm_bassi
            assenga_rpm_bassi:
                    leal LOW,%edx                       # se è maggiore allora posso metterlo come valore LOW
                    call copy_funzione                  # copio ciò che cè in edx nel file di output
                    jmp fine_assegnamento_rpm

    fine_assegnamento_rpm:
        movb $44,(%edi)
        incl %edi                                       # cosi da non rischare di sovrascrivere

    call atoi
    
    confronto_temperatura_max:
        cmp temperatura_max,%ebx                        # comparo temperatura_max con il valore di ebx che effettivamente contiene l'rpm
        jl verifica_temperatura_alta                    # faccio saltare nella prima verifica tanto si va a posizionare in base al valore
        movl %ebx,temperatura_max
    
    verifica_temperatura_alta:
        cmpl $110,%ebx
        jg assenga_temperatura_alta
        jle verifica_temperatura_media
            assenga_temperatura_alta:
                leal HIG,%edx                           # se è maggiore allora posso metterlo come valore HIG
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_assegnamento_temperatura
            
    verifica_temperatura_media:
        cmpl $90,%ebx 
        jg comparazionetmp2
        jle verifica_temperatura_bassa
            comparazionetmp2:                           # se arrivo qui allora la sicuramente >5000
                cmpl $110,%ebx                
                jle assenga_temperatura_media      
                        assenga_temperatura_media:      # se arrivo qui allora sicuramente anche <= 10000 quindi (5000<x<10000)
                        leal MEDIUM,%edx                # se è maggiore allora posso metterlo come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_assegnamento_temperatura

    verifica_temperatura_bassa:
        cmpl $90,%ebx
        jle assenga_temperatura_bassa
            assenga_temperatura_bassa:
                    leal LOW,%edx               # se è maggiore allora posso metterlo come valore LOW
                    call copy_funzione          # copio ciò che cè in edx nel file di output
                    jmp fine_assegnamento_temperatura

    fine_assegnamento_temperatura:
        movb $44,(%edi)
        incl %edi                       # cosi da non rischare di sovrascrivere

    popl %ebx
    #
    confronto_velocita_max:
        cmp velocita_max,%ebx        
        jl verifica_velocita_alta    
        movl %ebx,velocita_max
    #
    verifica_velocita_alta:
        cmpl $250,%ebx
        jg assenga_velocita_alta
        jle verifica_velocita_media
            assenga_velocita_alta:
                leal HIG,%edx                           # se è maggiore allora posso metterlo come valore HIG
                call copy_funzione                      # copio ciò che cè in edx nel file di output
                jmp fine_assegnamento_velocita
            
    verifica_velocita_media:
        cmpl $100,%ebx 
        jg comparazione3
        jle verifica_velocita_bassa
            comparazione3:                              # se arrivo qui allora la sicuramente >5000
                cmpl $250,%ebx                
                jle assenga_velocita_media   
                        assenga_velocita_media:         # se arrivo qui allora sicuramente anche <= 10000 quindi (5000<x<10000)
                        leal MEDIUM,%edx                # se è maggiore allora posso metterlo come valore MEDIUM
                        call copy_funzione              # copio ciò che cè in edx nel file di output
                        jmp fine_assegnamento_velocita

    verifica_velocita_bassa:
        cmpl $100,%ebx
        jle assenga_velocita_bassa
            assenga_velocita_bassa:
                    leal LOW,%edx               # se è maggiore allora posso metterlo come valore LOW
                    call copy_funzione          # copio ciò che cè in edx nel file di output
                    jmp fine_assegnamento_velocita

    fine_assegnamento_velocita:
        addl %ebx,somma_velocita    
        cmp $0,%ebx                     # comparo lo 0 con ebx se lo è allora non aggiungo nulla
        incl numero_righe
        movb $10,(%edi)                 # gli metto la virgola
        incl %edi
        jmp end_controllo_ID_pilota
    prossima_riga:
        movb (%esi,%ecx),%dh
        inc %ecx
        cmpb $10,%dh
        jne prossima_riga
        jmp end_controllo_ID_pilota

    ultima_riga:
        movl rpm_max,%ebx
        call itoa                   # trasformo il valore di rpm_max in una stringa
        movl $44,(%edi)             # ci aggiungo la virgola
        incl %edi                   # incremento edi
        movl temperatura_max,%ebx   # il ragionamento è analogo per tutti i valori delle altre variabili
        call itoa
        movl $44,(%edi)
        incl %edi
        movl velocita_max,%ebx
        call itoa
        movl $44,(%edi)
        incl %edi
        movl somma_velocita,%eax
        movl numero_righe,%ebx
        xorl %edx,%edx
        divl %ebx
        movl %eax,%ebx
        call itoa
    jmp return                      # vado al ritorno 

# funzioni:

fail:
    leal invalid_pilot_str,%edx
    call copy_funzione
    jmp return

copy_funzione:
    pushl %ebp  # devo modificare l'ebp
    pushl %ecx  
    pushl %eax                                 
    # adesso lo devo cambiare 
    movl %esp,%ebp
    xorl %ecx,%ecx          # lo resetto in quanto lo devo usare come indice per la deferenziazione 
    
    copy_loop:
        movb (%edx,%ecx),%ah        # ho estratto il carattere(edx[ecx] o *(edx+ecx))
        inc %ecx
        cmpb $0,%ah                 # quando io arrivo al terminatore capisco che sono arrivato alla fine e non copio !!!
        je return_copy
        movb %ah,(%edi)             # al posto di fare la deferenziazione incremento edi
        incl %edi
        cmpb $44,%ah                # qesto mi copia la virgola
        je return_copy
                                    # se sono arrivato qui alla fine torno al coopy_loop di prima,significha che non ho trovato ne il terminatore ne la virgola 
        jmp copy_loop

    return_copy:
        movl %ebp,%esp 
        # poppo eventuali registri
        popl %eax
        popl %ecx
        popl %ebp
        ret 


atoi: # mi salvo il risultato in ebx
    pushl %ebp                      # pusho evetuali registri
    pushl %eax                      # me lo salvo perchè poi la mul me lo va a cambiare
    movl %esp,%ebp
    xorl %edx,%edx
    xorl %eax,%eax                  # vado ad azzerare sempre il contenuto di eax {che ricordiamo essere il contatore dei piloti}
    movl $10,%ebx                   
    # eax me lo devo salvare all'interno della funzione
    atoi_loop:
        movb (%esi,%ecx),%dl 
        cmpb $10,%dl               # comparo per vedere se trovo il carattere di terminazione
        je ret_atoi
        cmpb $44,%dl               # comparo per vedere se trovo una virgola
        je ret_atoi 
        mulw %bx                    # vado a moltiplicare *10 il valore di eax {che inizialmente è 0}
        movb (%esi,%ecx),%dl 
        incl %ecx                    # incremento ecx per puntare al carattere successivo 
        subb $48,%dl 
        addl %edx,%eax              # vado ad aggiungere il contenuto di eax in dl 
        jmp atoi_loop

    ret_atoi:
        movl %eax,%ebx              # mi salvo l'ID del pilota in ebx per poterlo confrontare 
        movl %ebp,%esp              # da fare sempre
        popl %eax                   # ripristino il precedente eax 
        popl %ebp                   # ripristino il base ponter
        incl %ecx                   # occhio!
        ret 

itoa:
    pushl %ebp
    movl %esp,%ebp
    movl %ebx,%eax                 # metto ebx in eax per fare le divisioni e contare che potenza del 10 mi serve
    pushl %ebx                     # mi salvo ebx anche nello stack
    movl $10,%ebx                  
    xorl %ecx,%ecx                 # resetto ecx che userò da contatore per la potenza di 10
    esp_dieci:
        cmpl $10,%eax              # finchè la variabile da copiare è maggiore di 10 
        jle fine_esp_dieci
        xorl %edx,%edx
        divw %bx                   # la divido per 10 
        incb %cl                   # incremento in contatore
        jmp esp_dieci
    fine_esp_dieci:
        movl $1,%eax               # metto 1 in eax per poi moltiplicarla per 10 e ottenere la potenza di 10 che mi serve
        pushl %ecx                 # mi salvo il contatore che utilizzerò come indice anche nell'ultimo loop
    potenza:
        cmpb $0,%cl                # finchè il contatore è maggiore di 0 (se ecx 0, significa 10^0 == 1)
        je fine_potenza
        mull %ebx                  # moltiplico eax per 10
        subb $1,%cl     
        jmp potenza
    fine_potenza:
        movl %eax,%ebx             # sposto la potenza di 10 su ebx
        popl %ecx                  # in ecx ci rimetto il contatore
        popl %eax                  # in eax metto l'intero da copiare
        movb $10,%ch
    estrzione_cifre: 
        cmpb $0,%cl                # finchè il contatore è positivo 
        jl ret_itoa
        xorl %edx,%edx
        divw %bx                   # estraggo la cifra più significativa
        addl $48,%eax              # aggiungo 48 per "convertirla" in char
        movb %al,(%edi)            # la copio nel file
        inc %edi
        pushl %edx                 # mi salvo il resto nello stack
        xorl %edx,%edx  
        movl %ebx,%eax             # metto la potenza di 10 per l'estrazione in eax
        movl $10,%ebx
        divw %bx                   # la divido per 10
        movl %eax,%ebx             # la rimetto in ebx per la prossima divisione
        popl %eax                  # riprendo il resto dallo stack
        subb $1,%cl                # decremento il contatore
        jmp estrzione_cifre
    ret_itoa:
        movl %ebp,%esp
        popl %ebp
        ret

return:        
    popl %edx
    popl %ecx 
    popl %ebx
    movb $10,(%edi)
    incl %edi
    movb $0,(%edi)
    movl %ebp,%esp
    popl %ebp
    ret

*/
