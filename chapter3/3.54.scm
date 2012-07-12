(define (mul-streams s1 s2)
  (stream-map * s1 s2))

;; factorials:                    '(1  2  6  24  120)
;; integers-starting-from 2:      '(2  3  4  5   6  )
;; after mul-streams:             '(2  6  24 120 720)

(define factorials (cons-stream 1 
                                (mul-streams factorials
                                             (integers-starting-from 2))))
