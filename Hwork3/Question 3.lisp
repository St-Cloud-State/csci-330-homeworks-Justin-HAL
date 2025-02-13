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

(defun part-sym (L) ;partion and merge adjacent symbols that are not in a list yet.
    (if (cdr L)
        (list (merge-lists (list (car L)) (list (car(cdr L))))) ;return the list L if there is no more elements after
        (list L)
    )
)

(defun part-list (L)
        (if (cdr L)
        (list (merge-lists (car L) (car(cdr L)))) ;return the list L if there is no more elements after
        L
    )
)

(defun merge-sort-bottom-up (L)

        (let ((len (length L))))
        (cond
        (loop while(< 1 (length L))
            do( 
                if (listp (car L)) 
                ;if the first element of L is a list:
                (setq L (append (part-list L)   (merge-sort-bottom-up (cdr(cdr L)))))
                ;if the first element of L is not a list
                (setq L (append (part-sym L) (merge-sort-bottom-up(cdr (cdr L)))))
            )
        )
        )
)