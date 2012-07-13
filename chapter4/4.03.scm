;; Assume that we have a global table and two operations:
;; ``put'' and ``get''. 
;; 
;;    (put <key> <val>) puts the key value association into the table
;;    (get <key> <val>) gets the value associated with the key

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get (car exp))
         (get (car exp) exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))

(put 'quote
     (lambda (exp env) (text-of-quotation exp)))
(put 'set!
     (lambda (exp env) (eval-assignment exp env)))
(put 'define
     (lambda (exp env) (eval-definition exp env)))
(put 'if
     (lambda (exp env) (eval-if exp env)))
(put 'lambda
     (lambda (exp env) (make-procedure (lambda-parameters exp)
                                       (lambda-body exp)
                                       env)))
(put 'begin
     (lambda (exp env) (eval-sequence (begin-actions exp) env)))
(put 'cond
     (lambda (exp env) (eval (cond->if exp) env)))
