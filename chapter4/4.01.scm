(define (list-of-values-LR exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
        (cons left
              (list-of-values-LR (rest-operands exps) env)))))


(define (list-of-values-RL exps env)
  (if (no-operands? exps)
      '()
      (let ((right (list-of-values-RL (rest-operands exps) env)))
        (cons (eval (first-operand exps) env)
              right))))
