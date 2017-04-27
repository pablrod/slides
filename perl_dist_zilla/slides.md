### Creating and Distributing Perl Modules with [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

<img src="http://madrid.pm.org/static/madrid-pm.png" style="border:0px;">

[Madrid.pm](http://madrid.pm.org/)

2017-04-27

Pablo Rodríguez González

[Github repository](https://github.com/pablrod/slides/tree/master/perl_dist_zilla)

---

### What is a Module?

# Reusable code.

___

A Perl module is as simple as this:

```perl
package Modulo;
sub DoSomething {
    print "Something achieved!"; 
}
1;
```

___

Put the previous code in a file called: `Modulo.pm`

And you can use this in your shell with:

```bash
perl -I. -MModulo -E Modulo::DoSomething;
```

You can share your new Modulo.pm with your friends, by e-mail, p2p, ... 

___

O you can put this in a script: `my_script.pl`

```perl
use Modulo;

Modulo::DoSomething

```

```bash
perl -I. my_script.pl
```

___


Perl: 29 years making easy things easy!

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

___

### Multiple files

Every .pm file is a module, but when you say Dist::Zilla, is more like a collection of .pm file working together

---

### How to share my module?

Via [CPAN](https://metacpan.org/)!

Also if your module is open source, please consider using github, bitbucket or another social coding service. This way is easy for other to work with you and build great things together!

___

### What do I need to upload my module to CPAN?

* A tar.gz file with my distribution
* PAUSE ID

PAUSE: Perl Authors Upload SErver

___

### Where can I get a PAUSE ID?

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

___

### CPAN Distribution Release Manager

Think Dist::Zilla as a CPAN Distribution Release Manager

Dist::Zilla is not a perl build system, Dist::Zilla uses other modules for building:

* Module::Build
* ExtUtils::MakeMaker
* Module::Install

___

### Authors, authors, authors!

Dist::Zilla is just for authors!

Dist::Zilla is not needed for module installation (via cpan, cpanm, cpanp, ...)

---

### Dist::Zilla 101

```bash
dzil new Modulo
cd Modulo
# Write your module
dzil test Modulo
dzil release Modulo
```

---

### Configuring Dist::Zilla

Dist::Zilla main file is dist.ini

Basic dist.ini:

```
name = Modulo
author = Pablo Rodríguez González
license = MIT
```

---

### Distribution using Dist::Zilla

Dist::Zilla can generate most parts for you

Only with dist.ini you can get all the files needed to share and upload your module to CPAN

___

### Free things

* Generating META, MANIFEST, Build.PL, ...
* Critic tests
* Pod tests
* Coverage
* Tidying your code
* Generating license
* ...

___

### Everything is a plugin

Dist::Zilla is a complete framework based on plugins

You can add your own plugins or use from others

Dist::Zilla plugins are just modules in the namespace: Dist::Zilla::Plugin

___

### How to use a plugin?

Just add the name of the plugin to your dist.ini

For example: Dist::Zilla::Plugin::UploadToCPAN

```
name = Modulo
author = Pablo Rodríguez González
license = MIT

[UploadToCPAN]
```

___

### Plugin bundles

Plugins can be grouped in *bundles*

For example: Dist::Zilla::PluginBundle::Git

This plugins add support for commit, tagging, checking your code in a Git repository

Using a bundle is as easy as adding: [@BundleName]

```
name = Modulo
author = Pablo Rodríguez González
license = MIT

[UploadToCPAN]
[@Git]
```

___

### Personalized or per project set of bundles

A lot of authors or projects make their own bundles:

For example: Dist::Zilla::PluginBundle::DROLSKY

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









