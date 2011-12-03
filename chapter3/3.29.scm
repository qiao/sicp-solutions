;;       |\              
;; a1 ---|  o---- ~a1 ---+
;;       |/              |       +-----+
;;                       +-------|     |             |\
;;                               |  &  |-- ~a1^~a2 --|  o----
;;                       +-------|     |             |/
;;       |\              |       +-----+
;; a2 ---|  o---- ~a2 ---+
;;       |/        


(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((~a1      (make-wire))
          (~a2      (make-wire))
          (~a1^~a2  (make-wire)))
      (inverter a1 ~a1)
      (inverter a2 ~a2)
      (and-gate ~a1 ~a2 ~a1^~a2)
      (inverter ~a1^~a2 output)))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

;; delay of ``or-gate'' is the delay of ``and-gate'' plus 
;; twice the delay of ``inverter''.
