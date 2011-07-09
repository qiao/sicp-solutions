(define x (list (list 1 2) (list 3 4)))

(define (fringe items)
  (define (iter items acc)
    (if (null? items)
        acc
        (let ((head (car items))
              (tail (cdr items)))
          (if (list? head)
              (iter tail (append acc (fringe head)))
              (iter tail (append acc (list head)))))))
  (iter items '()))
