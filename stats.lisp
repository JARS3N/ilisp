;;; some simple stats to calculate
  
(defun sum (x)(reduce #'+ x)) 
(defun mean (x)(* (/ (sum x) (length x)) 1.0)
(defun mean-diff (x)(mapcar #'(lambda (u) (-  (mean x) u)) x))
(defun ^2 (x) (expt x 2))
(defun var (x) (/ (sum (mapcar #'^2 (mean-diff x))) (- (length x) 1.0)))
(defun sd (x) (expt (var x) .5))
(defun absdev ())
(defun cv (x) (* 100 (/ (mean x) (sd x))))
 (defun diff (x) (loop 
  :for i from 0 to (- n 2)
  :for j from 1 to (- n 1 )
  :collect (- (elt x i)  (elt x j))))
  
(defun ssmd (X Y)
  (/
    (- (mean X) (mean Y))
    (expt (+ (sd X) (sd Y)) .5)
      )
  )

(defun z-factor (X Y)
 (- 1 (/ (* 3 (+ (sd X) (sd Y)))
    (abs (- (mean X) (mean Y))))
  ))
