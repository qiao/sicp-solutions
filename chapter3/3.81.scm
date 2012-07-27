(define (rand requests)
  (define (dispatch x msg)
    (if (eq? msg 'generate)
        (rand-update x)
        m))
  (cons-stream random-init
               (stream-map dispatch (rand requests) requests)))
