(defpackage csv-a-kml-test
  (:use :cl
        :csv-a-kml
        :prove))
(in-package :csv-a-kml-test)

;; NOTE: To run this test file, execute `(asdf:test-system :csv-a-kml)' in your Lisp.

(setf *enable-colors* nil)

(defun test-csv (filename)
  (namestring
   (reduce #'merge-pathnames (list filename "tests/csv/")
	   :from-end t
	   :initial-value (asdf:component-pathname
			   (asdf:find-system "csv-a-kml-test")))))

(defun output-kml (filename)
  (namestring
   (reduce #'merge-pathnames (list filename "tests/output/")
	   :from-end t
	   :initial-value (asdf:component-pathname
			   (asdf:find-system "csv-a-kml-test")))))

(plan nil)

(subtest "csv-a-kml"
  (ok (csv-a-kml (test-csv "test.csv") (output-kml "test.kml"))))

(finalize)
