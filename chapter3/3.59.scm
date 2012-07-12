(define (integrate-series stream)
  (stream-map / stream integers))

(define cosine-series
  (cons-stream 1 (integrate-series sine-series)))

(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series)
                               -1)))
