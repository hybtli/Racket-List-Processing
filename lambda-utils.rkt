#lang racket

(provide lambda?)

(define (lambda? x)
  (and (procedure? x)
       (not (eq? x #f))
       (not (eq? x #t))
       (not (eq? x '()))))