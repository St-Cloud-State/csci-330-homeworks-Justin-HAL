;This function is used to merge two lists together
;The function takes two inputs, L1 L2 which should be lists.
(defun merge-lists (list1 list2)
  (cond
    ((null list1) list2)
    ((null list2) list1)
    ((<= (car list1) (car list2))
     (cons (car list1) (merge-lists (cdr list1) list2)))
    (t
     (cons (car list2) (merge-lists list1 (cdr list2))))))

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
        ;cond with three outcomes
        (cond      
                    ;cond 1 if the length of L is greater than 1, this means there is more than one element.
                    ((< 1 (length L))
                    (if (listp (car L))  ;checks to see if the first element of L is a list.
                        ;if the first element of L is a list:
                        (setq L (append (part-list L)   (sort-bottom-up-helper (cdr(cdr L))))) ;merge adjacent lists, then move on to the rest of the list
                        ;if the first element of L is a symbol (not a list)
                        (setq L (append (part-sym L) (sort-bottom-up-helper(cdr (cdr L))))) ;merge adjacent symbols, then move on to the res of the list
                    ))
                     ((listp (car L)) L) ;if the list contain only one element, and that element is a list, return the list.
                     (t (list L))   ;else, that element must be a symbol, return a list conating that symbol.
                    ))
        

;main merge=sort function
(defun merge-sort (L)
    ;while there is more than one element(list) in L.
    (if (>= 1 (length L))
        (if (listp (car L))
            (car L)
            L
        )
    )

    (if (listp (car L))  ;checks to see if the first element of L is a list.
        ;if the first element of L is a list:
        (setq L (append (part-list L)   (sort-bottom-up-helper (cdr(cdr L))))) ;merge adjacent lists together
        ;if the first element of L is a symbol (not a list)
        (setq L (append (part-sym L) (sort-bottom-up-helper(cdr (cdr L)))))) ;merge adh=jacent symbols
            
     (if (< 1 (length L))
        (merge-sort L)
        (car L)
    )
        )



;commands to use to test
; (merge-sort '(2 4 6 1 5 3))
; (merge-sort '(1 2 3 4 5 6))
; (merge-sort '(6 5 4 3 2 1))
; (merge-sort '(5 5 5 5 5 5))
; (merge-sort '(1))
; (merge-sort '())
; 
; (merge-sort '(10 7 8 9 1 5 3 6 2 4))(merge-sort '(-3 -1 -2 -5 -4))
; (merge-sort '(3 -1 2 -5 4 -2))
; (merge-sort '(3 1 2 3 4 2 1))