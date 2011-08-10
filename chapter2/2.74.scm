;; a.

(define (make-generic-employee-file division employee-file)
  (cons division employee-file))
(define (division generic-employee-file)
  (car generic-employee-file))
(define (employee-file generic-employee-file)
  (cdr generic-employee-file))

(define (get-record employee-name generic-employee-file)
  ((get 'get-record (division generic-employee-file))
     employee-name
     (employee-file generic-employee-file)))

;; b.

(define (get-salary generic-employee-record)
  ((get 'get-salary (division generic-employee-record))
     (employee-record generic-employee-record)))

;; c.

(define (find-employee-record employee-name generic-files)
  (if (null? generic-files)
      (error "Record not found")
      (let ((record (get-record employee-name (car generic-files))))
        (if (record)
            record
            (find-employee-record employee-name (cdr generic-files))))))

;; d.
;; Each new division needs to install their own getters into the
;; table. 
