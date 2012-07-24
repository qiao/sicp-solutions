(define (cube x) (* x x x))

(define (weight pair)
  (+ (cube (car pair))
     (cube (cadr pair))))

(define pairs (weighted-pairs integers integers weight))
(define numbers (stream-map weight pairs))

(define (filter-ramanujan s)
  (let* ((fst (stream-car s))
         (snd (stream-car (stream-cdr s))))
    (if (= (weight fst) (weight snd))
        (cons-stream fst (filter-ramanujan (stream-cdr s)))
        (filter-ramanujan (stream-cdr s)))))

(define ramanujan-numbers (filter-ramanujan numbers))
