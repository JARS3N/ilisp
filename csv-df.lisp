;;;; read a csv
(defun read-csv (filename &optional delim-char)
"Reads the csv to a nested list, where each sublist represents a line."
(if (null delim-char)(setf delim-char #\,))
                      (with-open-file (input filename)
                        (loop :for line := (read-line input nil) :while line
                          :collect (read-from-string
                                    (substitute #\SPACE delim-char
                                      (format nil "(~a)~%" line))))))
                                      
;;;; move csv to lists of lists instead of rows  
(defun csv-df (x)
  (loop for n from 0 to (- (length (elt x 0)  1)
    :collect  (set (INTERN (elt names n))
               (loop for i from 1 to (- (length mtcars) 1)
                 :collect (elt (elt mtcars i) n)
               )))
)
