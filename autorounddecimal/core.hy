
(import [decimal [*]])

;; (defn float2remove_zero_padding [value &optional [min_zero_count 4]]
;;   (setv 
;;     d (Decimal value)
;;     ;;d (d1.normalize)
;;     s1 (d.to_eng_string)
;;     es (s1.split "E")
;;     s2 (get es 0)
;;     s (get (s2.split (* "0" min_zero_count)) 0)
;;     )
;;   ;;(print d1 d)
;;   (print d s1 s2 s)
;;   (print  es)
;;   (if (= (len es) 1)
;;       (Decimal s)
;;       (Decimal (+ s "E" (get es -1)))
;;       )
;;   )

;;;;; do in tuple slow but safe
(defn decimal_remove_zero_padding [d &optional [min_count 4]]
  (setv 
    t  (d.as_tuple)
    gs t.digits
    g []
    n_0 0
    )
  ;;(print t)
  (for [c gs]
    ;;(print c n_0 g)
    (if (= c 0)
        (if (>= n_0 (- min_count 1))
            (break)
            (+= n_0 1))
        (do 
          (+= g (* [0] n_0 ))
          (setv n_0 0)
          (g.append c))
        ))
  (Decimal (DecimalTuple
             t.sign
             (tuple g)
             (+ t.exponent (- (len gs) (len g) ))
             )))




;; (import math)
;; (math.log10 2312300000234.123)

(defn decimal_remove_nine_padding [d &optional [min_count 4]]
  (setv
    t (d.as_tuple)
    gs t.digits
    g []
    n_9 0
    carry_flag False
    )
  ;;(print t)
  (for [c gs]
    ;;(print c n_9 g)
    (if (= c 9)
        (do
          (+= n_9 1)
          (if (>= n_9 min_count)
              (do
                (setv carry_flag True)
                (break)
                )))
        (do
          (+= g (* [9] n_9 ))
          (setv n_9 0)
          (g.append c))
        ))
  ;;(print g carry_flag)
  (if carry_flag
      (+= (get g -1) 1)
      (+= g (* [9] n_9 ))
      )
  ;;(print g)
  (Decimal (DecimalTuple
             t.sign
             (tuple g)
             (+ t.exponent (- (len gs) (len g) ))
             )))
  


(defn decimal_round_digit [d &optional [min_count 4]]
  (setv d0 None)
  (while (!= d d0)
    (lif d0 (setv d d0))
    (setv
      d1  (d.normalize)
      d2  (decimal_remove_zero_padding d1)
      d0  (decimal_remove_nine_padding d2)
      )
    ;;(print d d1 d2 d0)
    )
  d1)



(defn adround [value &optional [min_count 4]]
  (float (decimal_round_digit (Decimal value) min_count)))


;; (adround 0.000320009999)

;; (setv d (float2remove_zero_padding 0.000320009999))
;; (setv d (float2remove_zero_padding 0.000000020039999))
;; (setv t (d.as_tuple))
;; (setv g (t.digits))
;; (setv g_delta (+ (* (- (len g) 1) [0]) [1]))
;; (setv d_delta (Decimal (DecimalTuple t.sign (tuple g_delta)  t.exponent)))
  
;;   (setv d2 (.normalize (+ d d_delta)))  ;; (print es (len es))
  ;; (print s1)
  ;; (print s2)
  ;; (print s)

;;   d2
;;   (len (. (d2.as_tuple) digits))
  
;; (.normalize (- d d_delta))


;; ;;(float d2)

;; g

;; g

;; t



;; (d.next_minus)
;; (d.next_plus)

;; next_minus(context=None)

;; next_plus(context=None)¶
;; d

      
;; (Decimal 0.000000020039999)
;;   (print s)

;;   nomalized_decimal .000320009999)  (print s)

;;   (print s)

;; ;; (Decimal.from_float 0.1)

;; ;; (setv d (Decimal 12.3999))12.00039999
;; ;; (setv d (Decimal 12.3999))
;; ;; (setv d (Decimal 12.00039999))

;; ;; (setv d (Decimal "12.00039999"))

;; (setv s (.to_eng_string (Decimal "0.000000020039999")))
;; (setv s (.to_eng_string (Decimal "0.020039999")))

;; (get (s.split "E") -1)


;; d
;; (dir d)
;; (.normalize (d.normalize))

;; d
;; (dir d)
;; (.normalize (d.normalize))

;; (d.remainder_near)(setv d (Decimal 12.3999))


;; (d.quantize)

;; (setv t  (d.as_tuple))
;; (setv s (d.to_eng_string))
;; (setv min_zero_count 4)
;; (* "0" min_zero_count)

;; (s.split "0000")


;; from collections import namedtuple
;; (require [hy.extra.anaphoric [*]])

;; (setv g []
;;       n_zero 0
;;       min_zero_count 4
;;       )

;; ;; (+ [1 2] (* [0] 4))


