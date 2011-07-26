(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-brach tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))


(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x2)
               (intersection-set-list set1 (cdr set2)))))))

(define (union-set-list set1 set2)
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

(define (union-set set1 set2)
  (list->tree (union-set-list (tree->list set1)
                              (tree->list set2))))

(define (intersection-set set1 set2)
  (list->tree (intersection-set-list (tree->list set1)
                                     (tree->list set2))))
