Autor/a: D. Lukoski

OBJETIVO:

Imprimir la planilla de temperaturas del día.

ENTORNO   
archivo  TEMPERAT
    registro  REG_TEMPERAT
	HORA    es numerico
	MINUTO   es numerico
	SEGUNDO      es numerico
	TEMPERATURA es numerico 
    fin_registro
prefijo TEM
W_HORA_ANT	es numerico
W_MINUTO_ANT	es numerico
IMP_HORA	es alfanumerico
IMP_MINUTO	es alfanumerico
ACU_TEMP_HORA	es numerico
ACU_TEMP_MINUTO	es numerico
ACU_TEMP_DIA	es numerico
CON_TEMP_HORA	es numerico
CON_TEMP_MINUTO	es numerico
CON_TEMP_DIA	es numerico
CON_PAGINA	es numerico
CON_LINEA	es numerico
 
CUERPO PRINCIPAL
inicio   
    ejecutar  PROCESO_INICIAL
    mientras  TEM_HORA  <>  0
	ejecutar  PROCESO_PRINCIPAL
    fin_mientras
    ejecutar  PROCESO_FINAL
fin
  
RUTINAS
PROCESO_INICIAL:
    imprimir  “Planilla  de  Temperaturas  del  día"
    ejecutar  ABRIR_ARCHIVO_TEMPERAT
    ejecutar  INICIALIZAR_DATOS
    ejecutar  IMPRIMIR_TITULOS
    ejecutar  LEER_SGTE_TEMPERAT
retorno

PROCESO_PRINCIPAL:
    ejecutar INICIO_HORA
    mientras TEM_HORA  =  W_HORA_ANT
	ejecutar  INICIO_MINUTO   
	mientras TEM_MINUTO  =  W_MINUTO_ANT  and TEM_HORA  =  W_HORA_ANT
	    ejecutar  PROCESAR_TEMPERATURA
	fin_mientras   
	ejecutar CORTE_MINUTO
    fin_mientras   
    ejecutar  CORTE_HORA   
retorno   

PROCESO_FINAL:   
    ejecutar IMPRIMIR_DATOS_GENERALES
    ejecutar CERRAR_ARCHIVO_TEMPERAT
    imprimir “**  FIN  DE  PROCESO  **"
retorno

ABRIR_ARCHIVO_TEMPERAT:   
    abrir  TEMPERAT   
retorno   

INICIALIZAR_DATOS:
    CON_PAGINA  =  1
    CON_LINEA  =  99
    ACU_TEMP_DIA  =  0
    CON_TEMP_DIA  =  0   
retorno
 
IMPRIMIR_TITULOS:   
    si CON_LINEA  >  66
	imprimir  “HORA   MINUTO     SEGUNDO TEMPERATURA"
	imprimir  “-------------------------------------------------------------------------------"
	CON_LINEA  =  2
	CON_PAGINA  =  CON_PAGINA  +  1
    fin_si
    CON_LINEA  =  CON_LINEA  +  1   
retorno

LEER_SGTE_TEMPERAT:   
    si    eof(TEMPERAT)   
	TEM_HORA  =  0
    sino
	leer  REG_TEMPERAT
    fin_si
retorno

INICIO_HORA:   
    W_HORA_ANT  =  TEM_HORA
    IMP_HORA  =  TEM_HORA
    ACU_TEMP_HORA  =  0
    CON_TEMP_HORA  =  0
retorno

INICIO_MINUTO:   
    W_MINUTO_ANT  =  TEM_MINUTO
    IMP_MINUTO  =  TEM_MINUTO
    ACU_TEMP_MINUTO  =  0
    CON_TEMP_MINUTO  =  0
retorno

PROCESAR_TEMPERATURA:   
    ACU_TEMP_MINUTO  =  ACU_TEMP_MINUTO  +  TEM_TEMPERATURA
    CON_TEMP_MINUTO  =  CON_TEMP_MINUTO  +  1
    ejecutar  IMPRIMIR_TITULOS
    imprimir  IMP_HORA,  IMP_MINUTO,  TEM_SEGUNDO,  TEM_TEMPERATURA
    IMP_HORA  =  “"
    IMP_MINUTO  =  “"
    ejecutar  LEER_SGTE_TEMPERAT
retorno

CORTE_MINUTO:
    ejecutar  IMPRIMIR_TITULOS
    imprimir  “*  Temperatura  Promedio  Minuto",  W_MINUTO_ANT;
    imprimir  “    .........",  ACU_TEMP_MINUTO  /  CON_TEMP_MINUTO
    ACU_TEMP_HORA  =  ACU_TEMP_HORA  +  ACU_TEMP_MINUTO
    CON_TEMP_HORA  =  CON_TEMP_HORA  +  CON_TEMP_MINUTO
retorno

CORTE_HORA:   
    ejecutar  IMPRIMIR_TITULOS
    imprimir  “**  Temperatura  Promedio  Hora",  W_HORA_ANT;
    imprimir  “    ..............    ",  ACU_TEMP_HORA  /  CON_TEMP_HORA
    ACU_TEMP_DIA  =  ACU_TEMP_DIA  +  ACU_TEMP_HORA
    CON_TEMP_DIA  =  CON_TEMP_DIA  +  CON_TEMP_HORA
retorno

IMPRIMIR_DATOS_GENERALES:
    ejecutar  IMPRIMIR_TITULOS   
    si CON_TEMP_DIA > 0
	imprimir  “***  Temperatura  Promedio  del  Día";
	imprimir  ACU_TEMP_DIA  /  CON_TEMP_DIA
    sino
	imprimir  “No  se  han  registrado  mediciones  de  temperatura"   
    fin_si 
retorno

CERRAR_ARCHIVO_TEMPERAT:
    cerrar  TEMPERAT
retorno
