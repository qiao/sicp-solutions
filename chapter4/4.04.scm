;; register the handler
(put 'and
     (lambda (exp env) (eval-and exp env)))
(put 'or
     (lambda (exp env) (eval-or exp env)))


;; implement as special forms
(define (eval-and exp env)
  (define (eval-expressions exps)
    (cond ((null? exps) true)
          ((true? (eval (car exps) env))
           (eval-expressions (cdr exps)))
          (else false)))
  (eval-expressions (cdr exp)))

(define (eval-or exp env)
  (define (eval-expressions exps)
    (cond ((null? exps) false)
          ((false? (eval (car exps) env))
           (eval-expressions (cdr exps)))
          (else true)))
  (eval-expressions (cdr exp)))


;; implement as derived expressions
(define (eval-and exp env)
  (eval (and->if exp) env))

(define (and->if exp)
  (define (expand exps)
    (if (null? exps)
        true
        (make-if (car exps)
                 (expand (cdr exps))
                 false)))
  (expand (cdr exp)))


(define (eval-or exp env)
  (eval (or->if exp) env))

(define (or->if exp)
  (define (expand exps)
    (if (null? exps)
        false
        (make-if (car exps)
                 true
                 (expand (cdr exps)))))
  (expand (cdr exp)))
