; Suppose there are two intervals, namely a and b,
; where a = [ca - ta, ca + ta], b = [cb - tb, cb + tb]
; then a * b = [(ca - ta) * (cb - tb), (ca + ta) * (cb + tb)]
;            = [ca * cb - ca * tb - ta * cb + ta * tb,
;               ca * cb + ca * tb + ta * cb + ta * tb]
; note that in the above equation, ta * tb can be ignored.
; therefore we have
; a * b = (ca * cb) * [1 - tb / cb - ta / ca,
;                      1 + tb / cb + ta / ca]
;       = (ca * cb) * [1 - pb - pa, 1 + pb + pa]
;       = (ca * cb) * [1 - (pa + pb), 1 + (pa + pb)]

(define (make-interval a b) (cons a b))

(define (upper-bound z)
  (max (car z)
       (cdr z)))

(define (lower-bound z)
  (min (car z)
       (cdr z)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

(define (make-center-percent c p)
  (let ((w (* c p 0.01)))
    (make-center-width c w)))

(define (percent i)
  (let ((w (width i))
        (c (center i)))
    (* 100.0 (/ w c))))

(define (mul-interval x y)
  (make-center-percent (* (center x) (center y))
                       (+ (percent x) (percent y))))
