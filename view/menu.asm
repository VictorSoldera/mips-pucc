	.include "../utils.asm"
	.include "../controller/read.asm"
	.include "../controller/per-ranking.asm"
	.include "../controller/per-category.asm"
	.include "../controller/per-month.asm"
	.include "../controller/list.asm"
	.include "../controller/delete.asm"

	.data
	recebeString:		.space		16

	str1: 			.asciiz 	"1. Registrar Despesa \n"
	str2: 			.asciiz 	"2. Listar Despesas \n"
  	str3: 			.asciiz 	"3. Excluir Despesa \n"
	str4: 			.asciiz 	"4. Exibir gasto mensal \n"
	str5: 			.asciiz 	"5. Exibir gasto por categoria \n"
	str6: 			.asciiz 	"6. Exibir ranking de despesa \n"
	str7:  			.asciiz 	"7. Sair \n\n"
	
	strOpc:			.asciiz 	"Digite a opcao desejada: "
	strDia:	 		.asciiz		"Digite o dia da despesa: "
	strMes:			.asciiz		"Digite o mes da despesa: "
	strAno:			.asciiz		"Digite o ano da despesa: "
	strTipoDespesa:  	.asciiz 	"Digite o tipo de despesa: "
	strGasto: 		.asciiz 	"Digite o valor gasto em reais: "
	
	
	exibID:			.asciiz		"O ID da despesa é: "			
	exibData: 		.asciiz 	"A data da despesa é: "
	exibTipo:		.asciiz 	"O tipo da despesa é: "
	exibValor:		.asciiz		"O valor gasto é: "
	
	excluirDespesa: 	.asciiz 	"Digite o ID da despesa que deseja excluir: "
	
	exibMensal: 		.asciiz 	"O valor total de gastos no mes foi: "
	
	exibCategoria: 		.asciiz 	"O valor total de gastos por categoria foi: "
	
	exibRanking:		.asciiz		"----------RANKING----------"
	
	.text
	.globl main
	
main:

	li $v0, 4
  	la $a0, str1
  	syscall
 
  	li $v0, 4
  	la $a0, str2
  	syscall
 
  	li $v0, 4
  	la $a0, str3
  	syscall
 
  	li $v0, 4
  	la $a0, str4
  	syscall
 
  	li $v0, 4
  	la $a0, str5
  	syscall

 	li $v0, 4
  	la $a0, str6
  	syscall 
  	
  	li $v0, 4
  	la $a0, str7
  	syscall
  	
  	li $v0, 4
  	la $a0, strOpc
  	syscall
  	
  	li $v0, 5
  	syscall
  	
  	beq $v0, 1, registrarDespesa
  	beq $v0, 2, listaDespesa
  	beq $v0, 3, excluiDespesa	
  	beq $v0, 4, exibirMensal
  	beq $v0, 5, exibirCategoria
  	beq $v0, 6, exibirRanking	
   	beq $v0, 7, Exit
	j main

#---------------------------------------#
 Exit: 
  	end_program