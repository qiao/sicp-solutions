(define (=zero-poly? p)
  (define (=zero-terms? terms)
    (or (empty-termlist? terms)
        (and (=zero? (coeff (first-term terms)))
             (=zero-terms? (rest-terms terms)))))
  (=zero-termlist? (term-list p)))

(put '=zero? 'polynomial =zero-poly?)
