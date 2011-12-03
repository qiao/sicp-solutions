;; For each value ``memo-fib'' is called with, the result is only calculated 
;; once. Therefore the procedure is O(n).
;;
;; The scheme will not work by simply defining ``memo-fib'' to be 
;; ``(memorize fib)'', since the naive ``fib'' will still be called.
;; For example, caculating ``(memo-fib 3)'' equals to:
;;
((let ((table (make-table)))
   (lambda (x)
     (let ((previously-computed-result (lookup x table)))
       (or previously-computed-result
           (let ((result (f x)))  ; <== here the naive (fib 3) will be called
             (insert! x result table)
             result))))) 
  3)
