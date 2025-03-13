(defun Ifn (list)
  (print '(in Ifn)) 
  (print list)
  (cond ((eql (car list) 'i) (IPfn (Sfn (Efn (cdr list)))))
        (t (print '(error))))
)

(defun IPfn (list)
  (print '(in IPfn)) 
  (print list)
  (cond 
    ((null list) list)  ; If the list is empty, return it
    ((eql (car list) 'e) (Sfn (cdr list)))  ; If first element is 'e, call Sfn on (cdr list)
    (t 'error)))  ; Otherwise, return 'error

(defun Efn (list)
    (print '( in Efn)) (print list)
    (EPfn (Gfn list))
)

(defun EPfn (list)
  (print '(in EPfn)) 
  (print list)
  (cond 
    ((eql (car list) 'o) (Efn (cdr list)))  ; If (car list) is 'o, call Efn on (cdr list)
    (t list)))                              ; Otherwise, return the original list

(defun Gfn (list)
  (print '(in Gfn)) 
  (print list)
  (cond 
    ((or (eql (car list) 'x) 
         (eql (car list) 'y) 
         (eql (car list) 'z) 
         (eql (car list) 'w)) 
     (cdr list))
    (t '(error))
    ))

(defun Sfn (list)
  (print '(in Sfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (cdr list))  ; If 's, return cdr

    ((eql (car list) 'd)  ; If 'd, perform nested operations
     (let ((x (Lfn (cdr list))))  ; Use let to define x instead of setf
       (cond 
         ((null x) (append (cdr list) (list 'err)))  ; If x is nil, append 'err
         ((eql (car x) 'b) (cdr x))  ; If first element of x is 'b, return cdr x
         (t (append (cdr list) (list 'err))))))  ; Default error case

    (t '(error))))  ; Default case if no conditions match

(defun Lfn (list)
  (print '(in Lfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (LPfn (cdr list)))  ; If first element is 's, call LPfn
    (t '(error))))                           ; Otherwise, return '(error)

(defun LPfn (list)
  (print '(in LPfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (Lfn list))  ; recursive call to Lfn
    (t list)))                         ; Otherwise, return the list as is

    ; test cases:
    ;(Ifn '(i x o y s))
    ;(Ifn '(i x o y o w d s s b e s))