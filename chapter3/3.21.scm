;; What the interpreter prints is the cons of front-ptr and rear-ptr.
;; In order to print the queue properly, we should print what front-ptr
;; points to.

(define (print-queue q)
  (print (front-ptr q)))
