(define (merge-weighted s1 s2 w)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((car1 (stream-car s1))
               (car2 (stream-car s2)))
           (if (<= (w car1) (w car2))
               (cons-stream car1 (merge (stream-cdr s1) s2 w))
               (cons-stream car2 (merge s1 (stream-cdr s2 w))))))))


(define (weighted-pairs s1 s2 w)
  (cons-stream
    (list (stream-car s1) (stream-car s2))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s1) x) (stream-cdr s2)))
      (weighted-pairs (stream-cdr s1) (stream-cdr s2) w)
      w)))

;; a.
(define sa
  (let ((weight
          (lambda (pair)
            (+ (car pair)
               (cadr pair)))))
    (weighted-pairs integers integers weight)))

;; b.
(define sb
  (let* ((weight
          (lambda (pair)
            (let ((i (car pair))
                  (j (cadr pair)))
              (+ (* 2 i)
                 (* 3 j)
                 (* 5 i j)))))
         (divisible?
           (lambda (x y)
             (zero? (remainder x y))))
         (stream
           (stream-filter
             (lambda (x)
               (and (not (divisible? x 2))
                    (not (divisible? x 3))
                    (not (divisible? x 5))))
             integers)))
    (weighted-pairs stream stream weight)))
