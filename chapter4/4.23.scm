;;   (begin
;;     <exp1>
;;     <exp2>
;;     <exp3>)
;;   
;; Alyssa's procedure will produce 
;; 
;;   (execute-sequence '(<proc1> <proc2> <proc3>) env)
;;   
;; The text's procedure will produce
;; 
;;   (lambda (env)
;;     ((lambda (env)
;;        (<proc1> env)
;;        (<proc2> env))
;;      env)
;;     (<proc3> env))
