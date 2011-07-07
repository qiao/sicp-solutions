(define (for-each f items)
  (cond ((null? items)
         #t)
        (else
          (f (car items))
          (for-each f (cdr items)))))
