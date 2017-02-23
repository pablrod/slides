#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use 5.24.0;
use feature 'signatures';

say "Exponentially distributed random number: ", ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1, 0.5);

sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber ($lambda, $y) {
    return - (1/$lambda) * log($y);
}


