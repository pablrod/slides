### Creating and Distributing Perl Modules with [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

<img src="http://madrid.pm.org/static/madrid-pm.png" style="border:0px;">

[Madrid.pm](http://madrid.pm.org/)

2017-04-27

Pablo Rodríguez González

[Github repository](https://github.com/pablrod/slides/tree/master/perl_dist_zilla)

---

### What is a Module?

Reusable code

In Perl is as simple as this:

```perl
package Modulo;
sub DoSomething {
    print "Something achieved!"; 
}
1;
```

Put this in a file called: Modulo.pm

And you can use this in your shell with:

```bash
perl -I. -MModulo -E Modulo::DoSomething;
```

You can share your new Modulo.pm with your friends, by e-mail, p2p, ... 

---

### Reusability!

Good reusability requires ease of reusability and this implies management of:

* build
* packaging
* distribution
* installation
* configuration
* upgrade

---

### What is a Distribution?

A distribution is the collection of files that support reusability

This includes the .pm file(s) with our module(s) code

___

### Essential files of a distribution

* Build script: Makefile.PL or Build.PL
* Manifest file: MANIFEST
* META file(s): META.yml and/or META.json
* Main module: lib/Module.pm 

___

### Customary files of a distribution

* README
* CHANGES
* LICENSE

---

### How to share my module?

Via CPAN!

Also if your module is open source, please consider using github, bitbucket or another social coding service. This way is easy for other to work with you and build great things together!

___

### What I need to upload my module to CPAN?

* A tar.gz file with my distribution
* PAUSE ID

PAUSE? Perl Authors Upload SErver

___

### Where I can get a PAUSE ID?

[http://pause.perl.org/pause/query?ACTION=request_id](http://pause.perl.org/pause/query?ACTION=request_id)

---

### But... I just want to write code

Me too!

Preparing and writing a distribution can be a lot of work and I am lazy

---

### Dist::Zilla

Dist::Zilla is a tool to build distributions

¿Only distributions?

Well, it does a lot of things!

* Generate tests
* Check style
* Commit/Push to source control
* ...

---

### Dist::Zilla 101

```bash
dzil new Modulo
cd Modulo
dzil build Modulo
dzil test Modulo
dzil release Modulo
```

---

### Configuring Dist::Zilla

Dist::Zilla main file is dist.ini

---

### Distribution using Dist::Zilla

Dist::Zilla can generate most parts for you

Only with dist.ini you can get all the files needed to share and upload your module to CPAN

---

### Documentation using Pod::Weaver

Pod::Weaver can

---

### Dist::Zilla alternatives

Dist::Zilla has a LOT of dependencies, and with plugins there are even more

Dist::Zilla modifies your files, that is, the files in CPAN are different from the files in your source control. If someone wants to contribute but without using Dist::Zilla is difficult (Merging patchs).

* [Minilla](https://metacpan.org/pod/Minilla)
* [Dist::Milla](https://metacpan.org/pod/Dist::Milla)


---

### Documentation

* [http://dzil.org/](http://dzil.org/)
* [https://metacpan.org/pod/Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
* [David Golden Article](http://www.dagolden.com/index.php/752/why-im-using-distzilla/)









