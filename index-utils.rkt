#lang racket


(provide insert-at)

(define (insert-at index lst element)
  (if (<= index 0)
      (cons element lst)
      (cons (car lst)
            (insert-at (- index 1) (cdr lst) element))))


(provide index-of)

(define (index-of item lst)
  (define (index-of-helper item lst index)
    (cond
     [(empty? lst) -1]
     [(equal? item (car lst)) index]
     [else (index-of-helper item (cdr lst) (+ index 1))]))
  (index-of-helper item lst 0))