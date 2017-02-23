#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use feature 'say';
use Params::Validate;

say "Exponentially distributed random number: ", 
    join ("\n", 
        map {ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1, $_)} 1..1e5);

sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber {
    my ($lambda, $y) = validate_pos(@_, 1, 1);
    return - (1/$lambda) * log($y);
}


