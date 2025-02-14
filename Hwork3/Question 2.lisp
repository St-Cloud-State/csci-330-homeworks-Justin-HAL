; These two functions help partion a list into halves.
(defun part-right (L)
    (last L (floor (/ (length L) 2)))
)

(defun part-left (L)
    (ldiff L (part-right L)) 
)
;///////////////////////////////////////////////////////


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

;main mergesort function. 
(defun merge-sort (L)
  (if (or (null L) (null (cdr L))) ;if the list is empty, or if there is obly one element in the list.
      L ;return the list
      ;else partition the list and merge the two halfs.
      (let ((left (part-left L)) (right (part-right L)))
        (merge-lists (merge-sort left) (merge-sort right))
        )))

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