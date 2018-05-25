(define (find s predicate)
  (cond ((null? s) #f)
  		((predicate (car s)) (car s))
  		(else (find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (if (null? s) nil 
  	(cons-stream (* (car s) k) 
  		(scale-stream (cdr-stream s) k)))
)

(define (has-cycle s)
  (define (lst-contains x lst)
  	(if (null? lst) #f
  		(if (eq? (car lst) x) #t
  			(lst-contains x (cdr lst))))
  	)
  
  (define (helper x lst)
  	(if (null? x) #f
  		(if (lst-contains x lst) #t
  			(helper (cdr-stream x) (cons x lst))))
  	)
  (helper (cdr-stream s) (list s))
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
