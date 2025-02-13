(defun insert (sorted value)
  (let ((less '())
        (unchecked sorted)
        (res '()))
    (if (< (car (last unchecked)) value)
        (setq res (append unchecked (list value)))

      (loop while (> (length unchecked) 0)
        do (if (< value (car unchecked))
              (progn
                (setq less (append less (list value)))
                (setq res (append less unchecked))
                (setq unchecked '())) ; Exit loop
              (progn
                (setq less (append less (list (car unchecked))))
                (setq unchecked (cdr unchecked)))))
    )
    res); return res
  )
 


(defun insertion-sort (L)
    (if (<= (length L) 1)
        L ; Return the list if it has 1 or fewer elements
    )
    (let (
            (sorted (list (car L)))
            (unsorted (cdr L))
    )
      (loop while unsorted
            do (progn 
              (setq sorted (insert sorted (car unsorted))) 
              (setq unsorted (cdr unsorted))
            ))
      sorted)
    )
        
