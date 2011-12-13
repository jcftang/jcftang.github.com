---
layout: post
title: "Using continuous integration systems in a team"
date: 2011-12-13 07:37
comments: true
categories: 
- team
- scm
published: false
---

Apart from the obvious unit testing code which could be fun trying to
convince a team to use. There are things known as 'Continuous
Integration' processes and servers. The basic idea is to continually
build and test your product automatically and report on successful and
failed builds.

I've known about this methodology for long time now but I've never
bothered to install a CI server since it was always for myself. In the
past a loop in a shell script running make and or make test usually
did the trick. Then I discovered gitbuilder which is just a small set
of scripts for automating the process. Today I have Jenkins installed
and I'm somewhat looking at buildbot as well.

Jenkins appears to be the most responsive and feature rich of the
three systems that I have played with. Buildbot looks lightweight and
scalable.  Though I do miss the git bisect and build on a failure that
gitbuilder provides.

Having to work with a team that is geographically distributed
sometimes makes idea exchanges, organising events and development
difficult. Any tool that I can get my hands on to encourage
collaborative work and discussion is going to be used.

Automating the build and test process also means that it is possible
to automate the release process. If all the 'tests' pass then why not
release it? I will need to look at integrating things with fitnesse
next. Other benefits from using a CI process or server means that most
if not all things get automated, this turns into a highly valuable
source of documentation for incoming developers and
engineers. Documentation often gets left to the end instead of being
done on a continual basis as the project progresses.

Hopefully the CI server won't be used to name and shame developers in
the group, it's there to make sure everything is working as expected.

Now to convince the team that building early and continually is
actually a good idea! Having somewhat successfully kicked off some
pairing sessions with various team members is good, but being more
flexible and professional about what we are building is what I'm
after.
