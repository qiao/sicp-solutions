(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

(define (mobile? structure)
  (list? structure))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (+ (branch-weight left)
       (branch-weight right))))


(define (torque branch)
  (* (branch-length branch)
     (let ((structure (branch-structure branch)))
       (if (mobile? structure)
           (total-weight structure)
           structure))))

(define (branch-balanced? left right)
  (= (torque left)
     (torque right)))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (let ((left-structure (branch-structure left))
          (right-structure (branch-structure right)))
      (and (branch-balanced? left right)
           (if (mobile? left-structure)
               (balanced? left-structure)
               #t)
           (if (mobile? right-structure)
               (balanced? right-structure)
               #t)))))

;; d. only need to change the accessors of mobile and branch

;; test:
;;                   |
;;                 3 | 3
;;                -------             <- 2
;;                |     |
;;                2   2 | 2
;;                    -----           <- 1
;;                    |   |
;;                    3   3

(define m1
  (make-mobile (make-branch 2 3)
               (make-branch 2 3)))
(define m2
  (make-mobile (make-branch 3 6)
               (make-branch 3 m1)))
