;; Consider the expression:
;;
;;    (map f xs)
;;    
;; According to the definition of `apply-primitive-procedure':
;; 
;;    (define (apply-primitive-procedure proc args)
;;      (apply-in-underlying-scheme
;;         (primitive-implementation proc) args))
;; 
;; When `(map f xs)' is being called in an environment where `map' is installed 
;; as a primitive, it will be expanded into:
;; 
;;    (map '(f xs))
;;    
;; That's why it fails.
