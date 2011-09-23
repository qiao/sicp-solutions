(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
              (let ((a1 (car args))
                    (a2 (cadr args)))
                (cond ((raise-to a1 a2)
                       (apply-generic op (raise-to a1 a2) a2))
                      ((raise-to a2 a1)
                       (apply-generic op (raise-to a2 a1) a1))
                      (else
                        (error "No method for these types")))))))))

(put 'project 'complex
     (lambda (x) (make-real (real-part x))))
(put 'project 'real
     (lambda (x) 
       (let ((rational (inexact->exact x)))
         (make-rational (numerator rational)
                        (denominator rational)))))
(put 'project 'rational
     (lambda (x)
       (make-scheme-number (round (/ (numer x) (denom x))))))


(define (drop x)
  (let ((project (get 'project (type-tag x))))
    (if project
        (let ((projected (project (content x))))
          (if ((equal? projected (raise projected)))
              (drop projected)
              x))
        x)))
