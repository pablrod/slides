#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use 5.24.0;
use feature 'signatures';

say "Exponentially distributed random numbes: ", ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1, map {rand} 1 .. 10);

sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber ($lambda, @y ) {
    return map {- (1/$lambda) * log($_) } @y;
}


