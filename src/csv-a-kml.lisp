(in-package :cl-user)
(defpackage csv-a-kml
  (:use :cl))
(in-package :csv-a-kml)

(defparameter *kml-base*
  '(
    (<?xml version=\"1.0\" encoding=\"utf-8\"?>)
    (<kml xmlns=\"http\://www.opengis.net/kml/2.2\")
    (<Document> </Document>)
    (<Placemark> </Placemark>)
    (<name> "simple" </name>)
    (<Point> </Point>)
    (<coordinates> </coordinates>)
    (</kml>)))

(defun extract (stream mformat fn)
  "Replace the loop macro."
  (mapcar #'(lambda (s)
	      (format stream mformat s)) fn))

(defun kml-header (file-stream)
  "Prints the header of kml in the `file-stream'."
  (extract file-stream "~(~a ~)" (car *kml-base*))
  (format file-stream "~%")
  (extract file-stream "~(~a ~)" (cadr *kml-base*))
  (format file-stream "~%"))

(defun melt (num0 num1)
  "My extraction function, `elt'."
  (if (and (numberp num0) (numberp num1))
      (elt (elt *kml-base* num0) num1)
      (error "~a or ~a is not a number." num0 num1)))

(defun kml-open-document (file-stream)
  (let ((open-document (melt 2 0)))
    (format file-stream "~:(~a~)~%" close-document)))

(defun kml-close-document (file-stream)
  (let ((close-document (melt 2 1)))
    (format file-stream "~:(~a~)~%" close-document)))

(defun kml-end (file-stream)
  (let ((end-tag (caar (last *kml-base*))))
    (format file-stream "~(~a~)" end-tag)))

(defun construction-kml (lst file-stream)
  "Defined the generic skeleton of the kml file."
  (let ((first-elm (car lst))
	(second-elm (cadr lst))
	(third-elm (caddr lst))
	(open-placemark (melt 3 0))
	(open-name (melt 4 0))
	(default-name (melt 4 1))
	(close-name (melt 4 2))
	(open-point (melt 5 0))
	(open-coordinates (melt 6 0))
	(close-coordinates (melt 6 1))
	(close-point (melt 5 1))
	(close-placemark (melt 3 1)))
    (format file-stream "  ~:(~a~)~%    ~(~a~a~a~)~%    ~:(~a~)~%      ~(~a~a,~a,~a~a~)~%    ~:(~a~)~%  ~:(~a~)~%" open-placemark open-name default-name close-name open-point open-coordinates first-elm
	    second-elm third-elm close-coordinates close-point close-placemark)))

(defun csv-a-kml (input-pathname output-pathname)
  "Create the kml file."
  (fare-csv:with-rfc4180-csv-syntax ()
    (let* ((fare-csv:*separator* #\;)
	   (file-stm (fare-csv:read-csv-file input-pathname)))
      (with-open-file (kml-stm output-pathname :direction :output
			       :if-does-not-exist :create)
	(kml-header kml-stm)
	(kml-open-document kml-stm)
	(loop for in-lst in file-stm
	   do (construccion-kml in-lst kml-stm))
	(kml-close-document kml-stm)
	(kml-end kml-stm)))))
