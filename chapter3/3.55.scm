(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (stream-add (stream-cdr stream)
                           partial-sums stream)))
