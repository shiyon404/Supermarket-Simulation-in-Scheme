;; Done
(module sim-event-queue racket
  (provide
   sim-add-event
   )

  (require "sim-event.rkt")
  
  ;; Shiyon Suresh(001306030)
  ;; This is a sort of "priority queue"
  ;; in O(nlog(n))
  ;; Edited
  (define (sim-add-event sim-event-queue ev)
    
   ;; Adding new event to current event list
   (define new-queue (append sim-event-queue (list ev)))
    
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
  (define final-queue (sort new-queue sort-events))

  ;; Return the sorted queue as a list
  final-queue)
)
  