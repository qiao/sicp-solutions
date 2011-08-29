;; (magnitude z)
;; (magnitude (make-complex-from-real-imag 3 4))
;; (magnitude ((get 'make-from-real-imag 'complex) 3 4))
;; (magnitude (tag (make-from-real-imag 3 4)))
;; (magnitude (attach-tag 'complex (make-from-real-imag 3 4)))
;; (magnitude (attach-tag 'complex (get 'make-from-real-imag 'rectangular) 3 4))
;; (magnitude (attach-tag 'complex (tag (make-from-real-imag 3 4))))
;; (magnitude (attach-tag 'complex (attach-tag 'rectangular (cons 3 4))))
;; (magnitude (cons 'complex (cons 'rectangular (cons 3 4))))
;; (magnitude '(complex rectangular 3 4))
;; (apply-generic 'magnitude '(complex rectangular 3 4))
;; (magnitude '(rectangular 3 4))
;; (apply-generic 'magnitude '(rectangular 3 4))
;; (magnitude '(3 4))
;; 5

;; `apply-generic' is invoked 2 times
