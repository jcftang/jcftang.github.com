---
layout: post
title: "An excuse to learn Ruby and Ruby on Rails"
date: 2012-08-02 18:15
comments: true
external-url: 
categories: ruby dri team
---

I've been a long time consumer of ruby applications but never quite
got around to learning the language and the frameworks that are
available to developers. Within the team that I have been working
with, we've been evaluating [hydra](http://projecthydra.org) as a
possible framework for our project.

I've been spending the last few days reading
[The RSpec Book](http://pragprog.com/book/achbd/the-rspec-book), I've
been able to pick up some of the basic syntax of the language from the
BDD book. As soon as I finish this book I will be moving on to a more
real world book relating to ruby with the goal of being able to
develop Ruby and Ruby on Rails applications.

Well, I didn't get as far as finishing the RSpec book and I've started
creating a rubygem. I'm attempting to expose the insides of
[zfec](https://tahoe-lafs.org/trac/zfec/), specifically the
functionality in _fec.c_. So far I've been lazy and I am using swig to
automatically generate the C to ruby bindings with something like this

{% codeblock fec.i lang:c %}
%module fec

%{
#include "fec.h"
%}

fec_t* fec_new(unsigned short k, unsigned short m);
void fec_free(fec_t* p);
void fec_decode(const fec_t* code, const gf*restrict const*restrict const inpkts, gf*restrict const*restrict const outpkts, const unsigned*restrict const index, size_t sz);
void fec_encode(const fec_t* code, const gf*restrict const*restrict const src, gf*restrict const*restrict const fecs, const unsigned*restrict const block_nums, size_t num_block_nums, size_t sz);
{% endcodeblock %}

Swig does it's thing,

{% codeblock lang:bash %}
swig -ruby fec.i
{% endcodeblock %}

Amazingly after some fiddling I got ruby to load up the module. It
doesn't mean that it's going to do much though as I need to learn
about the typemaps in the ruby C interface do the correct mappings.

I'm so far taking inspiration from the zfec python module to take a
stab at building a ruby equivalent package for the sake of learning
ruby and maybe even end up with something useful for the project that
I am working on in work.

After playing with extending ruby, I'm thinking I may need to take a
step back and evaluate if this is the best way for me to learn ruby or
not. I should probably not mess too much extending the language with a
C library.
