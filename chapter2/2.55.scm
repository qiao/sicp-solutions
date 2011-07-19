;; 'foo is same as (quote foo)
;; therefore, 
;; (car ''abracadabra) = (car (quote (quote abracadabra)))
;;                     = quote
