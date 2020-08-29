(defun ppo2 (tc &optional atm)
;; tc is initial temperature in degrees C
;; atm is atmospheric pressure in mmHg
;; conditonals are due to phase changes @30C
  "Calculate Partial Pressure of O2 in liquid"
   (let (
	 (atm (if (null atm) 760 atm))
	 (coef (if (>= tc 30d0)  0.827d0 0.678d0))
	 (adj (if (>= tc 30d0) 49d0 35d0))
	 (exps (mapcar #'expt (make-list 4 :initial-element TC) '(3 2 1 0))))
       (* 0.005625d0 atm coef (/ 1 (+ adj TC))   
    (reduce #'+ (mapcar #'* '(-0.0000058333d0 0.0001821d0 0.072405d0 2.5443d0) exps))
                 (- atm (reduce '+ (mapcar #'* '(0.0456d0 -0.8559d0 16.509d0) (cdr exps)))))))
