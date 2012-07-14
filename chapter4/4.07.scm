;; (let* ((<var1> <exp1>)
;;        (<var2> <exp2>)
;;        (<var3> <exp3>))
;;   <body>)
;; 
;; (let ((<var1> <exp1>))
;;   (let ((<var2> <exp2>))
;;     (let ((<var3> <exp3>))
;;       <body>)))
;;       
(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-bindings exp) (cadr exp))
(define (let*-body exp) (cddr exp))

(define (let*->nested-lets exp)
  (let ((bindings (let*-bindings exp))
        (body (let*-body exp)))
    (define (make bindings)
      (if (null? bindings)
          body
          (list 'let 
                (list (car bindings))
                (make (cdr bindings)))))
    (make bindings)))
