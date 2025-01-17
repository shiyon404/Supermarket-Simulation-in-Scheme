(module sim-lane racket
  (provide lane
           lane?
           lane-id
           lane-user
           lane-bussy?
           lane->string
           lane-length
           lane-pop
           lane-queue
           ; These routines fire events
           lane-append!
           lane-pop!
           lane-bussy-set!
           )

  (require racket/match)
  (define sim-fire-event! null) ; hack to passed procedure


  
  ;; A lane (id . (user . list) 
  (define (lane id sym)
    (set! sim-fire-event! sym) ;; dirty hack
    (cons id (cons null null)))
  
  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane-length ln)
    (length (cddr ln))) ; Fetching the number of customer in inner-list

  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane? val)
    (and(pair? val) ; Checking first pair
      (pair? (cdr val)) ; Checking second pair
      (pair? (cdr(cdr val))) ; Checking third pair
      )

  )
  
  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane-bussy? lane)
    (not (empty? (car(cdr lane)))) ; Checks if null
    )

  (define (lane-bussy-set ln user)
    (match ln
      [(cons id (cons _ q))
       (cons id (cons user q))]))
  
  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane-id lane)
    (car lane) ; Returns the lane id
    )
  
  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane-user val)
    (car (cdr val)) ; Returns the user id 
    )
  
  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (lane-queue val)
    (cddr val) ; Returns the list of customers in queue
    )

  ;; Free
  (define (lane->string ln)
    (let
        ([lane-qu-str (apply
                       string-append 
                       (map
                        (lambda (x)(format "~a:" x))
                        (lane-queue ln)))]
          )
      (format "L(~a)[~a]|<=~a"
              (lane-id ln)
              (~a
               (if (lane-bussy? ln) (lane-user ln) "None" ) #:min-width 4)
              lane-qu-str)))

  ;; Pure
  ;; Free
  (define (lane-append ln user)
    (match ln
      [(cons id (cons u q))
       (cons id (cons u (append q (list user))))]))

  ;; Free
  (define (lane-pop ln)
    (match ln
      [(cons id (cons u (cons q qs)))
       (values q
               (cons id (cons u qs)))]))


  ; IO() fires an event
  (define (lane-bussy-set! ln user)
    (let
        ([new-lane (lane-bussy-set ln user)])
      (begin       
        (if (and
             (> (lane-length new-lane) 0)  
             (not (lane-bussy? new-lane))) ;; till is free
            (begin
              (sim-fire-event! 2(first (lane-queue new-lane)) (lane-id new-lane))) ;; CHECKOUT
            (void))
        )          
      new-lane))

  ;; IO () fires an event
  (define (lane-append! ln user)
    (let
        ([new-lane (lane-append ln user)])
      (begin
        (if (and
             (= (lane-length new-lane) 1)  ;; i'm the only 
             (not (lane-bussy? new-lane))) ;; till is free
            (sim-fire-event! 2 user (lane-id new-lane)) ;; CHECKOUT
            (void))
        )          
      new-lane))
         

  ;; IO() fires an event
  (define (lane-pop! ln )
    (let*-values
        ([(user new-lane) (lane-pop ln )]
         [ (new-la2) (lane-bussy-set new-lane user)]
         )
      (begin
        (sim-fire-event! 3 user (lane-id new-la2)) ;; CHECKOUT
        new-la2)))



  
    
  )