Objetivo:
Informe con datos de cajas (B-1, 1.1)

Entorno:
	W_ID_ANTERIOR 	es numerico
    archivo CAJAS
        registro REG_CAJA
            ID          es numerico
            ALTO        es numerico
            ANCHO       es numerico
            LARGO       es numerico
            DIAGONAL    es numerico
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
    ejecutar LEER_SIG_ID
retorno

PROCESO_PRINCIPAL:
    ejecutar CALCULAR_DIMENSIONES
    ejecutar IMPRIMIR_DIMENSIONES
    ejecutar LEER_SIG_ID
retorno

PROCESO_FINAL:
    ejecutar CERRAR_ARCHIVO_CAJAS
    imprimir "*** Fin del proceso ***"
retorno

IMPRIMIR_PANTALLA_INICIAL:
	imprimir "Calcular dimesiones"
	imprimir "ID	Alto	Ancho	Largo	Diagonal"
retorno

ABRIR_ARCHIVO_CAJAS:
	abrir CAJAS
retorno

LEER_SIG_ID:
	si eof(CAJAS)
		CAJA_ID = 0
	sino
		leer REG_CAJA
retorno

CALCULAR_DIMENSIONES:
	/* Funcion sqrt() es la raiz segun documentacion SL (libro-sl.pdf Pag 35) */
	
	CAJA_DIAGONAL = sqrt(CAJA_ALTO^2 + CAJA_ANCHO^2 + CAJA_LARGO^2)
retorno

IMPRIMIR_DIMENSIONES
	imprimir CAJA_ID, CAJA_ALTO, CAJA_ANCHO, CAJA_LARGO, CAJA_DIAGONAL
retorno

CERRAR_ARCHIVO_CAJAS
	cerrar CAJAS
retorno
