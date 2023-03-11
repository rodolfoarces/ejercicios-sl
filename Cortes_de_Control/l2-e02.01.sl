Objetivo:
	Informe con datos de cajas (Logica de programación avanzanda, Apendice B, 2. Cortes de control, Ejercicio 2.1, B-4)

Entorno:
	W_ID_ANTERIOR 		es numerico
	W_TOTAL_GENERAL		es numerico
	W_TOTAL_REPUESTO	es numerico
	archivo REPUESTO
		registro REG_REPUESTO
			NRO_REPUESTO	es numerico
			DESCRIPCION		es numerico
			PRECIO_UNIT		es numerico
			CANT_VENDIDA	es numerico
		fin_registro
	prefijo REP

Cuerpo principal:
inicio
	ejecutar PROCESO_INICIAL
	mientras NRO_REPUESTO <> 0
		ejecutar PROCESO_PRINCIPAL
	fin_mientras
	ejecutar PROCESO_FINAL
fin

Rutinas:
PROCESO_INICIAL:
	ejecutar IMPRIMIR_PANTALLA_INICIAL
	ejecutar INICIALIZAR_VARIABLES
	ejecutar ABRIR_ARCHIVO_REPUESTO
	ejecutar LEER_SIG_ID
retorno

PROCESO_PRINCIPAL:
	ejecutar CALCULAR_VENTAS
	ejecutar LEER_SIG_ID
retorno

PROCESO_FINAL:
	ejecutar CERRAR_ARCHIVO_REPUESTO
	imprimir "*** Fin del proceso ***"
retorno

IMPRIMIR_PANTALLA_INICIAL:
	imprimir "VENTAS DE REPUESTOS"
	imprimir "Nro Repuesto		DESCRIPCION		TOTAL DE VENTAS"
retorno

INICIALIZAR_VARIABLES:
	W_ID_ANTERIOR = 01
	W_TOTAL_REPUESTO = 0
	W_TOTAL_GENERAL = 0
retorno

ABRIR_ARCHIVO_REPUESTO:
	abrir REPUESTO
retorno

LEER_SIG_ID:
	si eof(REPUESTO)
		NRO_REPUESTO = 0
	sino
		leer REG_REPUESTO
	fin_si
retorno

CALCULAR_VENTAS:
	mientras NRO_REPUESTO <> 0
		si REP_NRO_REPUESTO == W_ID_ANTERIOR
			W_TOTAL_REPUESTO = W_TOTAL_REPUESTO + REP_CANTIDAD_VENDIDA
			W_TOTAL_GENERAL = W_TOTAL_GENERAL + REP_CANTIDAD_VENDIDA
		sino:
			IMPRIMIR_DATOS
			W_ID_ANTERIOR = REP_NRO_REPUESTO
			W_TOTAL_REPUESTO = REP_CANTIDAD_VENDIDA
		fin_si
	fin_mientras
	imprimir "Totales generales: ", W_TOTAL_GENERAL
retorno

IMPRIMIR_DATOS
	imprimir "NRO_REPUESTO, DESCRIPCION, W_TOTAL_REPUESTO"
retorno

CERRAR_ARCHIVO_REPUESTO
	cerrar REPUESTO
retorno
