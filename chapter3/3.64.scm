(define (stream-limit stream tolerance)
  (let* ((fst (stream-car stream))
         (snd (stream-car (stream-cdr stream)))
         (diff (abs (- fst snd))))
    (if (< diff tolerance)
        snd
        (stream-limit (stream-cdr stream) tolerance))))
