;; a.
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (let ((val (env-loop env)))
    (if (eq? val '*unassigned*)
        (error "Error ")
        val)))


;; b.
;;
;; (lambda <vars>
;;   (define u <e1>)
;;   (define v <e2>)
;;   <e3>)
;;   
;; =>
;; 
;; (lambda <vars>
;;   (let ((u '*unassigned*)
;;         (v '*unassigned*))
;;     (set! u <e1>)
;;     (set! v <e2>)
;;     <e3>))
(define (scan-out-defines body)
  (let* ((definitions (filter definition? body))
         (rest-expressions (filter (lambda (expr) (not (definition? expr))) body))
         (vars (map definition-variable definitions))
         (vals (map definition-value definitions)))
    (define (make-unassigned-binding var)
      (list var '*unassigned*))
    (define (make-assignment var val)
      (list 'set! var val))
    (append (list 'let
                  (map make-unassigned-binding vars))
            (map make-assignment vars vals)
            rest-expressions)))


;; c.
(define (make-procedure parameters body env)
  (list 'define (scan-out-defines body) env))

(define (procedure-body proc)
  (scan-out-defines (caddr proc)))
