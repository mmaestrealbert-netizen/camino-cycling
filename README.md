# Camino Cycling V2

PWA con autenticación, sincronización con Supabase, caché local, cola offline, navegación mensual, importación de planes e histórico.

## 1. Crear Supabase
1. Crea un proyecto en Supabase.
2. Abre SQL Editor, pega `supabase-schema.sql` y pulsa Run.
3. En Authentication > Providers, deja Email activado.
4. En Authentication > URL Configuration añade la URL de GitHub Pages a Site URL y Redirect URLs.
5. En Project Settings > API copia Project URL y la clave publishable (o anon legacy).
6. Pégalas en `config.js`. Nunca pegues `service_role`.

## 2. Actualizar GitHub Pages
1. Descomprime el ZIP.
2. En tu repositorio de GitHub abre la pestaña Code.
3. Add file > Upload files.
4. Sube el contenido de la carpeta `camino-cycling-v2`, sustituyendo los archivos anteriores. Importante: sube los archivos a la raíz, no la carpeta contenedora.
5. Commit changes.
6. Settings > Pages > Deploy from a branch > main > /(root) > Save.
7. Espera 1-3 minutos y recarga la web. Si conserva una versión antigua, cierra la PWA, abre la URL en Safari y recarga; el service worker cambiará a la caché V2.

## 3. Primer acceso
1. Abre la PWA y pulsa Acceder.
2. Crea tu cuenta.
3. Si Supabase exige verificación, confirma el correo.
4. Entra con el mismo correo y contraseña en todos tus dispositivos.

## 4. Importar planes mensuales
Usa `plan-ejemplo-enero-2027.json` como plantilla. En la app: Importar plan > selecciona JSON. Los resultados existentes no se sustituyen si los identificadores son distintos.

## Seguridad
GitHub Pages publica el código de la web. La clave publishable identifica el proyecto, pero la protección real está en RLS: cada usuario solo puede ver y modificar sus filas. No incluyas jamás la clave service_role.
