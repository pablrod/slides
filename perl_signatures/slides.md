### Perl 5 Signatures

<img src="http://madrid.pm.org/static/madrid-pm.png">

[Madrid.pm](http://madrid.pm.org/)

2017-02-23

Pablo Rodríguez González

[Github repository](https://github.com/pablrod/slides/tree/master/perl_signatures)

---

### Problem

```perl
sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber {
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
sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber {
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
sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber ($lambda, $y) {
    return - (1/$lambda) * log(y);
}
```

This checks for exactly two parameters with some value (even `undef`)


---

### Optional parameters and default values

```perl
sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber ($lambda, $y = rand) {
    return - (1/$lambda) * log(y);
}
```

```perl
say "Random number exponentially distributed: " . ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1);
```

---

### Arrays and hashes

Arrays and hashes ara used at the end of the argument list (It's the same without signatures)

```perl

sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber ($lambda, @y ) {
    return - (1/$lambda) * log(y);
}

```

```perl
say "Exponentially distributed random numbers: ", 
    join("\n", ExponentiallyDistributedRandomNumberFromUniformRandomNumber(1, map {rand} 1 .. 10));
``` 

---

### Difference with prototypes

Prototypes are checked at compile time

```perl
sub ExponentiallyDistributedRandomNumberFromUniformRandomNumber($$) {
    my ($lambda, $y) = @_;
    return - (1/$lambda) * log(y);
}

```
Prototypes and signatures can be mixed? No. The first character that is not part of a prototype is used as a sign that this is a signature.

---

### Unnamed arguments


```perl
sub BackwardsCompatibleFunctionIgnoreMiddleArgument ($first, $, $third) {
    return $first * $third;
}
```

---

### How this is really different?

```bash
perl -MO=Concise,ExponentiallyDistributedRandomNumberFromUniformRandomNumber 01-without_any_signature.pl 
```

```
main::ExponentiallyDistributedRandomNumberFromUniformRandomNumber:
c  <1> leavesub[1 ref] K/REFC,1 ->(end)
-     <@> lineseq KP ->c
1        <;> nextstate(main 15 01-without_any_signature.pl:12) v:U,*,&,x*,x&,x$,$,268437504 ->2
3        <2> aassign[t4] vKS ->4
-           <1> ex-list lK ->-
2              <0> padrange[$lambda:15,16; $y:15,16] */LVINTRO,2 ->3
-              <1> rv2av[t3] lK/STRICT,1 ->-
-                 <$> gv(*_) s ->-
-           <1> ex-list lKPRM* ->3
-              <0> pushmark sRM*/LVINTRO ->-
-              <0> padsv[$lambda:15,16] sRM*/LVINTRO ->-
-              <0> padsv[$y:15,16] sRM*/LVINTRO ->-
4        <;> nextstate(main 16 01-without_any_signature.pl:13) v:U,*,&,x*,x&,x$,$,268437504 ->5
-        <@> return K ->-
-           <0> pushmark s ->5
b           <2> multiply[t8] sK/2 ->c
8              <1> negate[t6] sK/1 ->9
7                 <2> divide[t5] sKP/2 ->8
5                    <$> const(IV 1) s ->6
6                    <0> padsv[$lambda:15,16] s ->7
a              <1> log[t7] sK/1 ->b
9                 <0> padsv[$y:15,16] s ->a
```

---
### How this is really different?

```bash
perl -MO=Concise,ExponentiallyDistributedRandomNumberFromUniformRandomNumber 02-basic_signature.pl 
```

```
The signatures feature is experimental at 02-basic_signature.pl line 12.
main::ExponentiallyDistributedRandomNumberFromUniformRandomNumber:
1h <1> leavesub[1 ref] K/REFC,1 ->(end)
-     <@> lineseq KP ->1h
1        <;> nextstate(main 90 02-basic_signature.pl:12) v:U,%,*,&,x*,x&,x$,$,469764096 ->2
-        <1> null vK/1 ->i
6           <|> or(other->7) vK/1 ->i
5              <2> le sK/2 ->6
3                 <1> rv2av[t12] sK/STRICT,1 ->4
2                    <$> gv(*_) s ->3
4                 <$> const(IV 2) s ->5
h              <@> die[t11] vK/1 ->i
7                 <0> pushmark s ->8
g                 <@> sprintf[t10] sK/2 ->h
8                    <0> pushmark sM ->9
9                    <$> const(PV "Too many arguments for subroutine at %s line %d.\n") sM ->a
f                    <2> lslice lKM/2 ->g
-                       <1> ex-list lK ->d
a                          <0> pushmark s ->b
b                          <$> const(IV 1) s ->c
c                          <$> const(IV 2) s ->d
-                       <1> ex-list lK ->f
d                          <0> pushmark s ->e
e                          <0> caller[t9] l ->f
i        <;> nextstate(main 90 02-basic_signature.pl:12) v:U,%,*,&,x*,x&,x$,$,469764096 ->j
-        <1> null vK/1 ->z
n           <|> or(other->o) vK/1 ->z
m              <2> ge sK/2 ->n
k                 <1> rv2av[t8] sK/STRICT,1 ->l
j                    <$> gv(*_) s ->k
l                 <$> const(IV 2) s ->m
y              <@> die[t7] vK/1 ->z
o                 <0> pushmark s ->p
x                 <@> sprintf[t6] sK/2 ->y
p                    <0> pushmark sM ->q
q                    <$> const(PV "Too few arguments for subroutine at %s line %d.\n") sM ->r
w                    <2> lslice lKM/2 ->x
-                       <1> ex-list lK ->u
r                          <0> pushmark s ->s
s                          <$> const(IV 1) s ->t
t                          <$> const(IV 2) s ->u
-                       <1> ex-list lK ->w
u                          <0> pushmark s ->v
v                          <0> caller[t5] l ->w
z        <;> nextstate(main 88 02-basic_signature.pl:12) v:U,%,*,&,x*,x&,x$,$,469764096 ->10
12       <2> sassign vKS/2 ->13
-           <1> ex-aelem sK/2 ->11
-              <1> ex-rv2av sKR/STRICT,1 ->-
10                <$> aelemfast(*_) s ->11
-              <0> ex-const s ->-
11          <0> padsv[$lambda:88,90] sRM*/LVINTRO ->12
13       <;> nextstate(main 89 02-basic_signature.pl:12) v:U,%,*,&,x*,x&,x$,$,469764096 ->14
16       <2> sassign vKS/2 ->17
-           <1> ex-aelem sK/2 ->15
-              <1> ex-rv2av sKR/STRICT,1 ->-
14                <$> aelemfast(*_) s/1 ->15
-              <0> ex-const s ->-
15          <0> padsv[$y:89,90] sRM*/LVINTRO ->16
17       <;> nextstate(main 90 02-basic_signature.pl:12) v:U,%,*,&,x*,x&,x$,$,469764096 ->18
18       <0> stub vP ->19
19       <;> nextstate(main 90 02-basic_signature.pl:13) v:U,%,*,&,x*,x&,x$,$,469764096 ->1a
-        <@> return K ->-
-           <0> pushmark s ->1a
1g          <2> multiply[t16] sK/2 ->1h
1d             <1> negate[t14] sK/1 ->1e
1c                <2> divide[t13] sKP/2 ->1d
1a                   <$> const(IV 1) s ->1b
1b                   <0> padsv[$lambda:88,90] s ->1c
1f             <1> log[t15] sK/1 ->1g
1e                <0> padsv[$y:89,90] s ->1f

```


---

### What if... I have perl 5.8?

Really? That was released on July 18, 2002 and received the last update in 2008-12-14...

Don't worry! Use [perlbrew](https://perlbrew.pl/)

<img src="https://perlbrew.pl/images/h1-beer.png">

```bash
cpanm App::perlbrew
perlbrew init
perlbrew install perl-5.24.1
perlbrew switch perl-5.24.1
```

Perl moves faster than your distro! Or Windows, Mac or whatever! 

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

### Use Signatures!

More users, more feedback, more improvements!

---

### Wishlist

What do you want?

* Named parameters?
* Callback validation?
* Type validation?

Ask for it! Blog for it!

---

### Documentation

[Official documentation](http://perldoc.perl.org/perlsub.html#Signatures)

---

### Feature Bundles (Bonus slide)

[Feature bundles](http://perldoc.perl.org/feature.html#FEATURE-BUNDLES) are multiple features loaded together available since perl 5.X

Just use [implicit loading](http://perldoc.perl.org/feature.html#IMPLICIT-LOADING): `use 5.024;` 


5.24 includes: 

* say 
* state 
* switch 
* unicode_strings
* unicode_eval 
* evalbytes 
* current_sub 
* fc
* postderef_qq

---

### Tests this with Docker (Bonus slide)


```bash
docker run -it --rm --name my-running-script -v `pwd`:/usr/src/myapp:Z -w /usr/src/myapp perl:5.24 perl 02-basic_signature.pl
```

