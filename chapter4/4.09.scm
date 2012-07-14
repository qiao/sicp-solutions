;; A simple ``for'' loop
;; 
;; (for (<var> <start> <stop> <step>)
;;      <body>)
;; 
;; e.g. 
;; 
;; (for (i 0 10 2)
;;      (display i)
;;      (newline))
;;      
;; prints 
;; 0
;; 2
;; 4
;; 6
;; 8
;; 
;; It can be derived as
;; 
;; (begin
;;   (define (iter current <stop> <step>)
;;     (if (< current <stop>)
;;         (begin 
;;           <body>
;;           (iter (+ current <step>) <stop> <step>))))
;;   (iter <start> <stop> <step>))
;;   
;; Note that the above expansion is not safe. Since it introduces
;; two variables, ``current'' and ``iter'', which may collide with the
;; variables defined in users' programs.
