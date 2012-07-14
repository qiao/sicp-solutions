;; (let <var> ((<var1> <exp1>)
;;             (<var2> <exp2>)) 
;;   <body>)
;; 
;; is equivalent to
;; 
;; (begin 
;;   (define (<var> <var1> <var2>)
;;     <body>)
;;   (<var> <exp1> <exp2>))


(define (let? exp)
  (tagged-list? exp 'let))
(define (named-let? exp)
  (symbol? (cadr exp)))

(define (let-bindings exp) 
  (if (named-let? exp)
      (caddr exp)
      (cadr exp)))
(define (let-body exp)
  (if (named-let? exp)
      (cdddr exp)
      (cddr exp)))

(define (binding-var binding) (car binding))
(define (binding-exp binding) (cdr binding))

(define (named-let-name exp) (cadr exp))


(define (let->combination exp)
  (let* ((bindings (let-bindings exp))
         (body (let-body exp))
         (vars (map binding-var bindings))
         (exps (map binding-exp bindings)))
    (if (named-let? exp)
        (sequence->exp 
          (list 
            (list 'define
                  (cons (named-let-name exp) vars)
                  body)
            (cons (named-let-name exp) exps)))
        (cons (make-lambda vars body) exps))))
