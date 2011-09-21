(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (try-apply op args type-tags type-tags)))))

;; For each type in the `to-type-tags' list, test to see whether all
;; the types in the `type-tags' can be coerced to that type. If that's
;; the case, coerce all the types and call `apply-generic`.
(define (try-apply op args type-tags to-type-tags)
  (if (null? to-type-tags)
      (error "No method for these types")
      (let ((to-type (car to-type-tags))
            (rest-types (cdr to-type-tags)))
        (if (all-can-coerce-to? to-type type-tags)
            (apply-generic op (map (lambda (arg)
                                     (let ((type (type-tag arg)))
                                       (if (equal? type to-type)
                                           arg
                                           ((get-coercion type to-type) arg))))))
            (try-apply op args type-tags rest-types)))))


;; determine whether all the items is true to the given predicate
(define (all? pred items)
  (if (null? items)
      #t
      (let ((head (car items))
            (tail (cdr items)))
        (if (pred head)
            (all? pred tail)
            #f))))


;; determine whether all the types can be coerced to the given type
(define (all-can-coerce-to? type types)
  (all (lambda (t) 
         (or (get-coercion t type)
             (equal? type t)))
       types))


;; Part b.
;; There's a case in which the above strategy will not work:
;; Consider three types, namely A, B and C, with only two possible coercions:
;; A -> B and B -> C. It's not possible to choose any type in these three types
;; to make all the other two types be coerced to it in a single step. And thus
;; the above strategy will fail. 
