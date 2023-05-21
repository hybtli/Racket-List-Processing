#lang racket

(require "lambda-utils.rkt")
(require "index-utils.rkt")


; Part 1

; Define a pair consisting of the number 7 and the string "Ersin"
(define Pair (cons 7 "Ersin"))

; Define a list with various elements including strings, numbers, and symbols
(define List '("Didem" "Burak" "Adil" "Eren" "Nuri" "Güliz" 1923 "Serhat" "Büşra" "Ege" "Cansu" "Altuğ" "Dilek" "Samet" "Hüseyin" 1992 3))

; Find the index of the string "Didem" in the List
(define index (index-of "Didem" List))

; Insert the Pair at the position next to the found index in the List
(set! List (insert-at (+ index 1) List Pair))

; Define a Leaf variable as null
(define Leaf null)

; Define two lambda functions: lambda1 squares its input and lambda2 displays a message
(define lambda1 (lambda (x) (* x x)))
(define lambda2 (lambda () (display "I am a simple lambda function that only prints to the screen")))


; Part 2

; Define a procedure called myproc that takes an item, a predicate function, and a function as arguments
(define (myproc item predicate function)
  (cond
    ; If the item is null or has already been visited, return an empty list
    [(or (null? item) (member item visited?)) '()]
    ; If the item is a pair, recursively call myproc on the car and cdr of the pair
    [(pair? item)
     (begin
       (myproc (car item) predicate function)
       (myproc (cdr item) predicate function))]
    ; If the item is a list, apply myproc recursively to each element of the list
    [(list? item)
     (for-each (lambda (x) (myproc x predicate function)) item)]
    ; If the item is a string or a number, apply the predicate function and if true, apply the function on the item
    [(or (string? item) (number? item))
     (if (predicate item) (function item) '())]
    ; If the item is a lambda function, apply myproc on the result of applying the function on the item
    [(lambda? item)
     (myproc (function item) predicate function)]
    ; For any other cases, return an empty list
    [else '()]))


; Part 3

; Define an empty list called visited?
(define visited? '())

; Define a procedure called print-item that prints different types of items
(define (print-item item)
  (cond
    ; If the item is a string, display it followed by a new line
    [(string? item) (displayln item)]
    ; If the item is a number, display it followed by a new line
    [(number? item) (displayln item)]
    ; If the item is a lambda function, display it followed by a new line
    [(lambda? item) (displayln item)]
    ; For any other cases, do nothing
    [else (void)]))


; Apply myproc on the List using a predicate function that matches strings, numbers, and lambda functions, and print each item
(myproc List
         (lambda (x) (or (string? x) (number? x) (lambda? x)))
         print-item)
(newline)


; Define a procedure called is-prime? that checks if a number is prime
(define (is-prime? n)
  ; Define a helper function called iter that checks divisibility of n by numbers starting from 2
  (define (iter divisor)
    (cond [(< n 2) #f] ; If n is less than 2, it is not prime
          [(= divisor n) #t] ; If divisor reaches n, n is prime
          [(zero? (modulo n divisor)) #f] ; If n is divisible by divisor, it is not prime
          [else (iter (+ divisor 1))])) ; Otherwise, recursively call iter with the next divisor
  (iter 2))

; Apply myproc on the List using a predicate function that matches numbers and checks if they are prime, and print each item
(myproc List
         (lambda (x) (and (number? x) (is-prime? x)))
         print-item)
(newline)


; Apply myproc on the List using a predicate function that matches strings and checks if their length is greater than 5, and print each item
(myproc List
         (lambda (x) (and (string? x) (> (string-length x) 5)))
         print-item)
(newline)


; Apply the lambda1 function to the number 17 and display the result
(let ((result (apply-lambda-with-number 17)))
  (if (and (procedure? result)
           (= (procedure-arity result) 0))
      (result)
      (print-result result)))

; Apply the lambda2 function, which only prints a message to the screen
(define (apply-lambda-no-params)
  (lambda2))

(let ((result (apply-lambda-no-params)))
  (if (and (procedure? result)
           (= (procedure-arity result) 0))
      (result)
      (print-result result)))


