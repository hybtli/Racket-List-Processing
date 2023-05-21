# Racket-List-Processing
In this programming assignment, you are supposed to write a Scheme(Racket) program. The
assignment is composed of 3 parts. You have to correctly implement a Part before moving on to
the next.

![image](https://github.com/hybtli/Racket-List-Processing/assets/102618972/eaf1233f-971c-467e-b1a6-7e652c1d70df)

### Part 1

Represent the whole relationship in the figure within the code. Each arrow indicates a **“has”**
relationship, for example, the topmost Pair has “Ersin” and 7. The types of boxes are explained
in the legend. Note that the type Pair is distinct from the type List, and is defined by using **cons**
function. Here are the lambda functions’ definitions:
Represent the whole relationship in the figure within the code. Each arrow indicates a “has”
relationship, for example, the topmost Pair has “Ersin” and 7. The types of boxes are explained
in the legend. Note that the type Pair is distinct from the type List, and is defined by using cons
function. Here are the lambda functions’ definitions:

      ● λ1(lambda1): takes a Number and returns its’ square
      ● λ2(lambda2): prints the String "I am a simple lambda function which only prints to screen:)"
      
### Part 2
Write a procedure that explores the items recursively by following the links. The definition of the
procedure must be

      (define (myproc v1 v2 v3) …)
      Where
        ● v1 is an item
        ● v2 is used as a predicate
        ● v3 is used as a function to apply on v1

You must replace … with a function body that performs the following actions
If the item is encountered before, then do nothing; otherwise, if the item is

    ● a Pair, then the procedure must first move on to the right item and then the left.
    ● a List, then the procedure must move on to all items in reverse order, i.e. from right to
    left.
    ● a Leaf node
      ○ and null, then the procedure does nothing.
      ○ and either a String or a Number, then the procedure must check whether the
      given predicate(v2) is evaluated true(#t) when applied to the item. If it is true then
      the procedure must apply the given function(v3) on the item; if it is false(#f), it
      does nothing.
      ○ and a Lambda function, then the procedure must apply this lambda function by
      using it in the given function(v3) as the argument.

### Part 3
After you implement the procedure in Part 2, you are supposed to implement each bullet point
below in the Scheme code. Each must be done by calling myproc with appropriate parameters.

  ●   Write a statement that prints the elements of types of String, Number, and Lambda
  functions. Output must be:

```Bash
"Didem"
7
"Ersin"
"Burak"
"Adil"
"Eren"
"Nuri"
"Güliz"
1923
"Serhat"
"Büşra"
"Ege"
"Cansu"
"Altuğ"
"Dilek"
"Samet"
"Hüseyin"
1992
3
```
●   Write a statement that prints all prime numbers. Output must be:
```Bash
7
3
```
●   Write a statement that prints the elements of type String whose sizes are greater than 5.
Output must be:
```Bash
"Serhat"
"Hüseyin"
```
●   Write a statement that calls Lambda functions which takes one parameter with Number
17 and prints the result.
