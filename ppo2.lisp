(defun ppo2 (tc &optional atm)
;; tc is initial temperature in degrees C
;; atm is atmospheric pressure in mmHg
;; conditonals are due to phase changes @30C
  "Calculate Partial Pressure of O2 in liquid"
  (if (null atm) (setf atm 760))
  (setf coef (if (>= tc 30)  0.827 0.678))
  (setf adj (if (>= tc 30) 49 35))
  (setf exps (mapcar #'expt (make-list 4 :initial-element TC) '(3 2 1 0)))
  (* 0.005625 atm coef (/ 1 (+ adj TC))   
    (reduce #'+ (mapcar #'* '(-0.0000058333 0.0001821 0.072405 2.5443) exps))
                 (- atm (reduce '+ (mapcar #'* '(0.0456 -0.8559 16.509) (cdr exps)))))  
  )
