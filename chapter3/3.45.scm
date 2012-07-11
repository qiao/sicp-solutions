;; Expanding ``(serializer1 exchange)'' and we get 
;;
;; (serializer1 (lambda (account1 account2)
;;                (let ((difference (- (account1 'balance)
;;                                     (account2 'balance))))
;;                  ((account1 'withdraw) difference)
;;                  ((account2 'withdraw) difference))))
;; 
;; Note that ``(account1 'withdraw)'' is equivalent to ``(serializer1 withdraw)''
;; where ``withdraw'' is the internal function of account1.
;; Therefore, when the ``serialized-exchange'' function is called, the same 
;; serializer is being called twice. The second call on serializer1 is waiting 
;; for the previous one to finish while The previous one cannot finish until the
;; second one is finished. So the consequence is that the whole process is
;; blocked.
