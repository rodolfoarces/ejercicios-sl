Nombre del programa: 	Promedios de altura por rango etario y sexo en alumnos de colegio
Autor:					Rodolfo Arce
Nº Curso: 				21404
Profesora: 				Lic. R. Lukoski
Fecha: 					Septiembre 2021
Enunciado del problema:

En el patio de un colegio se presentará una obra de teatro, este patio aunque amplio, no tendrá tarima muy alta por lo cual se deberá disponer a los alumnos tal que todos puedan ver la obra y no obstaculicen a los compañeros que están detrás para que puedan disfrutar de la obra. Por esta razon el colegio deberá calcular el total de alumnos para considerar el espacio a ocupar en el patio, y los promedios por sexo, por grado, para organizarlos de la mejor manera posible en grupos durante la obra.

Los datos se deberán ingresar de la siguiente forma:
* Numero de cedula (Diferente de 0)
* Grado (Del 1ro al 6to) 
* Codigo de sexo (0=Hombre,1=Mujer)
* Altura (en centimetros)

Objetivo:
	Calcular altura promedio por grado y sexo.

Entorno:
	W_NRO_CEDULA 	es numerico
	W_COD_SEXO		es numerico
	W_NRO_GRADO		es numerico
	W_ALTURA		es numerico
	ACU_TOTALES		es numerico
	VEC_TITULOS		tabla(7) es alfanumerico
	MAT_PROM_ALTURA	tabla(6,7) es numerico
	S	es numérico
	G	es numérico
	
Cuerpo principal:
inicio
	ejecutar PROCESO_INICIAL
	mientras W_NRO_CEDULA <> 0
		ejecutar PROCESO_PRINCIPAL
	fin_mientras
	ejecutar PROCESO_FINAL
fin

Rutinas:
PROCESO_INICIAL
	imprimir "Calcular promedios de altura"
	ejecutar INCIALIZAR_MATRIZ
	ejecutar INCIALIZAR_VECTOR
	ejecutar INGRESAR_CEDULA
retorno

PROCESO_PRINCIPAL
	ejecutar INGRESAR_DATOS_ALUMNO
	ejecutar INGRESAR_DATOS_MATRIZ
	ejecutar INGRESAR_CEDULA
retorno

PROCESO_FINAL
	ejecutar CALCULAR_PROMEDIOS
	ejecutar IMPRIMIR_TITULOS
	ejecutar IMPRIMIR_DATOS
	imprimir "*** Fin del proceso ***"
retorno

INCIALIZAR_MATRIZ
	desde S=1 hasta 6
		desde G=1 hasta 8
			MAT_PROM_ALTURA(I,J) = 0
		fin_desde
	fin_desde
retorno

INCIALIZAR_VECTOR
	VEC_TITULOS(1) = "Hombre"
	VEC_TITULOS(2) = "Cant. Hombre"
	VEC_TITULOS(3) = "Prom. Altura Hombre"
	VEC_TITULOS(4) = "Mujer"
	VEC_TITULOS(5) = "Cant. Mujer"
	VEC_TITULOS(6) = "Prom. Altura Mujer"
	VEC_TITULOS(7) = "Total Alumnos"
retorno

INGRESAR_CEDULA
	imprimir "Ingresar cedula del alumno (Enter para fin), W_NRO_CEDULA
retorno

INGRESAR_DATOS_ALUMNO
	repetir
		imprimir "Ingresar código de sexo (0=Hombre,1=Mujer)", W_COD_SEXO
	hasta (W_COD_SEXO = 0 or 1)
	repetir
		imprimir "Ingresar grado (en numero)", W_COD_GRADO
	hasta (W_COD_GRADO = 1 or 2 or 3 or 4 or 5 or 6)
	imprimir "Ingresar altura en centimetros:", W_ALTURA
retorno

INGRESAR_DATOS_MATRIZ
	G = W_COD_GRADO
	S = (W_COD_SEXO * 3) + 1
	MAT_PROM_ALTURA(S,G) = MAT_PROM_ALTURA(S,G) + W_ALTURA
	MAT_PROM_ALTURA(S+1,G) = MAT_PROM_ALTURA(S+1,G) + 1
	MAT_PROM_ALTURA(7,G) = MAT_PROM_ALTURA(7,G) + 1
	MAT_PROM_ALTURA(S,7) = MAT_PROM_ALTURA(S,7) + 1
	MAT_PROM_ALTURA(S+1,7) = MAT_PROM_ALTURA(S+1,7) + 1
retorno

CALCULAR_PROMEDIOS
	desde G=1 hasta 6
		desde S = 1 hasta 2
			MAT_PROM_ALTURA(S * 3,G) = MAT_PROM_ALTURA((S * 3)-2,G) /  MAT_PROM_ALTURA((S * 3)-1,G)
		fin_desde
	fin_desde
	
	desde S = 1 hasta 2
		ACU_PROMEDIOS = 0
		desde G=1 hasta 6
			ACU_PROMEDIOS = ACU_PROMEDIOS + MAT_PROM_ALTURA(S*3,G)
		fin_desde
		MAT_PROM_ALTURA(S*3,7) = ACU_PROMEDIOS / 6
	fin_desde
retorno

IMPRIMIR_TITULOS
	imprimir "Sexo/Grado	1	2	3	4	5	6	Totales"
retorno

IMPRIMIR_DATOS
	desde S=1 hasta 7
		imprimir VEC_TITULOS(S)
		desde G=1 hasta 7
			imprimir MAT_PROM_ALTURA(S,G)
		fin_desde
	fin_desde
retorno
