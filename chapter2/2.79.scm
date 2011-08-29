(define (equ? x y)
  (apply-generic 'equ? x y))

;; scheme-number package
(put 'equ? '(scheme-number scheme-number) =)

;; rational package
(put 'equ? '(rational rational)
     (lambda (x y) 
       (and (= (numer x)
               (numer y))
            (= (denom x)
               (denom y)))))

;; complex package
(put 'equ? '(complex complex)
     (lambda (x y)
       (and (= (real-part x)
               (real-part y))
            (= (imag-part x)
               (imag-part y)))))
