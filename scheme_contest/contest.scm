;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Dreamy Hailstones>
;;;
;;; Description:
;;;   <Mysterious math
When will the number descend?
Here comes the Hailstone.>

(speed 10)

(define sc-width (screen_width))
(define sc-height (screen_height))

(define bottom-right-x (/ sc-width 2))
(define bottom-right-y (* -1 (/ sc-height 2)))

(define bottom-left-x (* -1 (/ sc-width 2)))
(define bottom-left-y (* -1 (/ sc-height 2)))



(bgcolor "#76B3F2")

(define lst-stones (list 53 51 51 50 52 50 30))
(define lst-steps (list 220 18 18 200 200 25 20))
(define lst-colors (list "#5687CA" "#F8F9FA" "#71B7D9" "#0A6C9B" "#005389" "#033566" "#02143B"))
(define step (* -1 ( / (screen_width) 2)))

(define mountain-height 10)

(define (higher-order fn lst-steps-x lst-stones-n lst-colors)
          (begin_fill)
          (if (null? lst-steps-x)
                nil
                (begin
                      (fn step (car lst-steps-x) (car lst-stones-n) (car lst-colors))
                      (set! mountain-height (+ mountain-height 60))
                      (higher-order fn (cdr lst-steps-x) (cdr lst-stones-n) (cdr lst-colors))
                )
            )
)

(define (draw)

  (define (hailstone step add-step n colore)
        (print n)

        (setposition step (- n mountain-height))
        (pendown)
        (color colore)

        (cond
              ((= n 1) (begin
                          (setposition bottom-right-x bottom-right-y)
                          (setposition bottom-left-x bottom-left-y)
                          (setposition (* -1 ( / (screen_width) 2)) 50)
                          (end_fill)
                           1))
              ((= (modulo n 2) 0) (+ 1 (hailstone (+ add-step step) add-step (quotient n 2) colore)))
              (else (+ 1 (hailstone (+ add-step step) add-step (+ 1 (* 3 n)) colore)))
        )

      )

    (penup)

    (higher-order hailstone lst-steps lst-stones lst-colors)

    (penup)
    (setposition -320 70)
    (color "white")
    (write 'HOG)
    (color "white")
    (setposition -200 90)
    (color "white")
    (write 'MAPS )
    (setposition -50 50)
    (color "white")
    (write 'ANTS)
    (setposition 100 30)
    (color "white")
    (write 'SCHEME)

    (setposition 200 -220)
    (color "white")
    (write 'FINAL)
    (penup)

  (exitonclick))


; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
