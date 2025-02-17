;This function is used to insert a sorted value into a sorted list.
;sorted is a sorted list.
;value is a symbol.
(defun insert (sorted value)
  (cond
    ((null sorted) (list value)) ; If the list is empty, return a new list with the value
    ((<= value (car sorted)) (cons value sorted)) ; If the value is less than or equal to the first element, insert it at the beginning
    (t (cons (car sorted) (insert (cdr sorted) value))))) ; Otherwise, recursively insert the value in the rest of the list
  
 
 ;this function will be recusivly called to insert unsorted elements into the sorted list.
(defun insertion-helper (sorted unsorted)
  (if unsorted ;if there are still elements in unsorted

      ; Then insert an element into sorted and 
    (insertion-helper (insert sorted (car unsorted)) (cdr unsorted))

    ;else return the sorted list.
    sorted)

  )

;Main insert-sort function
(defun insertion-sort (L)
    (if (<= (length L) 1)
        L ; Return the list if it has 1 or fewer elements
    )
    (let (  ;define variables
            (sorted (list (car L))) ;first element is added to the sorted list, as a list of one is sorted.
            (unsorted (cdr L)) ; unsorted is defined to be the rest of the list as the first element is removed.
          )
            (setq sorted (insertion-helper sorted unsorted))
      sorted) ; return sorted list.
    )


;commands to use to test
; (insertion-sort '(2 4 6 1 5 3))
; (insertion-sort '(1 2 3 4 5 6))
; (insertion-sort '(6 5 4 3 2 1))
; (insertion-sort '(5 5 5 5 5 5))
; (insertion-sort '(1))
; (insertion-sort '())
; (insertion-sort '(10 7 8 9 1 5 3 6 2 4))
; (insertion-sort '(-3 -1 -2 -5 -4))
; (insertion-sort '(3 -1 2 -5 4 -2))
; (insertion-sort '(3 1 2 3 4 2 1))