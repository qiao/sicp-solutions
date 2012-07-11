;; (define (test-and-set! cell)
;;   (if (car cell)                    ; A
;;       true                          ; B
;;       (begin (set-car! cell true)   ; C
;;              false)))               ; D
;;              
;; 
;; Four marks, namely A, B, C and D are added onto the ``test-and-set!'' function.
;; The following diagram illustrates the situation where P1 and P2 acquire the 
;; mutex at the same time.
;; 
;;
;;       P1            mutex         P2
;;       
;;                     false
;;                     
;;     A = false                    
;;                                A = false
;;                                
;;        C            true
;;        D            
;;                                   C
;;                                   D
;;                                   
