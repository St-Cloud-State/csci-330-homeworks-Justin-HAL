; These two functions help partion a list into halves.
(defun part-right (L)
    (last L (floor (/ (length L) 2)))
)

(defun part-left (L)
    (ldiff L (part-right L)) 
)

;main partiton function.
;The above two functions are used to keep the code more simple.
(defun partition (L)
  (if (> (length L) 1)
  (list (part-left L) (part-right L) )
  (list L)
  )
)
;///////////////////////////////////////////////////////


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

;main mergesort function. 
(defun merge-sort (L)
  (if (or (null L) (null (cdr L))) ;if the list is empty, or if there is only one element in the list.
      L ;return the list
      
      ;else partition the list and merge the two halfs.
      (let ((part (partition L)))
        (merge-lists (merge-sort (first part)) (merge-sort (second part)))
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

