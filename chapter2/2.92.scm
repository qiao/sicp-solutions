;; with the ordering imposed on the variables, the polynomial representation
;; is now like this:
;;
;; 5x + 2 : (make-polynomial '(x) '(((1) 5) ((0) 2)))
;;
;; xy + 1 : (make-polynomial '(x y) '(((1 1) 1) ((0 0) 1)))
;;
;; 
;;                                              first term
;;                                              ____^____
;;                                             /         \
;; 2x^2 + 2xy + 2z: (make-polynomial '(x y z) '(((2 0 0) 2) ((1 1 0) 2) ((0 0 1) 2))
;;                                                | | |  |
;;                              order of x -------+ | |  +---- coefficient
;;                                  order of y  ----+ +----  order of z
;;

(define (install-polynomial-package)
  ;; internal procedures
  (define (make-poly variable variable-list term-list)
    (cons variable-list term-list))
  (define (variable-list poly) (car poly))
  (define (term-list poly) (cdr poly))

  (define (make-term order-list term-list)
    (cons order-list term-list))
  (define (order-list term) (car term))
  (define (coeff term) (cdr term))

  (define (variable? x) (symbol? x))
  (define (same-variable-list? list1 list2)
    (define (all? pred items)
      (cond ((null? items) #t)
            ((pred (car items))
             (all? pred (cdr items)))
            (else #f)))
    (and (all? variable? list1)
         (all? variable? list2)
         (equal? list1 list2)))

  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist?) (null? term-list))

  (define (compare-order L1 L2)
    (cond ((and (null? L1)
                (null? L2))
           0)
          ((null? L1)
           -1)
          ((null? L2)
           1)
          (else
            (let ((O1 (car L1)) (O2 (car L2)))
              (cond ((> O1 O2) 1)
                    ((< O1 O2) -1)
                    (else 
                      (compare-order (cdr L1) (cdr L2))))))))

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))

  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else
            (let ((t1 (first-term L1)) (t2 (first-term L2)))
              (let ((comparison (compare-order (order-list t1)
                                               (order-list t2))))
                (cond ((= 1 comparison)
                       (adjoin-term t1 
                                    (add-terms (rest-terms L1) 
                                               L2)))
                      ((= -1 comparison)
                       (adjoin-term t2
                                    (add-terms (rest-terms L2)
                                               L1)))
                      (else
                        (adjoin-term (make-term (order-list t1)
                                                (add (coeff t1) (coeff t2)))
                                     (add-terms (rest-terms L1)
                                                (rest-terms L2))))))))))

  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
        (the-empty-termlist)
        (add-terms (mul-term-by-all-terms (first-term L1) L2)
                   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
        (the-empty-termlist)
        (let ((t2 (first-term L)))
          (adjoin-term
            (make-term (add-order-list (order-list t1) (order-list t2))
                       (mul (coeff t1) (coeff t2)))
            (mul-term-by-all-terms t1 (rest-terms L))))))
  (define (add-order-list O1 O2)
    (cond ((null? O1) O2)
          ((null? O2) O1)
          (else 
            (cons (+ (car O1) (car O2))
                  (add-order-list (cdr O1) (cdr O2))))))

  (define (add-poly p1 p2)
    (if (same-variable-list? (variable-list p1) (variable-list p2))
        (make-poly (variable-list p1)
                   (add-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- ADD-POLY"
               (list p1 p2))))
  (define (mul-poly p1 p2)
    (if (same-variable-list? (variable-list p1) (variable-list p2))
        (make-poly (variable-list p1)
                   (mul-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- MUL-POLY"
               (list p1 p2))))

  ;; interface to rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  ('put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  'done)
