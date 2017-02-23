### Perl 5 Signatures

[Madrid.pm](http://madrid.pm.org/)

2017-02-23

Pablo Rodríguez González

[Github repository](https://github.com/pablrod/slides/tree/master/perl_signatures)

---

### Problem

```perl
sub ExponentialDistribution {
    my ($lambda, $y) = @_;
    if (scalar @_ != 2) {
        die "This function only works with two arguments!";
    }
    return - (1/$lambda) * log(y);
}
```
Too verbose and repetitive

---

### First solution

[Params::Validate](https://metacpan.org/pod/Params::Validate)

```perl
sub ExponentialDistribution {
    my ($lambda, $y) = validate_pos(@_, 1, 1);
    return - (1/$lambda) * log(y);
}
```

Not bad

---

### Problems with [Params::Validate](https://metacpan.org/pod/Params::Validate)

Fast, as long as you can use Params::Validate::XS. But... 

TODO Nytprof with DateTime or something simpler

---

### Functions & Methods Signatures

Available since perl 5.20

---

### Basic example

```perl
sub ExponentialDistribution ($lambda, $y) {
    return - (1/$lambda) * log(y);
}
```

This checks for exactly two parameters with some value (even `undef`)


---

### Optional parameters and default values

```perl
sub ExponentialDistribution ($lambda, $y = rand) {
    return - (1/$lambda) * log(y);
}
```

```perl
say "Random number exponentially distributed: " . ExponentialDistribution(1);
```

---

### Arrays and hashes

---

### Diference with prototypes

---

### Unnamed arguments

---

### What if... I have perl 5.8?

Really? That was released on July 18, 2002 and received the last update in 2008-12-14...

Don't worry! Use [perlbrew](https://perlbrew.pl/)<img src="https://perlbrew.pl/images/h1-beer.png">

Perl moves faster than your distro! (Or Windows, Mac or whatever)


```bash
cpanm App::perlbrew
perlbrew init
perlbrew install perl-5.24.0
perlbrew switch perl-5.24.0
```

---

### Mojolicious examples

See: http://mojolicious.org/

```perl
websocket '/title' => sub ($c) {
  $c->on(message => sub ($c, $msg) {
    my $title = $c->ua->get($msg)->result->dom->at('title')->text;
    $c->send($title);
  });
};
```

---

### Documentation

[Official documentation](http://perldoc.perl.org/perlsub.html#Signatures)

---

### MISC

TODO Constant folding?
TODO Show perlops?
TODO Show validation errors
TODO Wishlist
TODO Use signatures!!
TODO Docker


