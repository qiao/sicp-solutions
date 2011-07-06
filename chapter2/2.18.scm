(define nil '()) ; nil is not defined in MIT/GNU Scheme

(define (reverse items)
  (define (reverse-iter items acc)
    (if (null? items)
        acc
        (reverse-iter (cdr items) (cons (car items) acc))))
  (reverse-iter items nil))
