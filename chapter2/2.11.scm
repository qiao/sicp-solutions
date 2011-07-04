(define (make-interval a b) (cons a b))

(define (upper-bound z)
  (max (car z)
       (cdr z)))

(define (lower-bound z)
  (min (car z)
       (cdr z)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (sign-pair lo up)
  (cond ((and (< lo 0) (< up 0)) -1)
         ((and (< lo 0) (> up 0)) 0)
         (else 1)))

(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y))
        (xs (sign-pair xl xu))
        (ys (sign-pair yl yu)))
    (cond ((< xs 0)
           (cond ((< ys 0)                       ; - - - -
                  (make-interval (* xu yu)
                                 (* xl yl)))
                 ((= ys 0)                       ; - - - +
                  (make-interval (* xl yu)
                                 (* xl yl)))
                 (else                           ; - - + +
                  (make-interval (* xl yu)
                                 (* xu yl)))))
          ((= xs 0)
           (cond ((< ys 0)                       ; - + - -
                  (make-interval (* xu yl)
                                 (* xl yl)))
                 ((= ys 0)                       ; - + - +
                  (make-interval (min (* xl yu)
                                      (* xu yl))
                                 (max (* xl yl)
                                      (* xu yu))))
                 (else                           ; - + + +
                  (make-interval (* xl yu)
                                 (* xu yu)))))
          (else
           (cond ((< ys 0)                       ; + + - -
                  (make-interval (* xu yl)
                                 (* xl yu)))
                 ((= ys 0)                       ; + + - +
                  (make-interval (* xu yl)
                                 (* xu yu)))
                 (else                           ; + + + +
                  (make-interval (* xl yl)
                                 (* xu yu))))))))
