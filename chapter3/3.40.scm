;;    Result                                Description
;;    
;;   1000000       P1 sets x to 100 then P2 sets x to 1000000
;;   100000        P2 gets one x of 10, P1 sets x to 100, P2 gets two x of 100, P2 sets x to 100000
;;   10000         P2 gets two x of 10, P1 sets x to 100, P2 gets one x of 10, P2 sets x to 10000
;;   1000          P2 gets three x of 10, P1 sets x to 100, P2 sets x to 1000
;;   100           P1 gets two x of 10, P2 sets x to 1000, P1 sets x to 100
;;   
;;
;;  If the serializer is used, then the result can only be 1000000
