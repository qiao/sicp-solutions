(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((a1 (car args))
                    (a2 (cadr args)))
                (cond ((raise-to a1 a2)
                       (apply-generic op (raise-to a1 a2) a2))
                      ((raise-to a2 a1)
                       (apply-generic op (raise-to a2 a1) a1))
                      (else
                        (error "No method for these types")))))))))

;; test if `from' can be raised to `to'
;; if that's the case, return the raised `from'
;; else return #f
(define (raise-to from to)
  (let ((type-from (type-tag from))
        (type-to (type-tag to)))
    (if (equal? type-from type-to)
        from 
        (let ((upper (raise from)))
          (if upper
              (raise-to upper to)
              #f)))))
