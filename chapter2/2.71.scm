;;                  {A B C D E} 31
;;                   /       \
;;                  /         \
;;             {A B C D} 15   {E} 16
;;              /      \   
;;             /        \
;;         {A B C} 7   {D} 8
;;          /     \  
;;         /       \
;;     {A B} 3    {C} 4
;;    /       \
;; {A} 1      {B} 2          
;;
;; encoding the most frequent symbol requires 1 bit whereas
;; the least frequent symbol requires n - 1 bits
