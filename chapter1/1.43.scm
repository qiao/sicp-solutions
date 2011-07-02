(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))
