;; a.
(define (reduce-terms n d)
  (let ((g (gcd-terms n d)))
    (list (car (div-terms n g))
          (cadr (div-terms d g)))))

(define (reduce-poly p1 p2)
  (let ((v1 (variable p1))
        (v2 (variable p2)))
    (if (same-variable? v1 v2)
        (let ((reduced (reduce-terms (term-list p1) 
                                     (term-list p2))))
          (list (make-poly v1 (car reduced))
                (make-poly v2 (cadr reduced))))
        (error "Polys not in same var -- REDUCE-POLY",
               (list p1 p2)))))

;; b.

(define (reduce n d)
  (apply-generic 'reduce n d))

(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g)
          (/ d g))))


;; in scheme-number package
(put 'reduce '(scheme-number scheme-number)
     (lambda (n d)
       (let ((reduced (reduce-integers n d)))
         (map tag reduced))))


;; in polynomial package
(put 'reduce '(polynomial polynomial)
     (lambda (n d)
       (let ((reduced (reduce-poly n d)))
         (map tag reduced))))

;; in rational package
(define (make-rat n d)
  (let ((reduced (reduce n d)))
    (cons (car reduced)
          (cadr reduced))))
