# Csv-A-Kml

## Instalación y uso

Necesitas tener instalado quicklisp y slime + emacs.

Por favor lea:

* https://www.quicklisp.org/beta
* https://common-lisp.net/project/slime/

```bash
cd ~/quicklisp/local-project/

git clone https://github.com/chadhardware/csv-a-kml.git
```

Corra slime y escriba:

```lisp
(ql:quickload "csv-a-kml")
```

Ok en este paso usted tendrá instalado slime, quicklisp, emacs configurado y el proyecto csv-a-kml cargado,
para usar este proyecto:

```lisp
(csv-a-kml:csv-a-kml "ruta-archivo-entrada.csv" "ruta-archivo-salida.kml")
```

El archivo de entrada tiene la siguiente forma:

```
-151.751974,-16.442288
...
...
```

Este archivo tiene coordenadas o una coordenada en formato CSV.

Un ejemplo:

```lisp
(csv-a-kml:csv-a-kml "~/coordenadas.csv" "~/salida.kml")
```

```bash
cd
ls -la salida.kml
```

## Autor

* Char (signed-char@protonmail.com)

## Copyright

Copyright (c) 2018 Char (signed-char@protonmail.com)

## Licencia

Licencia MIT.
