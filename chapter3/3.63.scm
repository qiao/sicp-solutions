;; In Louis' program, a new stream is created every time
;; (sqrt-stream x) is called. Therefore, the memoization
;; is not being utilized and thus leads to low performance.
;; 
;; If our `delay' is used without `memo-proc', then the two
;; versions would not differ much.
