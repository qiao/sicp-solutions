(define nil '())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer)))) ;; the problem lies here 
                               ;; in each iteration, the head of the
                               ;; list is appended at the front
                               ;; of the answer
                               ;; thus the answer is reversed
  (iter items nil))

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer 
                    (square (car things)))))) ;; here
                                              ;; the second argument
                                              ;; of append must be
                                              ;; a list
  (iter items nil))
