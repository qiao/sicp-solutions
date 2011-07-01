(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) 
                    (filtered-accumulate combiner null-value 
                                         term (next a) next b filter))
          (combiner null-value
                    (filtered-accumulate combiner null-value
                                         term (next a) next b filter)))))

(define (inc n)
  (+ 1 n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (id n)
  n)

(define (relative-prime? a b)
  (= 1 (gcd a b)))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-lt-n-prime n)
  (define (filter x)
    (relative-prime? x n))
  (filtered-accumulate * 1 id 1 inc n filter))
