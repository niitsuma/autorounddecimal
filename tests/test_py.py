from hy.core.language import reduce
from nose.tools import eq_, assert_equal, assert_not_equal


def assert_all_equal(*tests):
    def _hy_anon_var_1(x, y):
        assert_equal(x, y)
        return y
    reduce(_hy_anon_var_1, tests)
    return None


from decimal import *
from autorounddecimal.core import *


def py_test1():
    assert_all_equal(decimal_remove_zero_padding(Decimal(23.12300000234)),
        decimal_round_digit(Decimal(23.12300000234)),
        decimal_remove_zero_padding(Decimal('23.1230000')),
        decimal_round_digit(Decimal('23.1230000')), Decimal('23.123'))
    assert_all_equal(decimal_remove_zero_padding(Decimal(2312300000234.123)
        ), decimal_round_digit(Decimal(2312300000234.123)), Decimal(
        '2.3123E+12'))
    assert_all_equal(decimal_remove_zero_padding(Decimal(0.012300000234)),
        decimal_round_digit(Decimal(0.012300000234)), Decimal('0.0123'))
    assert_all_equal(decimal_remove_zero_padding(Decimal('0.0123000234')),
        decimal_round_digit(Decimal('0.0123000234')), Decimal('0.0123000234'))
    assert_all_equal(decimal_remove_zero_padding(Decimal('0.01230000234')),
        decimal_round_digit(Decimal('0.01230000234')),
        decimal_remove_zero_padding(Decimal('0.012300000234')),
        decimal_round_digit(Decimal('0.012300000234')), Decimal('0.0123'))
    assert_all_equal(decimal_remove_zero_padding(Decimal('0.0123000234')),
        decimal_round_digit(Decimal('0.0123000234')), Decimal('0.0123000234'))
    assert_all_equal(decimal_remove_zero_padding(Decimal(0.01230000234)),
        decimal_round_digit(Decimal(0.01230000234)),
        decimal_remove_zero_padding(Decimal('0.012300000234')),
        decimal_round_digit(Decimal('0.012300000234')), Decimal('0.0123'))
    assert_all_equal(decimal_remove_nine_padding(Decimal('32.999')),
        decimal_round_digit(Decimal('32.999')), Decimal('32.999'))
    assert_all_equal(decimal_remove_nine_padding(Decimal('32.99912')),
        decimal_round_digit(Decimal('32.99912')), Decimal('32.99912'))
    assert_all_equal(decimal_remove_nine_padding(Decimal('32.9999')),
        decimal_round_digit(Decimal('32.9999')),
        decimal_remove_nine_padding(Decimal('32.999912')),
        decimal_round_digit(Decimal('32.999912')), Decimal('33'))
    assert_all_equal(decimal_remove_nine_padding(Decimal(23.123999999234)),
        decimal_round_digit(Decimal(23.123999999234)), Decimal('23.124'))
    assert_all_equal(decimal_remove_nine_padding(Decimal(2312399999234.123)
        ), decimal_round_digit(Decimal(2312399999234.123)), Decimal(
        '2.3124E+12'))
    assert_all_equal(decimal_remove_nine_padding(Decimal(0.012399999234)),
        decimal_round_digit(Decimal(0.012399999234)), Decimal('0.0124'))
    eq_(decimal_round_digit(Decimal(0.003200009999)), Decimal('0.0032'))
    eq_(decimal_round_digit(Decimal(0.00320009999)), Decimal('0.0032001'))
    eq_(decimal_round_digit(Decimal(0.00320009999)), Decimal('0.0032001'))
    eq_(decimal_round_digit(Decimal(0.0032009999)), Decimal('0.003201'))
    eq_(adround(0.000320009999), 0.00032001)
    eq_(adround(-0.000320009999), -0.00032001)
    eq_(adround(-0.00032012), -0.00032012)
    assert_all_equal(adround(0.0003200009999), adround(0.000320000123),
        adround(0.00032), 0.00032)
    assert_all_equal(adround(-0.0003200009999), adround(-0.000320000123),
        adround(-0.00032), -0.00032)
    assert_all_equal(adround(0.000329999123), adround(0.000329999), adround
        (0.0003299999), 0.00033)
    return assert_all_equal(adround(-0.000329999123), adround(-0.000329999),
        adround(-0.0003299999), -0.00033)

