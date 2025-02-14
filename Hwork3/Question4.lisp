;This function is used to insert a sorted value into a sorted list.
;sorted is a sorted list.
;value is a symbol.
(defun insert (sorted value)
  (let ((less '()) ;empty list, contains elements that have been checked and arre confimed to be less than value.
        (unchecked sorted) ; this list conatins the elements that have not been checked yet.
        (res '())) ; this list will contain the sorted list with the value inserted.
    (if (< (car (last unchecked)) value) ; if the value of the last element of the sorted list is less than the value we are comparing, just put value at the back of the list.
        (setq res (append unchecked (list value)))

      ;while there are more elements to check.
      (loop while (> (length unchecked) 0)
        do (if (<= value (car unchecked)) ; if the current value is less then the first unchecked element.
              ;if true /////////////////////////////////////////
              (progn
                (setq less (append less (list value))) ;insert value at the back of the less list. since value is greater than all these elements, this is the correct sorted position
                (setq res (append less unchecked)) ;add the rest of the elements to the list
                (setq unchecked '())) ; Exit loop,
              ;///////////////////////////////////////////////////
              ; else ////////////////////////////////////////////
              (progn
                (setq less (append less (list (car unchecked)))) ; add first element of unchecked to checked, as that element has been compared.
                (setq unchecked (cdr unchecked))))) ; remove the checked element from the unchecked list.
              ;/////////////////////////////////////////////////////
    )
    res); return res
  )
 
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