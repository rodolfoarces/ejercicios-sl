Objetivo:
	Resumen de profesionales por departamento (Introducción a la lógica de programación, Apendice B, 4. Cuadros, Ejericio 4.1, l1-4.1)
	
ENTORNO
	W_NOMBRE 			es alfanumériico
	W_COD_PROFESION 	es numériico
	W_COD_DEPARTAMENTO	es numériico
	MAT_PROFESIONALES	es tabla(6,5) numérica
	
	VEC_TITULO 			es tabla(4) alfanumérica
	F 					es numérico
	C					es numérico

CUERPO PRINCIPAL
inicio
	ejecutar PROCESO_INICIAL
		mientras W_NOMBRE <> ""
			ejecutar PROCESO_PRINCIPAL
		fin_mienttras
	ejecutar PROCESO_FINAL
fin

RUTINAS
PROCESO_INICIAL:
	imprimir "CUADRO DE PROFESIONALES"
	ejecutar INICIALIZAR_MATRIZ
	ejecutar INGRESAR_NOMBRE
retorno

PROCESO_PRINCIPAL:
	ejecutar INGRESAR_DATOS_PROFESIONAL
	ejecutar PROCESAR_PROFESIONAL
	ejecutar INGRESAR_NOMBRE
retorno

PROCESO_FINAL:
	ejecutar IMPRIMIR_CUADRO
	imprimir "** FIN DEL PROCESO **"
retorno

INICIALIZAR_MATRIZ:
	desde F=1 hasta 6
		desde C=1 hasta 5
			MAT_PROFESIONALES(F,C) = 0
		fin_desde
	fin_desde
retorno

INGRESAR_NOMBRE:
	ingresar "Nombre del profesional (Enter p/ fin):", W_NOMBRE
retorno

INGRESAR_DATOS_PROFESIONAL:
	repetir
		ingresar "Código de profesión (1-Médico, 2-Abogado, 3-Ingeniero, 4-Arquitecto:", W_COD_PROFESION
	hasta (W_COD_PROFESION = 1 or 2 or 3 or 4)
	repetir
		ingresar "Nro de departamento (1-Conecpcion, 2-San Pedro, 3-Itapua, 4-Central, 5-Misiones:", W_COD_DEPARTAMENTO
	hasta (W_COD_DEPARTAMENTO = 1 or 2 or 3 or 4 or 5)
retorno

PROCESAR_PROFESIONAL:
	MAT_PROFESIONALES(W_COD_DEPARTAMENTO,W_COD_PROFESION) = MAT_PROFESIONALES(W_COD_DEPARTAMENTO,W_COD_PROFESION) + 1
	MAT_PROFESIONALES(W_COD_DEPARTAMENTO,5) = MAT_PROFESIONALES(W_COD_DEPARTAMENTO,5) + 1
	MAT_PROFESIONALES(6,W_COD_PROFESION) = MAT_PROFESIONALES(6,W_COD_PROFESION) + 1
	MAT_PROFESIONALES(6,5) = MAT_PROFESIONALES(6,5) + 1
retorno

IMPRIMIR_CUADRO:
	ejecutar PREPARAR_TITULOS
	ejecutar IMPRIMIR_DETALLE
retorno

PREPARAR_TITULOS:
	imprimir "DEPARTAMENTO\PROFESION Médicos Abogados Ingenieros  Arquitects TOTALES"
	VEC_TITULO(1) = "Concepción"
	VEC_TITULO(2) = "San Pedro"
	VEC_TITULO(3) = "Itapua"
	VEC_TITULO(4) = "Central"
	VEC_TITULO(5) = "Misiones"
	VEC_TITULO(6) = "TOTALES"
retorno

IMPRIMIR_DETALLE:
	desde F=1 hasta 6
		imprimir VEC_TITULO(F)
		desde C=1 hasta 5
			imprimir MAT_PROFESIONALES(F,C)
		fin_desde
	fin_desde
retorno