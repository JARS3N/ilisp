(defun tau (period delta-p delta-t) 
 "calculating tau(time constant)"
 (abs(/ period (log (/ 1 (- 1 (/ delta-p delta-t)))))))

 (defun min-mean (x)
   (let ((n  n (- (length x) 1)))
  (apply #'min
	 (loop for i from 0 to (- n 4)
	       collect (mean (subseq x i (+ i 5)))
	       ))))
