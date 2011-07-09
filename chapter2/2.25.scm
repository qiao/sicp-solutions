(define list1 
  (list 1 3 (list 5 7) 9))
(define (pick1)
  (car (cdr (car (cdr (cdr list1))))))


(define list2
  (list (list 7)))
(define (pick2)
  (car (car list2)))


(define list3
  (list 1 
        (list 2 
              (list 3 
                    (list 4 
                          (list 5 
                                (list 6 7)))))))
(define (pick3)
  (define (pick items)
    (car (cdr items)))
  ((repeated pick 6) list3))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))
