(define (=zero? v) 
  (apply-generic '=zero? v))

;; scheme-number package
(put '=zero? (scheme-number) 
     (lambda (v)
       (= v 0)))

;; rational package
(put '=zero? (rational)
     (lambda (v)
       (= 0 (numer v))))

;; complex package
(put '=zero? (rational)
     (lambda (v)
       (= 0 (magnitude v))))
