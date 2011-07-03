(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))


(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))


(define (midpoint-segment seg)
  (define (average a b)
    (/ (+ a b) 2))
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point (average (x-point start)
                         (x-point end))
                (average (y-point start)
                         (y-point end)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define test-seg
  (make-segment (make-point 1 10)
                (make-point 5 15)))
