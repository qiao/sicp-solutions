(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (id n)
  n)

(define (inc n)
  (+ 1 n))

(define (factorial n)
  (product id 1 inc n))

(define (appr-pi n)
  (define (term x)
    (if (odd? x)
        (/ (+ 1 x) (+ 2 x))
        (/ (+ 2 x) (+ 1 x))))
  (* 4
     (product term 1 inc n)))

(define (product-iter term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (* (term a) acc))))
  (iter 1 1))
