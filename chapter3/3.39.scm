;;  Result                        Description
;; 
;;   101       P1 sets x to 100 and then P2 increments x to 101
;;   121       P2 increments x to 11 and then P1 sets it to 121
;;   100       P1 computes (* x x), then P2 sets x to 11, then P1 sets x to 100
