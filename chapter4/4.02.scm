;; Note that the ``application?'' predicate is simply defined as
;; ``(pair? exp)''. Therefore, a definition like ``(define x 3)''
;; will be considered as an application with ``define'' being the
;; operator and ``x'' and ``3'' being the operands. If we reorder 
;; the check for applications to be before the check for assignments
;; or definitions, then no assignments or definitions will be evaluated.
;; 

(define (application? exp)
  (tagged-list exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
