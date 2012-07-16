;; The following implementation removes only the binding in the 
;; first frame of environment.
(define (make-unbound! var env)
  (define (scan bindings)
    (cond ((null? bindings)
           (error "Unbound variable -- MAKE-UNBOUND!" var))
          ((eq? var (car (car bindings)))
           (set! bindings (cdr bindings)))
          (else (scan (cdr bindings)))))
  (scan (first-frame env)))
