---
layout: post
title: "Testing and developing rails applications in a near production like environment"
date: 2013-03-27T11:57:41+00:00
comments: true
external-url: 
categories: dri team linux
---

At work we like to do lots of testing and behaviour driven development
since we have a number of stakeholders and institutions all working on
the same application. To make sure everyone is getting what they want
we're using cucumber to write our specifications; that is we're primarily
doing outside in developement of our system.

As such we like to test things in a near production like
environment... Having chosen to use [capybara-webkit][] to test
the interface (at a very functional and simplistic level) on our
workstations. I decided to test drive the vagrant enviroment that I had
been working on the past few months. Btw, this environment is bootstrapped
with ansible, I'm a much happier person since I ditched puppet.

Annoyingly in RHEL6 and friends QT is a little bit behind the current
times, we needed at least QT4.7 to run the javascript tests (which rely
on webkit). The first an obvious thing was to uninstall qt from the base
system and then install qt47 from atrpms-testing.

Little did I know that [tomcat6 depends][] on redhat-lsb which in turn
depends on qt-x11 and so on... My plans on testing and developing our
application in a near production environment almost got shot.

In the end the solution was to test the java script components with either
selenium or better yet [poltergeist][] for capybara. We chose poltergeist
as it runs headless. This isn't really a problem of cucumber/capybara,
but rather a problem of RHEL6 and friends with old packages.

...after sometime I have a half-way there set of ansible playbooks to
get me to where I need to be in a virtual environment...

...less rant ...

[poltergeist]: https://github.com/jonleighton/poltergeist
[capybara-webkit]: https://github.com/thoughtbot/capybara-webkit
[tomcat6 depends]: https://bugzilla.redhat.com/show_bug.cgi?id=886996
