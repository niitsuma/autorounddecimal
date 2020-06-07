# autorounddecimal

[![Build Status](https://img.shields.io/travis/niitsuma/autorounddecimal/master.svg?style=flat-square)](https://travis-ci.org/niitsuma/autorounddecimal)
[![Downloads](https://pepy.tech/badge/hymiscniitsuma)](https://pepy.tech/project/autorounddecimal)
[![Version](https://img.shields.io/pypi/v/hymiscniitsuma.svg?style=flat-square)](https://pypi.python.org/pypi/autorounddecimal)

auto round decimal

## Usage

### python

```python
from autorounddecimal.core import adround

adround(0.00032001)     ;;=> 0.00032001
adround(0.0003200001)   ;;=> 0.00032
adround(0.000319999)    ;;=> 0.00032

adround(3.2001)     ;;=> 3.2001
adround(3.200001)   ;;=> 3.2
adround(3.19999)    ;;=> 3.2


```

## Installation

```shell
$ pip install autorounddecimal
```

