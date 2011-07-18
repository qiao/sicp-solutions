(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))


;; (define (make-frame origin edge1 edge2)
;;  (cons origin (cons edge1 edge2)))
;;
;; (define (edge1-frame frame)
;;  (cadr frame))
;;
;; (define (edge2-frame frame)
;;  (cddr frame))
