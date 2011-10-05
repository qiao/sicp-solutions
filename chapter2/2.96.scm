;; a.
(define (pseudoremainder-terms P Q)
  (let ((O1 (order (first-term P)))
        (O2 (order (first-term Q)))
        (c (coeff (first-term Q))))
    (let ((factor (expt c (+ 1 O1 (- O2)))))
      (let ((new-P (mul-term-by-all-terms (make-term 0 factor) 
                                          P)))
        (cadr (div-terms new-P Q))))))

(define (gcd a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))

;; b.
(define (gcd-terms a b)
  (if (empty-termlist? b)
      (let ((coeff-list (map cadr a)))
        (let ((gcd-coeff (apply gcd coeff)))
          (div-terms a (make-term 0 gcd-coeff))))
      (gcd-terms b (pseudoremainder-terms a b))))
