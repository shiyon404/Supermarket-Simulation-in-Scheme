(module event racket
  (provide event
           event?
           event-time
           event-type
           event-user
           event-lane
           event-params
           ENTER_EVENT
           CHECKOUT_EVENT
           LEAVE_EVENT
           event->string
           )

  (define ENTER_EVENT 1)
  (define CHECKOUT_EVENT 2)
  (define LEAVE_EVENT 3)

  (define event-dict
    (list (cons ENTER_EVENT "ENTER_EVENT")
          (cons CHECKOUT_EVENT "CHECKOUT_EVENT")
          (cons LEAVE_EVENT "LEAVE_EVENT")))
          
  ;; Shiyon Suresh(001306030)
  ;; constructor.
  ;; ( time . ( id . (user . id-lane)))
  ;; Edited
  (define (event time id params)
    (cons time(cons id params)) ; Returns data in pair
    )
  
  ;; Shiyon Suresh(001306030)
  ;; P: True
  ;; Edited
  (define (event? val)
    (and (pair?  val) ; Check if its pair with right format
         (and (pair? (cdr val))
         (pair? (cdr (cdr val))))
         )
         
    )
  
  ;; Shiyon Suresh(001306030)
  ;; P: valid event
  ;; Edited
  (define (event-time ev)
    (car ev)  ; Retuns the event time
    )
  
  ;; Shiyon Suresh(001306030)
  ;; P: valid event
   ;; Edited
  (define (event-type ev)
    (car (cdr ev)) ; Returns the event id
    )

  
  ;; Shiyon Suresh(001306030)
  ;; P: event-params
  ;; Edited
  (define (event-params ev)
    (cdr (cdr ev)) ; Returns the customer and lane ID in pair
    )
  
  ;; Shiyon Suresh(001306030)
   ;; Edited
  (define (event-user ev)
    (car(cdr (cdr ev))) ; Returns the customer ID
    )
  
  ;; Shiyon Suresh(001306030)
   ;; Edited
  (define (event-lane ev)
    (cdr(cdr (cdr ev)))) ; Returns the lane ID



  (require racket/dict)
  (define (event->string ev)
    (format "~a"
            (dict-ref event-dict (event-type ev))
            ))
  )