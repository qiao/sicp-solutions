;; For generic operations with explicit dispath:
;; When adding new types:
;;     we need to add a new branch in each operation on the generic data
;; When adding new operations:
;;     we need to create a new procedure containing the dispatch
;;     for all the types.

;; For data-directed style:
;; When adding new types:
;;     we need to add the correponding operations on this style into
;;     the registry table
;; When adding new operations:
;;     we need to add the operation to each type package and register
;;     them in the table

;; For message-passing style:
;; When adding new types:
;;     we simply implement this new type, and no extra effort is needed
;; When adding new operations:
;;     we need to add the operation into the implementation of 
;;     each type

;; data-directed style and message-passing style is best suited for 
;; systems with frequent addition of new types

;; explicit-dispatch and data-directed style is suited for systems
;; with frequent addtion of new operations
