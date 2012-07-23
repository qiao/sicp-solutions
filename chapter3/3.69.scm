(define (triples s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (pair) (cons (stream-car s) pair))
                  (stream-cdr (pairs t u)))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagorean-triples
  (let ((pythagorean-triple? 
          (lambda (triple)
            (let ((i (car triple))
                  (j (cadr triple))
                  (k (caddr triple)))
              (= (+ (square i)
                    (square j))
                 (square k))))))
    (stream-filter pythagorean-triple? (triples integers integers integers))))
