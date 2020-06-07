#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
from os import path
from setuptools import find_packages, setup

setup(
    name='autorounddecimal',
    version="0.0.4",
    description='automatic rounding decimal ',
    url='https://github.com/niitsuma/autorounddecimal/',
    author='Hirotaka Niitsuma',
    author_email='hirotaka.niitsuma@gmail.com',
    license="GNU Affero General Public License",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Operating System :: OS Independent",
        "Programming Language :: Lisp",
        "Topic :: Software Development :: Libraries",
    ],
    keywords='hy',
    install_requires=['hy'], #'hy>=0.15' was removed because gentoo linux hy package bug
    packages=['autorounddecimal'],
    package_data={'autorounddecimal': ['*.hy'],},
    test_suite='nose.collector',
    tests_require=['nose'],
    platforms='any',
)
