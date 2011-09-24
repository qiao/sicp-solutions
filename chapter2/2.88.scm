(put 'negate 'scheme-number
     (lambda (x)
       (tag (- x))))
(put 'negate 'rational
     (lambda (x)
       (make-rational (- (numer x)) (denom x))))
(put 'negate 'complex
     (lambda (x)
       (make-from-real-imag (- (real-part x))
                            (- (imag-part x)))))
(put 'negate 'polynomial
     (lambda (x)
       (make-poly (variable x)
                  (negate-terms (term-list x)))))
(define (negate-terms terms)
  (if (empty-termlist? terms)
      terms
      (let ((term (first-term terms)))
        (adjoin-term (make-term (order term) (negate (coeff term)))
                     (negate-terms (rest-terms terms))))))
(define (negate x)
  (apply-generic 'negate x))

(put 'sub '(polynomial polynomial)
     (lambda (p1 p2)
       (tag (add-poly p1
                      (negate p2)))))
