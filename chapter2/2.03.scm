; point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


; segment
(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (print-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (print-point start)
    (print-point end)))

; rectangle-1 (implementated as (upper-left-corner width height))
(define (make-rectangle upper-left-corner width height)
  (cons upper-left-corner
        (cons width height)))

(define (width rect)
  (car (cdr rect)))
(define (height rect)
  (cdr (cdr rect)))

(define test-rect
  (make-rectangle (make-point 10 20) 20 30))

; rectangle-2 (implemented as (upper-left-corner lower-right-corner))
;(define (make-rectangle upper-left-corner lower-right-corner)
;  (cons upper-left-corner lower-right-corner))
;
;(define (width rect)
;  (let ((upper-left-corner (car rect))
;        (lower-right-corner (cdr rect)))
;    (- (x-point lower-right-corner)
;       (x-point upper-left-corner))))
;
;(define (height rect)
;  (let ((upper-left-corner (car rect))
;        (lower-right-corner (cdr rect)))
;    (- (y-point upper-left-corner)
;       (y-point lower-right-corner))))
;
;(define test-rect
;  (make-rectangle (make-point 10 60) (make-point 20 40)))
  
(define (area rect)
  (* (width rect)
     (height rect)))

(define (perimeter rect)
  (* 2 (+ (width rect)
          (height rect))))
