---
layout: post
title: "When to automate deployments and when not to?"
date: 2014-04-21T15:17:23+01:00
comments: true
external-url: 
categories: ansible hydra dri
---

We recently had Hydra Camp in Dublin in Trinity College Dublin which
went pretty well. I even got to talk a little about what we're doing
with Shibboleth and how we're deploying our systems.

We're deploy with ansible either by someone running the playbook by hand
or via buildbot which pushes out a build when tests pass successfully
on the master branch.

Someone in the camp asked at what complexity should you begin to automate
at, which I thought was a strange question since at DRI/TCD we thought
of deploying as automatically as possible from day 1.

My response to the question of when to automate was to automate it if you
know that you need documentation or know that there might be a second
time in setting up the system. Which pretty meant that we automate as
much as we can.

Automating means you at least have a script as documentation and as people
leave/join the project you have a chance of figuring out whats going
on. This is especially useful when you have a CI or CD styled system.
