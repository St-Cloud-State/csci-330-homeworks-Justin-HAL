(defun part-right (L)
    (last L (floor (/ (length L) 2)))
)

(defun part-left (L)
    (ldiff L (part-right L))
)

;maybe use a cond instead of if


(defun merge-lists (L1 L2)
  (let ((res ())) ; return varianle
    (loop while (and L1 L2)
          do (if (< (car L1) (car L2))
          ; iF true
                 (progn (setq res (append res (list (car L1)))) (setq L1 (cdr L1)))
            ;if false
                 (progn (setq res (append res (list (car L2)))) (setq L2 (cdr L2)))))
    (if L1
        (setq res (append res L1))
        (setq res (append res L2)))
    res))

(defun merge-sort (L)
  (if (or (null L) (null (cdr L)))
      L
      (let ((left (part-left L)) (right (part-right L)))
        (merge-lists (merge-sort left) (merge-sort right))
        )))