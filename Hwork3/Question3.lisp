;This function is used to merge two lists together
;The function takes two inputs, L1 L2 which should be lists.
(defun merge-lists (L1 L2)
  (let ((res ())) ; return variable, the sorted merged list.

    ;This loop will merge two lists while both lists are not empty.
    (loop while (and L1 L2)
          do (if (< (car L1) (car L2)) ;if the first element of L1 is less than the first element of L2
          ; If true ///////////////////////////////////////
                 (progn 
                 (setq res (append res (list (car L1))))  ;add the first element of L1 to the result or sorted list.
                 (setq L1 (cdr L1))) ;remove the first element from L1
          ;///////////////////////////////////////////////////////

            ;if false////////////////////////////////////////
                 (progn 
                 (setq res (append res (list (car L2)))) ;add the first element of L2 to the result or sorted list.
                 (setq L2 (cdr L2))))) ;remove the first element from L2
          ;//////////////////////////////////////////

    (if L1 ;if L1 still has elements in it.
        ;Then append the rest of L1 to the end of Res
        (setq res (append res L1))
        ;else append the rest of L2 to the end of res.
        (setq res (append res L2)))
    res)) ;return the result.

;merge adjacent SYMBOLS.
(defun part-sym (L) 
    (if (cdr L)
        (list (merge-lists (list (car L)) (list (car(cdr L))))) ;return the list made from merging symbols.
        (list L) ; if it is the last symbol, return a list containg that symbol.
    )
)

;Merge adjacent LISTS.
(defun part-list (L)
        (if (cdr L)
        (list (merge-lists (car L) (car(cdr L)))) ;merge two lists
        L ; if it is last list, return it.
    )
)

;This is the helper function that does most of the heavy lifting.
(defun sort-bottom-up-helper (L)
        ;while there is more than one element(list) in L.
        (loop while(< 1 (length L))
            do( if (listp (car L))  ;checks to see if the first element of L is a list.
                ;if the first element of L is a list:
                (setq L (append (part-list L)   (sort-bottom-up-helper (cdr(cdr L))))) ;merge adjacent lists together
                ;if the first element of L is a symbol (not a list)
                (setq L (append (part-sym L) (sort-bottom-up-helper(cdr (cdr L))))) ;merge adh=jacent symbols
            )
        )
        (if (listp (car L))
            L
            (list L)
        )
        )

;main merge=sort function
(defun merge-sort (L)
    (car (sort-bottom-up-helper L))
)

;commands to use to test
; (merge-sort '(2 4 6 1 5 3))
; (merge-sort '(1 2 3 4 5 6))
; (merge-sort '(6 5 4 3 2 1))
; (merge-sort '(5 5 5 5 5 5))
; (merge-sort '(1))
; (merge-sort '())
; (merge-sort '(10 7 8 9 1 5 3 6 2 4))
; (merge-sort '(-3 -1 -2 -5 -4))
; (merge-sort '(3 -1 2 -5 4 -2))
; (merge-sort '(3 1 2 3 4 2 1))