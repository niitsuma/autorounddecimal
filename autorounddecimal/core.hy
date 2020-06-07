
(import [decimal [*]])


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
        (do
          (+= n_0 1)        
          (if (>= n_0 min_count)
              (break)
            ))
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

;;(decimal_remove_zero_padding (Decimal "0.01230000234"))



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
      d2  (decimal_remove_zero_padding d1 min_count)
      d0  (decimal_remove_nine_padding d2 min_count)
      )
    ;;(print d d1 d2 d0)
    )
  d1)



(defn adround [value &optional [min_count 4]]
  (float (decimal_round_digit (Decimal value) min_count)))


