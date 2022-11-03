import 'package:flutter/material.dart';

List<String> Departamentos_UYU = [
  "Todos",
  "Artigas",
  "Canelones",
  "Cerro Largo",
  "Colonia",
  "Durazno",
  "Flores",
  "Florida",
  "Lavalleja",
  "Maldonado",
  "Montevideo",
  "Paysandú",
  "Río Negro",
  "Rivera",
  "Rocha",
  "Salto",
  "San José",
  "Soriano",
  "Tacuarembó",
  "Treinta y Tres"
];

List<String> titulo_Delitos = [
  'Todos',
  'Delitos y Faltas',
  'Accidente',
  'Hecho Policial',
  'Crimenes'
];

List<String> Secc = ["Todas", "Seccionla 3", "Seccionla 2", "Seccionla 1"];

List<String> listContry = [];

List<String> supervisores = [
  "",
  "G5 Victor Jose Beis Mello",
  "G5 Jorge Daniel  Aguirre Prates",
  "G7 Deisy Natalia  Casto Da Silva",
  "G8 Ruben Andres Casaballe Meneses"
];

class ActionChipData {
  final String title;
  final IconData iconChip;
  ActionChipData(this.iconChip, this.title);
}

List<ActionChipData> chipsLocation = [
  ActionChipData(Icons.house, "Casa"),
  ActionChipData(
    Icons.apartment,
    "Apto.",
  ),
  ActionChipData(
    Icons.hotel,
    "Pensión-Hotel",
  ),
  ActionChipData(
    Icons.public,
    "Vía Publica",
  ),
  ActionChipData(
    Icons.store,
    "Local Comercial",
  ),
];

List<String> rolesList = [
  "DENUNCIANTE",
  "CONDUCTOR",
  "TESTIGO EVENTO",
  "INDAGADO",
  "TESTIGO ADMINISTRATIVO",
  "VICTIMA",
  "FUNCIONARIO ACTUANTE"
];
List<String> situacionList = [
  "SITUACION",
  "DENUNCIADO",
  "LIBERTAD",
  "DETENIDO",
  "REQUERIDO",
  "FORM. C/P",
  "FORM. S/P.",
];

List<String> ocupacionList = [
  "OCUPACION",
  "EMPRESARIO",
  "EMPLEADO",
  "GDIA.SEGURIDAD",
  "COCINERO",
  "REPARTIDOR",
  "OBRERO",
  "POLICIA",
];

List<String> estado_civilList = [
  "ESTADO CIVIL",
  "CASADO",
  "SOLTERO",
  "DIVORCIADO",
  "UNION LIBRE",
  "CONCUBINATO",
];

List<String> sexoList = ["SEXO", "MASCULINO", "FEMENINO", "NO APORTA", "PUTO"];

List<String> cutisList = ["CUTIS", "TRIGUEÑO", "BLANCO", "NEGRO", "MOROCHO"];

List<String> franjaEtareaList = [
  "FRANJA ETAREA",
  "BEBE",
  "NINÑO",
  "ADOLECENTE",
  "jOVEN",
  "ADUCLTO",
  "VIEJO"
];

List<String> estaturaList = [
  "ESTATURA",
  "ALTO",
  "BAJO",
  "MEDIANO",
  "ENANO",
  "GIGANTE"
];

List<String> complexionFisicaList = [
  "COMPLEXIÓN",
  "GURUESO",
  "GORDO",
  "MUSCULOSO",
  "FLACO",
  "NORMAL"
];

List<String> cabelloList = [
  "CABELLO",
  "RUBIO",
  "CASTAÑO",
  "NEGRO",
  "PELIRROJO",
  "TINTA"
];

//************Complmento Indagado////// */

List<String> lesionesList = [
  "Fallece ",
  "Lesiones Graves",
  "Lesiones Leves",
  "No presenta",
  "Lesiones"
];

List<String> fugaList = [
  "Medio Fuga",
  "Pie tierra",
  "Vehiculo 2 Ruedas",
  "Vahiculo 4 Ruedas"
];

List<String> circulacionList = [
  "Medio Circulacion",
  "Pie tierra",
  "Vehiculo 2 Ruedas",
  "Vahiculo 4 Ruedas"
];

List<String> disparosList = ["Disparos", "Si", "No"];

List<String> lugarTomaDenunciaList = [
  "Dependeicia Polcial",
  "Vehiculo 4 ruedas",
  "Vehiculo 2 ruedas",
  "Pie tierra",
  "Papel",
];

List<String> motivoDetencionList = [
  "MOTIVO DETENCION",
  "FRAGANTI DELITO",
  "POR ORDEN JUDICIAL",
  "FUGADO"
];

List<String> gradoList = [
  "",
  "Agente",
  "Cabo",
  "Sargento",
  "Of.Ayte.",
  "Of.Pla.",
  "Sub.Crio.",
  "Crio."
];

List<String> unidadEje = [
  "Uni. Ejecutora",
  "BPS",
  "IMM",
  "Jef.Poli.Montevideo"
];

List<String> dependenciaList = [
  "Dependenicia",
  "Seccional 3era",
  "Seccional 2da",
  "Seccional 1era",
];

// ******************Listas para delitos y faltas*********************
List<String> listTipoDelitos = [
  "Seleccionar",
  "Hurto",
  "Rapiña",
  "Daño",
  "Apropiacion Indebida",
  "Estafa",
  "Violencia Domestica"
];

List<String> modalidadHurtos = [
  "Arrebato",
  "Descuido",
  "Destreza",
  "Efraccion",
  "Escalamiento",
  "Engaño",
  "Llaves Apropiadas",
];

List<String> modalidadRapina = ["Violencia Fisica", "Amenaza"];
List<String> modalidadVioDom = [
  "Violencia Fisica",
  "Amenaza",
  "Violencia Verbal"
];
List<String> modalidadDano = ["Efraccion", "Destruccion", "Pedrea"];

List<String> listComplemntoDelitos = [
  "Seleccionar",
  "A Transeunte",
  "A FF.PP",
  "A Ex. Pareja",
  "A Pension",
  "A Casa de Familia",
  "A taximetrista",
  "A Menor"
];

//  Type Accidente

List<String> listAccidentes = [
  "Seleccionar",
  "General",
  "General (Derrumbe)",
  "General (Escape de Gas)",
  "General (Incendido)",
  "Siniestro Aereo",
  "Siniestro de Transito",
  "Siniestro de Ferroviario",
  "Siniestro Maritimo",
  "Trabajo"
];

List<String> listGravedadAcc = [
  "Seleccionar",
  "Fatal",
  "Grave",
  "Leve",
  "Sin Lesionados"
];

List<String> filcaliasJuzgadosLista = [
  "FISCALIA PENAL FLAG. 1 TURNO",
  "FISCALIA PENAL FLAG. 2 TURNO",
  "FISCALIA PENAL FLAG. 3 TURNO",
  "FISCALIA PENAL FLAG. 4 TURNO",
  "FISCALIA PENAL FLAG. 5 TURNO",
  "FISCALIA PENAL FLAG. 6 TURNO",
  "FISCALIA PENAL FLAG. 7 TURNO",
  "FISCALIA PENAL FLAG. 8 TURNO",
  "JUZGADO FAMILIA ESP. VIOLENCIA DOMESTICA 1 TURNO",
  "JUZGADO FAMILIA ESP. VIOLENCIA DOMESTICA 2 TURNO",
  "JUZGADO FAMILIA ESP. VIOLENCIA DOMESTICA 3 TURNO",
  "JUZGADO FAMILIA ESP. VIOLENCIA DOMESTICA 5 TURNO",
];
