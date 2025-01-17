;; done
(module sim-lane-list racket
  (provide lane-list?
           less-crowded
           )

  (require "sim-lane.rkt")

  ;; Abhishek Soni(001344975) 
  ;;edited
  (define (lane-list? lst)
    (list? lst)) ; Checks if is it a list in same format
    
  ;; Abhishek Soni(001344975) 
  ;; This is a sort of "priority queue"
  ;; in O(nlog(n))
  (define (less-crowded sim-lanes )
    (first (sort sim-lanes
                 (lambda (x y)
                    (<
                     (+ (if (lane-bussy? x) 1 0) (lane-length x))
                     (+ (if (lane-bussy? y) 1 0) (lane-length y))
                    )
                    ))))
    
  )