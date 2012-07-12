(define sum 0)
(define (accum x)
  (newline)
  (display "accum")
  (display x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))  ; sum is 1
(define y (stream-filter even? seq))                              ; sum is 6
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq)) ; sum is 10
(stream-ref y 7)                                                  ; sum is 136
(display-stream y)                                                ; sum is 210
;; 10
;; 15
;; 45
;; 55
;; 105
;; 120
;; 190
;; 210
