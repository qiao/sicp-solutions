(define nil '())

(define (same-parity head . tail)
  (define (iter items acc)
    (if (null? items)
        acc
        (iter (cdr items)
              (if (even? (+ (car items) head))
                  (append acc (list (car items)))
                  acc))))
  (cons head (iter tail nil)))
