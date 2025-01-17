(module sim-utils racket
  (provide sim-secs2hour
           sim-log!)

  (require "sim-event.rkt")
  (require "sim-lane.rkt")

  ;; Abhishek Soni(001344975)
  ;; Edited
  (define (sim-secs2hour seconds)
    (let* ((converted-hours (quotient seconds 3600)) ; Getting hour divide total seconds by 3600
           (converted-secs (- seconds (* converted-hours 3600))) ; Getting seconds by substracting hour in seconds from total seconds
           (converted-minutes (quotient converted-secs 60)) ; Getting minutes divide last seconds by 60
           (converted-secs (- converted-secs (* converted-minutes 60)))) ; Getting seconds by substracting minutes in seconds from last seconds
      (list converted-hours converted-minutes converted-secs)))

  ; IO()
  (define (sim-log! time event lanes)  ;; can omit time?
    (let*
        ([aux (sim-secs2hour (event-time event))]
         [hours (first aux)]
         [minutes (second aux)]
         [secs (third aux)]
         [ev (event->string event)]
         [user (event-user event)]
         [lanes-str (apply
                     string-append 
                     (map
                      (lambda (x)(format "~n\t~a" (lane->string x)))
                      lanes))]
         )
      (printf "~a:~a:~a|User: ~a|~a~a~n"
              (~r hours #:min-width 2 #:pad-string "0")
              (~r minutes #:min-width 2 #:pad-string "0") 
              (~r secs #:min-width 2 #:pad-string "0")
              (~r user #:min-width 2 )
              ev
              lanes-str
              )
             
      ))
  

  )
      
         
