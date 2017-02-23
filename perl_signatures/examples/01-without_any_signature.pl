#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use 5.24.1;

say "Exponentially distributed random number: ", ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1, 0.5);

sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber {
    my ($lambda, $y) = @_; 
    return - (1/$lambda) * log($y);
}


