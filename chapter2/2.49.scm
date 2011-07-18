(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
      segment-list)))


(define (draw-outline frame)
  ((segments->painter 
     (list (make-segment (make-vect 0 0)
                         (make-vect 0 1))
           (make-segment (make-vect 0 1)
                         (make-vect 1 1))
           (make-segment (make-vect 1 1)
                         (make-vect 1 0))
           (make-segment (make-vect 1 0)
                         (make-vect 0 0))))
   frame))

(define (draw-x frame)
  ((segments->painter
     (list (make-segment (make-vect 0 0)
                         (make-vect 1 1))
           (make-segment (make-vect 1 0)
                         (make-vect 0 1))))
   frame))

(define (draw-diamond frame)
  ((segments->painter
     (list (make-segment (make-vect 0 0.5)
                         (make-vect 0.5 0))
           (make-segment (make-vect 0.5 0)
                         (make-vect 1 0.5))
           (make-segment (make-vect 1 0.5)
                         (make-vect 0.5 1))
           (make-segment (make-vect 0.5 1)
                         (make-vect 0 0.5))))))
