;; (sine 12.15)
;; (p (sine (4.05)))
;; (p (p (sine (1.35))))
;; (p (p (p (sine (0.45)))))
;; (p (p (p (p (sine (0.15))))))
;; (p (p (p (p (p (sine (0.05)))))))
;;
;; `p' is applied five times.
;; The order of grown is O(log a).
;; The number of steps is (ceil (\ (log (\ a 0.1) (log 3))))
