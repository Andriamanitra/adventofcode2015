#lang racket

(define input
    (with-input-from-file "input.txt"
        (lambda () (read-line))))

; Part 1
(displayln
    (for/sum ([ch input])
        (match ch
            [#\( 1]
            [#\) -1])))

; Part 2
(define current-floor 0)
(displayln
    (for/sum ([ch input] #:break (= -1 current-floor))
        (set! current-floor
            (match ch
                [#\( (add1 current-floor)]
                [#\) (sub1 current-floor)]))
        1))
