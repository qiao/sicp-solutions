(define (f g)
  (g 2))

; the procedure call is as follows:
(f f)
(f 2)
(2 2)
; when evaluating (2 2), the interpreter will raise an error,
; since 2 is not applicable
