#|
  This file is a part of csv-a-kml project.
  Copyright (c) 2018 Char (signed-char@protonmail.com)
|#

(defsystem "csv-a-kml-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Char"
  :license "MIT"
  :depends-on ("csv-a-kml"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "csv-a-kml"))))
  :description "Test system for csv-a-kml"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
