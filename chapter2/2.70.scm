(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
                (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad-bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))


(define (encode-symbol symbol tree)
  (define (has-symbol? symbol symbol-list)
    (not (equal? false (memq symbol symbol-list))))
  (if (has-symbol? symbol (symbols tree))
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (if (has-symbol? symbol (symbols left))
            (if (leaf? left)
                '(0)
                (cons 0 (encode-symbol symbol left)))
            (if (leaf? right)
                '(1)
                (cons 1 (encode-symbol symbol right)))))
      (error "Symbol not in tree")))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge tree)
  (if (null? (cdr tree))
      (car tree)
      (let ((left (car tree))
            (right (cadr tree))
            (rest (cddr tree)))
        (successive-merge 
          (adjoin-set (make-code-tree left right) 
                      rest)))))

(define sample-tree
  (generate-huffman-tree
    '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) 
      (YIP 9) (JOB 2) (WAH 1))))

;; (encode '(Get a job) sample-tree)
;; => (1 1 1 1 1 1 1 0 0 1 1 1 1 0)
;;
;; (encode '(Sha na na na na na na na na) sample-tree)
;; => (1 1 1 0 0 0 0 0 0 0 0 0)
;;
;; (encode '(Sha boom) sample-tree)
;; => (1 1 1 0 1 1 0 1 1)
