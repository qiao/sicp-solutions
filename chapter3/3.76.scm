(define (smooth stream)
  (let ((avpt (/ (+ (stream-car stream)
                    (stream-car (stream-cdr stream)))
                 2)))
    (cons-stream avpt (smooth (stream-cdr stream)))))

(define (make-zero-crossings input-stream smooth)
  (let ((smoothed-stream (smooth input-stream)))
    (map sign-change-detector smoothed-stream (stream-cdr smoothed-stream))))
