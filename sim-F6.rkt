(module sim-F6 racket
  (provide all-cust-wait_lst
           most-crowded
           event-params-lst
           is-sorted?)

 (require "sim-event.rkt")
 (require "sim-event-queue.rkt")
 (require "sim-utils.rkt")
 (require "sim-lane-list.rkt")
 (require "sim-lane.rkt")

;F6 Additional feature
;---------------------

;F6.1.i
;======
;all-cust-wait_lst returns a list of the lists of customers
;                          waiting in the queue for each lane
(define (all-cust-wait_lst ln-lst)
  (raise 'MissingBodyFor-all-cust-wait_lst))

;F6.1.ii
;=======
;most-crowded returns the lane with the greatest number of customers
(define (most-crowded ln-lst)
  (raise 'MissingBodyFor-most-crowded))


;; Shiyon Suresh(001306030)
;F6.2.i
;======
;event-params-lst returns a list of customer and lane IDs as pairs
(define (event-params-lst ev-lst)

  ;; Created get-pair
 (define (get-pair val)
   (if (pair? (cdr val)) ; Check if its pair
       (cons (cons (car (cdr ( cdr (car val) ))) (cdr (cdr ( cdr (car val) )))) (get-pair (cdr val))) ; Get last two digits as pair and calls the recursion

         (list (cons (car (cdr ( cdr (car val) ))) (cdr (cdr ( cdr (car val) ))))))
   
   )
  
  (get-pair ev-lst) ; Calling the get-pair

)
  
;; Shiyon Suresh(001306030)
;F6.2.ii
;=======
; is-sorted returns #t when if ev-lst is sorted 
; example of sorted ev-lst ((0 2 1 . 0) (0 1 2 . 0) (0 1 3 . 0))
(define (is-sorted? ev-lst)
  
    
    ;; Event to sort by list
  (define (sort-events val-1 val-2)
    (let ((time-1 (car val-1)) ; Gets the values from pair
          (time-2 (car val-2))
          (cust-1 (cdr val-1))
          (cust-2 (cdr val-2)))
      (cond
        ((= time-1 time-2) (< (cadr cust-1) (cadr cust-2))) ; Sort by customer ID if times are equal
        (else (< time-1 time-2))))) ; Sort by time



  ;; Sorting the queue using the combined list
  (define final-queue (sort ev-lst sort-events))

  ;;Check if both list are same
  (equal? final-queue ev-lst))

)
