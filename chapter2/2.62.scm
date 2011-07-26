(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x2)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (union-set set1 set2)
  (define (union-iter s1 s2 acc)
    (cond ((null? s1) (append acc s2))
          ((null? s2) (append acc s1))
          ((< (car s1) (car s2))
           (union-iter (cdr s1) s2 (append acc 
                                           (list (car s1)))))
          ((> (car s1) (car s2))
           (union-iter s1 (cdr s2) (append acc 
                                           (list (car s2)))))
          (else
            (union-iter (cdr s1) (cdr s2) (append acc 
                                                  (list (car s1)))))))
  (union-iter set1 set2 '()))
