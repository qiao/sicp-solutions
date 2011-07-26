(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((record (entry set-of-records)))
        (let ((k (key record)))
          (cond ((= given-key k) (record))
                ((< given-key k)
                 (lookup given-key (left-branch set-of-records)))
                (else
                 (lookup given-key (right-branch set-of-records))))))))
