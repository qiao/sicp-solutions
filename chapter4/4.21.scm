;; a.
((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fb k)
      (cond ((= k 0) 1)
            ((= k 1) 1)
            (else
             (+ (fb fb (- k 1))
                (fb fb (- k 2))))))))
 5)


;; b.
(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0)
         true
         (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0)
         false
         (ev? ev? od? (- n 1))))))
