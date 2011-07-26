(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-brach tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-brach set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-brach set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-brach set))))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-brach tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-brach tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define sample-tree 
  (make-tree 
    1
    '() 
    (make-tree 
      2 
      '() 
      (make-tree 
        3 
        '() 
        (make-tree 
          4 
          '() 
          (make-tree 
            5 
            '() 
            (make-tree 
              6 
              '() 
              (make-tree 
                7 
                '() 
                '())))))))) 

;; the two tree->list procedures produce the same result
;; => (tree->list-1 sample-tree)
;; (1 2 3 4 5 6 7)
;;
;; the first one has time complexity O(nlogn)
;; the second one has time complexity O(n)
