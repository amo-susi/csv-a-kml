#|
  This file is a part of csv-a-kml project.
  Copyright (c) 2018 Char (signed-char@protonmail.com)
|#

#|
  Author: Char (signed-char@protonmail.com)
|#

(defsystem "csv-a-kml"
  :version "0.1.0"
  :author "Char"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "csv-a-kml"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "csv-a-kml-test"))))
