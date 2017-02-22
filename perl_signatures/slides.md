### Perl 5 Signatures

Functions & Methods Signatures

---

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
