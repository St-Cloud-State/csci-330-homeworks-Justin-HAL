(defun sum (items)
	(findIndex items 0))
	
(defun findIndex (b c)
	(cond ((eql b nil) c)
		  (t (findIndex (cdr b) (+ c (car b))))))

