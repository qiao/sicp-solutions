(define (make-accumulator value)
  (lambda (increment)
    (begin (set! value (+ value increment))
           value)))
