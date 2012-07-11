;; An account can only be exchanged with *one* other account at a specific
;; time, due to the existence of the serializer. Therefore, after arbitrary
;; number of exchanges, the final balances can only be $10, $20 and $30 in
;; some order.
;; 
;;
;; Suppose there're three accounts and two processes, namely A, B, C, P1 and P2.
;; If we exchange A-B and B-C at the same time. Then, a possible sequence is 
;; as follows.
;; 
;;       P1                A             B             C                P2
;;       
;;                        100           200           300
;;                     
;;     A = 100
;;     B = 200
;;  D = A - B = -100                                                
;;                                                                  C = 100
;;                                                                  B = 200
;;                                                               D = B - C = -100
;;                                                                  
;;  A = A - D = 200       200
;;  B = B + D = 100                     100
;;  
;;                                      200                      B = B - D = 200 
;;                                                     200       C = C + D = 200
;;                                                     
;; We can see that the final balances are $200, $200 and $200. It's not a
;; permutation of $100, $200 and $300. But the total sum does not change.
