Objetivo:
Informe con datos de cajas (Lógica de Programación Avanzada, Apendice B, 1. Problemas inciales, Ejercicio 1.2, Pág B-2)

Entorno:
	W_ID_ANTERIOR 	es numerico
	W_DIAGONAL		es numerico
	VEC_TOTALES		es tabla(7) numerico
	W_INDICE		es numerico
	archivo CAJAS
		registro REG_CAJA
			ID	es numerico
			ALTO	es numerico
			ANCHO	es numerico
			LARGO	es numerico
		fin_registro
	prefijo CAJA

Cuerpo principal:
inicio
	ejecutar PROCESO_INICIAL
	mientras CAJA_ID <> 0
		ejecutar PROCESO_PRINCIPAL
	fin_mientras
	ejecutar PROCESO_FINAL
fin

Rutinas:
PROCESO_INICIAL:
	ejecutar IMPRIMIR_PANTALLA_INICIAL
	ejecutar ABRIR_ARCHIVO_CAJAS
	ejecutar LEER_SIG_ID
retorno

PROCESO_PRINCIPAL:
		ejecutar CALCULAR_DIMENSIONES
		ejecutar LEER_SIG_ID
retorno

PROCESO_FINAL:
	ejecutar IMPRIMIR_DIMENSIONES
	ejecutar CERRAR_ARCHIVO_CAJAS
	imprimir "*** Fin del proceso ***"
retorno

IMPRIMIR_PANTALLA_INICIAL:
	imprimir "Calcular dimesiones"
	imprimir "Esferas: 2  4  6  8  10  12 Otros"
retorno

ABRIR_ARCHIVO_CAJAS:
	abrir CAJAS
retorno

LEER_SIG_ID:
	si eof(CAJAS)
		CAJA_ID = 0
	sino
		leer REG_CAJA
	fin_si
retorno

CALCULAR_DIMENSIONES:
	W_DIAGONAL = (CAJA_ALTO^2 + CAJA_ANCHO^2 + CAJA_LARGO^2)^1/2
	W_INDICE = int[W_DIAGONAL/2] + 1
	si W_INDICE <= 6:
		VEC_TOTALES(W_INDICE) = VEC_TOTALES(W_INDICE) + 1
	sino
		VEC_TOTALES(7) = VEC_TOTALES(7) + 1
	fin_si
retorno

IMPRIMIR_DIMENSIONES
	desde W_INDICE=1 hasta 7
		imprimir VEC_TOTALES(W_INDICE)
	fin_desde
retorno

CERRAR_ARCHIVO_CAJAS
	cerrar CAJAS
retorno
