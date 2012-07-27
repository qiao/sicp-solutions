;; As derived expression:
;;
;; (unless <condition>
;;         <usual-value>
;;         <exceptional-value>)
;; 
;; =>
;; 
;; (if <condition>
;;     <exceptional-value>
;;     <usual-value>)
;;     
;;     
;; As procedure:
;; 
;; one may do:
;; 
;; (define select-y '(#t #f #t #t))
;; (define xs '(1 3 5 7))
;; (define ys '(2 4 6 8))
;; (define selected (map unless select-y xs ys))
