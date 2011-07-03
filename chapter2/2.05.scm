(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (extract-expt a n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (iter n acc)
    (if (divides? a n)
        (iter (/ n a) (+ 1 acc))
        acc))
  (iter n 0))

(define (car z)
  (extract-expt 2 z))

(define (cdr z)
  (extract-expt 3 z))
