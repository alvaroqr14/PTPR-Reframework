# Descripción
- Plantilla de proyecto basado en el REFramework de tipo Disptacher-Performer en versión windows que utiliza colas
- **Carpeta Source:** Se encuentra el código fuente del proyecto
- Solo se ignora el contenido de la carpeta **.local**
- Incluye comentarios que indican que accion se debe implementar en cada sección necesaria (estos comentarios deben ser eliminados en el proyecto real)
- La plantilla cumple con todos los lineamientos aplicables según el [Documento de lineamientos de Desarrollo](https://unipe-my.sharepoint.com/:w:/g/personal/aquezadar_uni_pe/EWDZpU21s5JImcYSvOBCpb8BTvn3RSD1vuSRhkNzAddNJg?e=XVFQ7z)

## Archivos Externos
**Carpeta DataProcesos** 
- Carpeta que usualmente se utiliza como repositorio de archivos externos al robot en la cual se incluyen:
    - Archivos Input: Por ejemplo archivos Excel que serán procesados por el robot
    - Archivos Output: Por ejemplo archivos output propios del proceso (certificados, boletas, etc.), capturas de pantalla de error y reportería
    - Archivos Paramétricos y/o Plantillas: Por ejemplo el archivo config y plantillas de correo, reportes y excepciones
    - Archivos Temporales: Por ejemplo archivos descargados para su lectura y luego eliminados

- Dependiendo de la solución esta carpeta, sus subcarpetas y contenido pueden variar. A continuación se muestran algunos ejemplos:
    - La carpeta puede alojarse en ruta compartida mediante red, sincronizada mediante one drive
    - Los archivos input/output pueden alojarse en otros repositorios o no existir
    - Los archivos paramétricos y plantillas pueden alojarse en bases de datos según se requiera

**Carpeta Scripts** 
- Carpeta que mantiene el scripts para la solución adicionales, por ejemplo archivos sql que contienen la creación de tablas y stored procedures

## Detalles
Los supuestos que se plantean para esta plantilla para ejemplificar su uso son:
- Data procesos se considera ubicarla en una carpeta local
- No se considera archivos de data input
- Se envian correos 7 tipos de correos (inicio, error init, error get trama, exito, error, reporte ejecucion y fin)
- Se considera limpiar la carpeta temporal al inicio de la ejecución
- Se genera un reporte de ejecución de las transacciones procesadas durante la ejecución
- Se considera el envío de correos mediante smtp
- Se utiliza una base de datos SQL Server para el registro de las transacciones

Por ello encontrarás módulos adicionales que forman parte de la ejemplificación del framework, y de esta forma mostrar una forma de ejecución básica.
Esto no implica que no se puedan modificar o quitar dependiendo del requerimiento.