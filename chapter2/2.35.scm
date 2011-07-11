(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (tree)
                         (if (pair? tree)
                             (count-leaves tree)
                             1)) 
                       t)))
