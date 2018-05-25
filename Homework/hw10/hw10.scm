(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner(accumulate combiner start(- n 1) term) (term n)))
)

(define (accumulate-tail combiner start n term)
  (define (acc current total)
  	(if (= current 0)
  		total
  		(acc (- current 1) (combiner total (term current)))))
  (acc n start)
)

(define-macro (list-of expr for var in seq if filter-fn)
  (list 'map (list 'lambda (list var) expr) (list 'filter (list 'lambda (list var) filter-fn) seq))
)