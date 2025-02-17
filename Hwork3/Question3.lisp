;This function is used to merge two lists together
;The function takes two inputs, L1 L2 which should be lists.
(defun merge-lists (list1 list2)
  (cond
    ((null list1) list2) ;if list1 is empty (null) then return list2
    ((null list2) list1) ;if list2 is empty (null) then return list 1

    ((<= (car list1) (car list2)) ;since list1 and list2 are not empty, if the first element of list 1 is less than the first of list 2.
     (cons (car list1) (merge-lists (cdr list1) list2))) ;return the list were the first element of list 1 and the rest of the merged elements.
    (t
     (cons (car list2) (merge-lists list1 (cdr list2)))))); else, return the list were the first element of list 2 and the rest of the merged elements.

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
    ;if there is one or less elements
    (if (>= 1 (length L))
        (if (listp (car L)) ; if that element is a list.
            (car L) ; return that list element
            L   ;else, return L
        )
    )

    (if (listp (car L))  ;checks to see if the first element of L is a list.
        ;if the first element of L is a list:
        (setq L (append (part-list L)   (sort-bottom-up-helper (cdr(cdr L))))) ;merge adjacent lists together
        ;if the first element of L is a symbol (not a list)
        (setq L (append (part-sym L) (sort-bottom-up-helper(cdr (cdr L)))))) ;merge adjacent symbols
            
     (if (< 1 (length L)) ; check to see if process is done, when the merging is done there should only be one element in L
        (merge-sort L) ; if there are more elements, then repeat the process.
        (car L) ;else return the sorted list.
    )
        )



;commands to use to test
; (merge-sort '(2 4 6 1 5 3))
; (merge-sort '(1 2 3 4 5 6))
; (merge-sort '(6 5 4 3 2 1))
; (merge-sort '(5 5 5 5 5 5))
; (merge-sort '(1))
; (merge-sort '())
; (merge-sort '(10 7 8 9 1 5 3 6 2 4))
;(merge-sort '(-3 -1 -2 -5 -4))
; (merge-sort '(3 -1 2 -5 4 -2))
; (merge-sort '(3 1 2 3 4 2 1))