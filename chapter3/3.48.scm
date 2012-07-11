;; If a process want to acquire a2, then it must acquire a1 first,
;; and two processes cannot acquire a1 at the same time, therefore,
;; the deadlock is avoided.


(define (make-account number balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance account))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((protected (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (protected withdraw))
            ((eq? m 'deposit) (protected deposit))
            ((eq? m 'serializer) protected)
            ((eq? m 'balance) balance)
            ((eq? m 'number) number)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (number1 (account1 'number))
        (number2 (account2 'number)))
    (if (< number1 number2)
        ((serializer2 (serializer1 exchange)) account1 account2)
        ((serializer1 (serializer2 exchange)) account1 account2))))
