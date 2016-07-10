+++
title = "prototyping and testing systems"
date = "2012-04-09"


Categories = ["scm", "team"]
+++

One of the issues with with dogfooding your own projects to accelerate
development might be the lack of control and feedback from the
specifications and requirements process. To try and mitigate this
effect, automated testing should be done, that is specification,
feature and behavioural testing. Call it what you will, but the basic
idea is to get a common understanding between the stakeholder, project
owner and developer to understand what is being built and to write
automated tests collectively to ensure that it is being
delivered. This might be a narrow view of the whole area, but I'm just
taking what works for me and using it to deliver the project.

There are _many_ specification/feature/behavioural testing tools out
there for almost language that you can think of, so use what works for
you and your team. The testing process not only ensures that the
prototype is working the way that you intend, but it is also a process
where documentation can also be written at the sametime. This
documentation could be used as an initial proposal to the stakeholder
to put forward what you think they want if there are no clear
specifications or requirements in place.

The interns and I have been working on a small prototype system
for a bigger project and the benefits of writing tests are beginning
to show. It has become apparent to the interns that have been working
on this project that _testing is a good thing_, especially if it can
be automated. We're not quite doing TDD or BDD, but it's something
that is in between, we're getting there with a tiered set of tests.

We're finding that (probably) about 50% of the time of the team is
spent on refactoring, writing tests and documentation. Testing
combined with the automated builder/tester, the team is writing code
smarter and better instead of just churning out masses of code which
isn't well tested or documented. Given the choice and based on
experience I would prefer to have code that is tested and
documentated, rather than lots of cool half-working and half-tested
features.

The testing process has been a fantastic way for me to steer the
interns, given how little expertise I have with javascript. The tests
let me learn how the interns have been putting the prototype together,
but it also lets me fuzz up the tests to make sure things are working
and to also write new tests to communicate what I think is needed when
appropriate. We've somewhat combined minimal QA into the development
and testing process.

In the end we hope to have a functional prototype system which does
one thing (one set of workflows) well, have lots of documentation,
have tests to back it up and prove that it works. While having an
implementation is great for the potential stakeholder, having
documentation and tests puts us in an even stronger position.
