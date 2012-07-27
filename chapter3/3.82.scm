(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (random-stream-in-range low high)
  (let ((v (random-in-range low high)))
    (cons-stream v
                 (random-stream-in-range low high))))

(define (estimate-integral p x1 x2 y1 y2)
  (let* ((area (* (- x2 x1) (- y2 y1)))
         (xs (random-stream-in-range x1 x2))
         (ys (random-stream-in-range y1 y2))
         (experiment-stream (stream-map p xs ys)))
    (stream-scale (monte-carlo experiment-stream 0 0)
                  area)))
