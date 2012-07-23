;; if (try try) returns 'halted, it means that the internal condition
;; (halted? try try) returns false, which contradicts with the result.
;; 
;; if (try try) runs forever, it means that the internal condition
;; (halted? try try) returns true, which also contradicts with the result.
