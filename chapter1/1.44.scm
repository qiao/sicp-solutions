(define (smooth f)
  (define (average a b c)
    (/ (+ a b c) 3))
  (let ((dx 0.00001))
    (lambda (x) (average (f (+ x dx)) (f x) (f (- x dx))))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))

(define (n-fold-smooth n)
  (lambda (x) ((repeated smooth n) x)))
