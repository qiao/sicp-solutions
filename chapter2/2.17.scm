(define (last-pair items)
  (let ((tail (cdr items)))
    (if (null? tail)
        items
        (last-pair tail))))
