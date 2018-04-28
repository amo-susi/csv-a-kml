#|
  This file is a part of csv-a-kml project.
  Copyright (c) 2018 Char (signed-char@protonmail.com)
|#

#|
  Author: Char (signed-char@protonmail.com)
|#

(defsystem "csv-a-kml"
  :version "1.0.0"
  :author "Char"
  :license "MIT"
  :depends-on (fare-csv)
  :components ((:module "src"
                :components
                ((:file "csv-a-kml")
		 (:file "package"))))
  :description "Transformador de CSV a KML"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "csv-a-kml-test"))))
