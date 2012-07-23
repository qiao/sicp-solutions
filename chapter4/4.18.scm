;; (define (solve f y0 dt)
;;   (define y (integral (delay dy) y0 dt))
;;   (define dy (stream-map f y))
;;   y)
;; 
;; will be converted to:
;; 
;; (define (solve f y0 dt)
;;   (let ((y '*unassigned*)
;;         (dy '*unassigned*))
;;     (let ((a (integral (delay dy) y0 dt))
;;           (b (stream-map f y)))
;;       (set! y a)
;;       (set! dy b)
;;       y)))
;;       
;; Note that when evaluating (stream-map f y), the value of y
;; is still unassigned. Therefore, it will not work.
