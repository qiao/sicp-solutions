;; (letrec ((<var1> <exp1>)
;;          (<var2> <exp2>))
;;   <body>)
;; 
;; =>
;; 
;; (let ((<var1> '*unassigned*)
;;       (<var2> '*unassigned*))
;;   (set! <var1> <exp1>)
;;   (set! <var2> <exp2>)
;;   <body>)

(define (letrec->let expr)
  (let* ((bindings (cadr expr))
         (body (cddr expr))
         (vars (map car bindings))
         (vals (map cadr bindings)))
    (define (make-unassigned var)
      (list var '*unassigned*))
    (define (make-assignment var val)
      (list 'set! var val))
    (append (list 'let
                  (map make-unassigned vars))
            (map make-assignment vars vals)
            body)))
