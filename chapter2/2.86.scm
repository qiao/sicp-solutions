(define (add-complex z1 z2)
  (make-from-real-imag (add (real-part z1) (real-part z2))
                       (add (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
  (make-from-real-imag (sub (real-part z1) (real-part z2))
                       (sub (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
  (make-from-real-imag (mul (magnitude z1) (magnitude z2))
                       (add (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-real-imag (div (magnitude z1) (magnitude z2))
                       (sub (angle z1) (angle z2))))

(put 'sine 'scheme-number
     (lambda (x)
       (tag (sin x))))
(put 'cosine 'scheme-number
     (lambda (x)
       (tag (cos x))))

(put 'sine 'rational
     (lambda (x)
       (tag (sin (/ (numer x)
                    (denom x))))))
(put 'cosine 'rational
     (lambda (x)
       (tag (cos (/ (numer x)
                    (denom x))))))

(define (sine x)
  (apply-generic 'sine x))
(define (cosine x)
  (apply-generic 'cosine x))
