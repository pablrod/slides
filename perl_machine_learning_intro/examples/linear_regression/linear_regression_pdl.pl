#!/usr/bin/env perl 
use strict;
use warnings;
use utf8;
use aliased 'Chart::Plotly::Plot';
use aliased 'Chart::Plotly::Trace::Scatter';
use PDL;
use PDL::Fit::Linfit;
use Path::Tiny;
use HTML::Show;

my $number_of_points = 20;
my $x = sequence $number_of_points;
my $y = $x * ( 1 + 0.1 * grandom $number_of_points ); # A little bit of noise
my $yfit = linfit1d $y, cat $x; # Model: y = ax

my $points = Scatter->new( x => $x, y => $y, mode => 'markers', name => 'Observations' );
my $model = Scatter->new( x => $x, y => $yfit, name => 'Model' );
my $plot = Plot->new( traces => [ $points, $model ] );

HTML::Show::show($plot->html);

