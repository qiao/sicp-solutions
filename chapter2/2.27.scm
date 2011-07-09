(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
  (define (iter items acc)
    (if (null? items)
        acc
        (let ((head (car items))
              (tail (cdr items)))
          (if (list? head)
              (iter tail (append (list (deep-reverse head)) acc))
              (iter tail (append (list head) acc))))))
  (iter items '()))
