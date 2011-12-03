(define (ripple-carry-adder As Bs Ss C)
  (let ((c-in (make-wire)))
    (if ((null? (cdr As)))
        (set-signal! c-in 0)
        (ripple-carry-adder (cdr As) (cdr Bs) (cdr Ss) c-in))
    (full-adder (car As) (car Bs) c-in (car Ss) C)))

;;   ripple-carry-adder-delay
;; = n * full-adder-delay
;; = n * (2 * full-adder-delay + or-gate-delay)
;; = n * (2 * max(and-gate-delay + inverter-delay,
;;                or-gate-delay)
;;        + and-gate-delay)
