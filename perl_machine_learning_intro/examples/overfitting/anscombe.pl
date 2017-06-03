#!/usr/bin/perl
use strict;
use warnings;
use Data::Dataset::Classic::Anscombe;
use aliased 'Chart::Plotly::Plot';
use aliased 'Chart::Plotly::Trace::Scatter';
use PDL;
use PDL::Fit::Linfit;
use HTML::Show;
use JSON;

my $anscombe_quartet = Data::Dataset::Classic::Anscombe::get(as => 'Data::Frame');
my $anscombe_quartet_train = $anscombe_quartet->select_rows([0, 1, 1, 1]);
my $fit = linfit1d($anscombe_quartet_train->column('y2'), cat $anscombe_quartet_train->column('x2'));

my $partial_fit = Scatter->new(
 x => $anscombe_quartet_train->column('x2'),
 y => $fit,
 mode => 'lines',
 name => 'Model'
);

my $anscombe2 = Scatter->new( 
	x => $anscombe_quartet->column('x2'),
	y => $anscombe_quartet->column('y2'),
	mode => 'markers',
	marker => {size => 10},
	name => 'II'
);

my $plot = Plot->new( traces => [ $anscombe2, $partial_fit ] );
HTML::Show::show($plot->html);

