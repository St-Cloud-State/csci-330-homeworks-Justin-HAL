(defun part-right (L)
    (last L (floor (/ (length L) 2)))
)

(defun part-left (L)
    (ldiff L (part-right L))
)

(defun merge-lists (L1 L2)
    (defvar res ())
    (if (and (< 0 (length L1)) (< 0 (length L2)))
        ;if both lists have more than 0 elements.
        (loop 
            (if (< (car L1) (car (L2)))
                (progn (setq res (append res (car L1))) (setq L1 (cdr L1)))
                (progn (setq res (append res (car L2))) (setq L2 (cdr L2)))
            )
            (when)
    
    
    )
)