# Camino Cycling PWA

Aplicación local para planificar y registrar los entrenamientos de diciembre de 2026.

## Probar en ordenador
La PWA necesita servirse por HTTP, no abrirse directamente con `file://`.

1. Descomprime el ZIP.
2. En la carpeta del proyecto ejecuta `python3 -m http.server 8080`.
3. Abre `http://localhost:8080`.

## Instalar en móvil
Publícala en un alojamiento HTTPS como GitHub Pages, Netlify o Vercel.

### iPhone
Abre la URL en Safari > Compartir > Añadir a pantalla de inicio.

### Android
Abre la URL en Chrome > Instalar aplicación o Añadir a pantalla de inicio.

## Datos
Los datos se guardan en localStorage del navegador. Usa Exportar para crear copias JSON e Importar para restaurarlas. Borrar los datos del navegador elimina el registro local.

## Archivos
- index.html: interfaz
- styles.css: diseño responsive
- app.js: calendario, edición, métricas, exportación e importación
- manifest.webmanifest: instalación PWA
- sw.js: funcionamiento sin conexión
- icons/: iconos
