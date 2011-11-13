;; Floyd's cycle-finding algorithm.
;; http://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare

(define (cycle? x)
  (define (run tortoise hare)
    (cond ((null? tortoise)
           #f)
          ((null? hare)
           #f)
          ((null? (cdr hare))
           #f)
          ((null? (cddr hare))
           #f)
          ((eq? (car tortoise) (car hare))
           #t)
          (else
           (run (cdr tortoise) (cddr hare)))))
  (run x (cdr x)))
