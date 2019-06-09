        .data
input:  .space 9
result: .word 0
ans:    .asciiz "Der Wert ist "
endl:   .asciiz "\n"

        # t0 - Zum Zwischenspeichern eines Zeichens
        # a1 - Zum Zwischenspeichern der aktuellen String-Postion

        .text
main:
        li      $v0, 8          # 8: read_str
        la      $a0, input      # Zieladresse des einzugebenden Textes
        li      $a1, 9          # maximale Laenge
        syscall

	      li 	$t5, 48		# ASCII("0") = 48
        li 	$t6, 49		# ASCII("1") = 49

        li 	$t7, 0		# Initialisiere Ergebnis

        # ==============================
        # Fuegen Sie hier Ihre Loesung ein
        # ==============================
        la  $a1, input
nextCh: lb  $t0, $a0
        beqz  $t0, strEnd
        sll $t7, $t7, 1
        beq $t0, $t5, null
        beq $t0, $t6, eins
        # b error

        # ==============================
        # Ende Ihrer Loesung
        # ==============================
null:				# Bit war 0
        addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	      j 	nextCh

eins:		# Bit war 1
        # ==============================
        # Fuegen Sie hier Ihre Loesung ein
        # ==============================
        addi $t7, $t7, 1
        # ==============================
        # Ende Ihrer Loesung
        # ==============================
        addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
        j 	nextCh

strEnd: li      $v0, 4 		# 4: print_str
        la      $a0, endl       # Uebergebe Adresse des Strings
        syscall			# Gebe Newline aus

        li      $v0, 4 		# 4: print_str
	      la      $a0, ans        # Uebergebe Adresse des Strings
        syscall			# Gebe Ergebnis-String aus

        li      $v0, 1 		# 4: print_int
        move    $a0, $t7        # Verschiebe Ergebnis
        syscall			# Gebe Ergebnis aus

        li      $v0, 4 		# 4: print_str
        la      $a0, endl       # Uebergebe Adresse des Strings
	      syscall			# Gebe Newline aus

        li      $v0,10
        syscall                 # au revoir...
