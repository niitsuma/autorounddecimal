
(import [nose.tools [eq_  assert-equal assert-not-equal]])

(defn assert-all-equal [&rest tests]
  (reduce (fn [x y] (assert-equal x y) y)
          tests)
  None)

(import [decimal [*]])
(import  [autorounddecimal.core [*]])

(defn hy_test1 []

  (assert-all-equal
    (decimal_remove_zero_padding (Decimal 23.12300000234))
    (decimal_round_digit         (Decimal 23.12300000234))
    (decimal_remove_zero_padding (Decimal "23.1230000"))
    (decimal_round_digit         (Decimal "23.1230000"))
    (Decimal "23.123")   )
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal 2312300000234.123))
    (decimal_round_digit         (Decimal 2312300000234.123))
    (Decimal "2.3123E+12"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal 0.012300000234))
    (decimal_round_digit         (Decimal 0.012300000234))
    (Decimal "0.0123"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal "0.0123000234"))
    (decimal_round_digit         (Decimal "0.0123000234"))
    (Decimal "0.0123000234"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal "0.01230000234"))
    (decimal_round_digit         (Decimal "0.01230000234"))
    (decimal_remove_zero_padding (Decimal "0.012300000234"))
    (decimal_round_digit         (Decimal "0.012300000234"))
    (Decimal "0.0123"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal "0.0123000234"))
    (decimal_round_digit         (Decimal "0.0123000234"))
    (Decimal "0.0123000234"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal 0.01230000234))
    (decimal_round_digit         (Decimal 0.01230000234))
    (decimal_remove_zero_padding (Decimal "0.012300000234"))
    (decimal_round_digit         (Decimal "0.012300000234"))
    (Decimal "0.0123"))

  (assert-all-equal
    (decimal_remove_nine_padding (Decimal "32.999"))
    (decimal_round_digit         (Decimal "32.999"))
    (Decimal "32.999"))
  (assert-all-equal
    (decimal_remove_nine_padding (Decimal "32.99912"))
    (decimal_round_digit         (Decimal "32.99912"))
    (Decimal "32.99912"))
  (assert-all-equal
    (decimal_remove_nine_padding (Decimal "32.9999"))
    (decimal_round_digit         (Decimal "32.9999"))
    (decimal_remove_nine_padding (Decimal "32.999912"))
    (decimal_round_digit         (Decimal "32.999912"))    
    (Decimal "33"))
  (assert-all-equal
    (decimal_remove_nine_padding (Decimal 23.123999999234))
    (decimal_round_digit         (Decimal 23.123999999234))
    (Decimal "23.124"))
  (assert-all-equal
    (decimal_remove_nine_padding (Decimal 2312399999234.123))
    (decimal_round_digit         (Decimal 2312399999234.123))
    (Decimal "2.3124E+12"))
  (assert-all-equal
    (decimal_remove_nine_padding (Decimal 0.012399999234))
    (decimal_round_digit         (Decimal 0.012399999234))
    (Decimal "0.0124"))

  (eq_
    (decimal_round_digit (Decimal 0.003200009999))
    (Decimal "0.0032"))
  (eq_
    (decimal_round_digit (Decimal 0.00320009999))
    (Decimal "0.0032001"))
  
  (eq_
    (decimal_round_digit (Decimal 0.00320009999))
    (Decimal "0.0032001"))
  (eq_
    (decimal_round_digit (Decimal 0.0032009999))
    (Decimal "0.003201"))


  (assert-all-equal
    (adround 0.000320009999)
    (adround 0.00032001)
    0.00032001)
  (assert-all-equal
    (adround 0.0003200001)
    (adround 0.000319999)
    0.00032)
  
  (eq_
    (adround -0.000320009999)
    -0.00032001)
  (eq_
    (adround -0.00032012)
    -0.00032012)
  
  (assert-all-equal
    (adround 0.0003200009999)
    (adround 0.000320000123)
    (adround 0.000320000)
    0.00032)

  (assert-all-equal
    (adround -0.0003200009999)
    (adround -0.000320000123)
    (adround -0.000320000)
    -0.00032)
  
  (assert-all-equal
    (adround 0.000329999123)
    (adround 0.000329999)
    (adround 0.0003299999)
    0.00033)
  (assert-all-equal
    (adround -0.000329999123)
    (adround -0.000329999)
    (adround -0.0003299999)
    -0.00033)
  (eq_
    (adround 3.2001)
    3.2001)
  (assert-all-equal
    (adround 3.200001)
    (adround 3.19999)
    3.2)
)

(defn hy_test2 []
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal "0.01230000234") :min_count 4)
    (decimal_round_digit         (Decimal "0.01230000234") :min_count 4)
    (Decimal "0.0123"))
  (assert-all-equal
    (decimal_remove_zero_padding (Decimal "0.01230000234") :min_count 5)
    (decimal_round_digit         (Decimal "0.01230000234") :min_count 5)
    (Decimal "0.01230000234"))

  (assert-all-equal
    (adround 3.20000123)
    (adround 3.20000123 :min_count 4)
    3.2)
  (eq_
    (adround 3.20000123 :min_count 5)
    3.20000123)
  (eq_
    (adround 3.200000123 :min_count 5)
    3.2)
  (eq_
    (adround 3.200000123 :min_count 6)
    3.200000123)
  )
  
