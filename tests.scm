;;; Test cases for Scheme.
;;;
;;; In order to run only a prefix of these examples, add the line
;;;
;;; (exit)
;;;
;;; after the last test you wish to run.

;;; *** Add more of your own here! ***

;;; These are examples from several sections of "The Structure
;;; and Interpretation of Computer Programs" by Abelson and Sussman.

;;; License: Creative Commons share alike with attribution


;;; Problem 3: apply_primitive
;;; Problem 4: lookup for Frame
;;;

(boolean? #f)
; expect True

(boolean? #t)
; expect True

(boolean? 8)
; expect False

(boolean? 'a)
; expect False

(not #t)
; expect False

(not #f)
; expect True

(eq? 12 34)
; expect False

(eq? 'a 'b)
; expect False

(equal? 56 56)
; expect True

(equal? 'a 'a)
; expect True

(pair? '(1 2))
; expect True

(pair? '(1 . 2))
; expect True

(pair? 25)
; expect False

(pair? 'x)
; expect False

(pair? #t)
; expect False

(list? '(1 2))
; expect True

(list? '(1 . 2))
; expect False

(list? (cons 1 (cons 2 ())))
; expect True

(list? (cons 1 (cons 2 3)))
; expect False

(null? ())
; expect True

(null? '())
; expect True

(null? nil)
; expect True

(null? 45)
; expect False

(null? 'y)
; expect False

(null? #f)
; expect False

(null? "abc")
; expect False

(length ())
; expect 0

(length nil)
; expect 0

(length '())
; expect 0

(length '(1 2 3))
; expect 3

(length '(1 . 2))
; expect Error

(length 'z)
; expect Error

(length 59)
; expect Error

(cons 'a (cons 'b (cons 'c nil)))
; expect (a b c)

(cons 'x 'y)
; expect (x . y)

(cons 'x 'y 'z)
; expect Error

(cons 'x (cons 'y 'z))
; expect (x y . z)

(car '(99 100 101))
; expect 99

(cdr '(99 100))
; expect (100)

(list 11 22 33)
; expect (11 22 33)

(list 11 'a 22 'x)
; expect (11 a 22 x)

(list '(1 2 3 4))
; expect ((1 2 3 4))

(car (list '(1 2 3 4)))
; expect (1 2 3 4)

(cdr (list '(1 2 3 4)))
; expect ()

(append '(1 2) '(3 4))
; expect (1 2 3 4)

(append () '(a b))
; expect (a b)

(string? 'a)
; expect False

(string? "a")
; expect True

(string? 78)
; expect False

(string? #t)
; expect False

(symbol? 19)
; expect False

(symbol? "x")
; expect False

(symbol? #f)
; expect False

(symbol? 'q)
; expect True

(symbol? '12)
; expect False

(symbol? '(1 2))
; expect False

(number? 99)
; expect True

(number? 99.9)
; expect True

(number? 'xyz)
; expect False

(number? "abc")
; expect False

(integer? 99)
; expect True

(integer? 99.9)
; expect False

(integer? "xyz")
; expect False

(integer? 'a)
; expect False

(quotient 12 4)
; expect 3

(quotient 12 3)
; expect 4

(quotient 12 0)
; expect Error

(remainder 10 3)
; expect 1

(remainder 10 2)
; expect 0

(remainder 10 0)
; expect Error

(modulo 10 3)
; expect 1

(modulo 10 2)
; expect 0

(modulo 10 0)
; expect Error

(floor 12.3)
; expect 12

(floor 12.8)
; expect 12

(floor 12.999)
; expect 12

(floor 12.0)
; expect 12

(ceil 12.001)
; expect 13

(ceil 12.5)
; expect 13

(ceil 12.999)
; expect 13

;;;
;;; Problem A5:
;;;

(define x #f)
; expect x

(boolean? x)
; expect True

(define a 12)
; expect a

(define b 20)
; expect b

(+ a b)
; expect 32

;;;
;;; Problem B6:
;;;

(car '(x y x))
; expect x

(cdr '(x y z))
; expect (y z)

(car (cdr '(x y z)))
; expect y

(car (cdr (cdr '(x y z))))
; expect z

;;;
;;; Problem 7:
;;;

(begin (define x 10) (define y 20) (+ x y))
; expect 30

(begin (define x 10) (define y 20) (+ x y) '(* x y))
; expect (* x y)

;;;
;;; Problem 8:
;;;

((lambda () (+ 11 33)))
; expect 44

((lambda (x y z) (+ x (* y z))) 2 4 6)
; expect 26

;;;
;;; Problem A9:
;;;

(define (cube x) (* x x x))
; expect cube

cube
; expect (lambda (x) (* x x x))

;;;
;;; Problem 10:
;;;

((lambda (x y z) (* x y z)) 3 4 5)
; expect 60

((lambda (x y z) (* x y z)) 3 4) ;Error: formal parameters and values are out of sync: formals:(x y z) values:(3 4)
; expect Error

;;;
;;; Problem B11:
;;;

(lambda (x 0 z) (* x y z)) ;Error: Invalid symbol 0
; expect Error

(lambda (x 'y z) (* x y z)) ;Error: Invalid symbol (quote y)
; expect Error

(lambda (x "y" z) (* x y z)) ;Error: Invalid symbol "y"
; expect Error

;;;
;;; Problem 12:
;;;

(define (cube x) (* x x x))
; expect cube

(define (sum-of-cubes a b)
       (+ (cube a) (cube b)))
; expect sum-of-cubes

(sum-of-cubes 2 3)
; expect 35

;;;
;;; Problem A13:
;;;

(if (< 10 20) (/ 10 5) (/ 10 0))
; expect 2

(if (> 2 10) (/ 1 /))
; expect okay

;;;
;;; Problem B14:
;;;

(and (* 4 5) (< 5 1) (/ 1 0))
; expect False

(or (> 2 1) (/ 1 0))
; expect True

;;;
;;; Problem A15:
;;;

(cond ((< 4 3) (/ 2 0))
      ((> 4 1) (/ 10 2))
      (else (/ 3 0)))
; expect 5

;;;
;;; Problem A16:
;;;

(define x 10)
; expect x

(define y 0)
; expect y

(let ((x 10)
           (y 20))
          (/ x y))
; expect 0.5

(/ x y) ;Error: division by zero
; expect Error

;;;
;;; Problem B17:
;;;

(define fx (mu (x) (* x y)))
; expect fx

(define gx (lambda (x y) (fx (+ x x))))
; expect gx

(gx 1 2)
; expect 4

;;;
;;; Problem 22:
;;;

(define (factorial n)
    (define (facto n product)
        (if (= n 0)
            product
            (facto (- n 1) (* n product))))
    (facto n 1))
; expect factorial

(factorial 10)
; expect 3628800

(factorial 400)
; expect 64034522846623895262347970319503005850702583026002959458684445942802397169186831436278478647463264676294350575035856810848298162883517435228961988646802997937341654150838162426461942352307046244325015114448670890662773914918117331955996440709549671345290477020322434911210797593280795101545372667251627877890009349763765710326350331533965349868386831339352024373788157786791506311858702618270169819740062983025308591298346162272304558339520759611505302236086810433297255194852674432232438669948422404232599805551610635942376961399231917134063858996537970147827206606320217379472010321356624613809077942304597360699567595836096158715129913822286578579549361617654480453222007825818400848436415591229454275384803558374518022675900061399560145595206127211192918105032491008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000



;;; 1.1.1

10
; expect 10

(+ 137 349)
; expect 486

(- 1000 334)
; expect 666

(* 5 99)
; expect 495

(/ 10 5)
; expect 2

(+ 2.7 10)
; expect 12.7

(+ 21 35 12 7)
; expect 75

(* 25 4 12)
; expect 1200

(+ (* 3 5) (- 10 6))
; expect 19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
; expect 57

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))
; expect 57


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Move the following (exit) line to run additional tests. ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;(exit)


;;; 1.1.2

(define size 2)
; expect size
size
; expect 2

(* 5 size)
; expect 10

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
; expect 314.159

(define circumference (* 2 pi radius))
circumference
; expect 62.8318

;;; 1.1.4

(define (square x) (* x x))
; expect square
(square 21)
; expect 441

(define square (lambda (x) (* x x))) ; See Section 1.3.2
(square 21)
; expect 441

(square (+ 2 5))
; expect 49

(square (square 3))
; expect 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)
; expect 25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)
; expect 136

;;; 1.1.6

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -3)
; expect 3

(abs 0)
; expect 0

(abs 3)
; expect 3

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 -2)
; expect 5

;;; 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.1.8

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.3.1

(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)
; expect 3025

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(sum-integers 1 10)
; expect 55

;;; 1.3.2

((lambda (x y z) (+ x y (square z))) 1 2 3)
; expect 12

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(f 3 4)
; expect 456

(define x 5)
(+ (let ((x 3))
     (+ x (* x 10)))
   x)
; expect 38

(let ((x 3)
      (y (+ x 2)))
  (* x y))
; expect 21

;;; 2.1.1

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define x (cons 1 2))
(car x)
; expect 1

(cdr x)
; expect 2

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
(car (car z))
; expect 1

(car (cdr z))
; expect 3

z
; expect ((1 . 2) 3 . 4)

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display '/)
  (display (denom x))
  (newline))
(define one-half (make-rat 1 2))
(print-rat one-half)
; expect 1/2 ; okay

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
; expect 5/6 ; okay

(print-rat (mul-rat one-half one-third))
; expect 1/6 ; okay

(print-rat (add-rat one-third one-third))
; expect 6/9 ; okay

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(print-rat (add-rat one-third one-third))
; expect 2/3 ; okay

(define one-through-four (list 1 2 3 4))
one-through-four
; expect (1 2 3 4)

(car one-through-four)
; expect 1

(cdr one-through-four)
; expect (2 3 4)

(car (cdr one-through-four))
; expect 2

(cons 10 one-through-four)
; expect (10 1 2 3 4)

(cons 5 one-through-four)
; expect (5 1 2 3 4)

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(map abs (list -10 2.5 -11.6 17))
; expect (10 2.5 11.6 17)

(map (lambda (x) (* x x))
     (list 1 2 3 4))
; expect (1 4 9 16)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
(scale-list (list 1 2 3 4 5) 10)
; expect (10 20 30 40 50)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
; expect 4

(count-leaves (list x x))
; expect 8

;;; 2.2.3

(define (odd? x) (= 1 (remainder x 2)))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5))
; expect (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(accumulate + 0 (list 1 2 3 4 5))
; expect 15

(accumulate * 1 (list 1 2 3 4 5))
; expect 120

(accumulate cons nil (list 1 2 3 4 5))
; expect (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)
; expect (2 3 4 5 6 7)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))
; expect (1 2 3 4 5)

;;; 2.3.1

(define a 1)

(define b 2)

(list a b)
; expect (1 2)

(list 'a 'b)
; expect (a b)

(list 'a b)
; expect (a 2)

(car '(a b c))
; expect a

(cdr '(a b c))
; expect (b c)

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
(memq 'apple '(pear banana prune))
; expect False

(memq 'apple '(x (apple sauce) y apple pear))
; expect (apple pear)

(define (equal? x y)
  (cond ((pair? x) (and (pair? y)
                        (equal? (car x) (car y))
                        (equal? (cdr x) (cdr y))))
        ((null? x) (null? y))
        (else (eq? x y))))
(equal? '(1 2 (three)) '(1 2 (three)))
; expect True

(equal? '(1 2 (three)) '(1 2 three))
; expect False

(equal? '(1 2 three) '(1 2 (three)))
; expect False

;;; Peter Norvig tests (http://norvig.com/lispy2.html)

(define double (lambda (x) (* 2 x)))
(double 5)
; expect 10

(define compose (lambda (f g) (lambda (x) (f (g x)))))
((compose list double) 5)
; expect (10)

(define apply-twice (lambda (f) (compose f f)))
((apply-twice double) 5)
; expect 20

((apply-twice (apply-twice double)) 5)
; expect 80

(define fact (lambda (n) (if (<= n 1) 1 (* n (fact (- n 1))))))
(fact 3)
; expect 6

(fact 50)
; expect 30414093201713378043612608166064768844377641568960512000000000000

(define (combine f)
  (lambda (x y)
    (if (null? x) nil
      (f (list (car x) (car y))
         ((combine f) (cdr x) (cdr y))))))
(define zip (combine cons))
(zip (list 1 2 3 4) (list 5 6 7 8))
; expect ((1 5) (2 6) (3 7) (4 8))

(define riff-shuffle (lambda (deck) (begin
    (define take (lambda (n seq) (if (<= n 0) (quote ()) (cons (car seq) (take (- n 1) (cdr seq))))))
    (define drop (lambda (n seq) (if (<= n 0) seq (drop (- n 1) (cdr seq)))))
    (define mid (lambda (seq) (/ (length seq) 2)))
    ((combine append) (take (mid deck) deck) (drop (mid deck) deck)))))
(riff-shuffle (list 1 2 3 4 5 6 7 8))
; expect (1 5 2 6 3 7 4 8)

((apply-twice riff-shuffle) (list 1 2 3 4 5 6 7 8))
; expect (1 3 5 7 2 4 6 8)

(riff-shuffle (riff-shuffle (riff-shuffle (list 1 2 3 4 5 6 7 8))))
; expect (1 2 3 4 5 6 7 8)

;;; Additional tests

(apply square '(2))
; expect 4

(apply + '(1 2 3 4))
; expect 10

(apply (if false + append) '((1 2) (3 4)))
; expect (1 2 3 4)

(if 0 1 2)
; expect 1

(if '() 1 2)
; expect 1

(or false true)
; expect True

(or)
; expect False

(and)
; expect True

(or 1 2 3)
; expect 1

(and 1 2 3)
; expect 3

(and False (/ 1 0))
; expect False

(and True (/ 1 0))
; expect Error

(or 3 (/ 1 0))
; expect 3

(or False (/ 1 0))
; expect Error

(or (quote hello) (quote world))
; expect hello

(if nil 1 2)
; expect 1

(if 0 1 2)
; expect 1

(if (or false False #f) 1 2)
; expect 2

(define (loop) (loop))
(cond (false (loop))
      (12))
; expect 12

((lambda (x) (display x) (newline) x) 2)
; expect 2 ; 2

(define g (mu () x))
(define (high f x)
  (f))

(high g 2)
; expect 2

(define (print-and-square x)
  (print x)
  (square x))
(print-and-square 12)
; expect 12 ; 144

(/ 1 0)
; expect Error

(define addx (mu (x) (+ x y)))
(define add2xy (lambda (x y) (addx (+ x x))))
(add2xy 3 7)
; expect 13


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scheme Implementations ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; len outputs the length of list s
(define (len s)
  (if (eq? s '())
    0
    (+ 1 (len (cdr s)))))
(len '(1 2 3 4))
; expect 4


;;;;;;;;;;;;;;;;;;;;
;;; Extra credit ;;;
;;;;;;;;;;;;;;;;;;;;



; Tail call optimization test
(define (sum n total)
  (if (zero? n) total
    (sum (- n 1) (+ n total))))
(sum 1001 0)
; expect 501501
