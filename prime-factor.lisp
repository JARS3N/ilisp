(defun prime-factor (x)
"find all prime factos of a number"
;;; lg-div find the largest number divisible to the input
  (defun lg-div (x &optional y)
    (if (null y) (setf y (- x 1)))
    (if (<  (mod x y) 1) y (lg-div x (decf y)))
  )
;;; the loop macro is strange and feel out of place in lisp
;;; yet it does allow some interesting things
  (loop 
    :with i = x
    :with j = nil
    :while (> i 1)
    :do 
      (setf j (lg-div i))
    :collect (/ i j)
    :do (setf i j)
  )  
)
