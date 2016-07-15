+++
title = "slurm bank that big script for banking in slurm"
date = "2012-09-29"


categories = []
+++

A co-worker of mine (Paddy Doyle) had originally hacked at a perl script
for reporting balances from SLURM's accounting system a year or two ago
and he had figured out that it might be possible to do some minimalistic
'configuration' and scripting to get a system that's very basic but
functional.

It was just one of those things that funding agencies wanted to justify
how the system was being used, GOLD was clunky and obtrusive and
complicated for what we wanted. Most of all we liked SLURM but not GOLD
and Maui which was needed to get full accounting and banking (most of
the features weren't used).

Being good and lazy engineers we got excited with the prospect of having
the option of replacing SLURM, Maui and GOLD with just plain old SLURM
we set out to write down the workflows for what we wanted to do and what
the user and funding agencies actually wanted. With those ideas in mind
we set out to implement as much as we could and needed in just plain
old sh/bash scripting with a splash of perl. Replacing two components
with one meant that we would have less work to do in the long run ;)

After a whole year of running with these scripts and just putting it
online, I've noticed that there may be a few sites out there that might
be using our scripts and workflows. It would be nice to find out how
many people are using our implementation of a banking system in SLURM
and if it's driven by sysadmins looking to account for usage or is it
funding agencies looking for justification of the usage of a system.

I was going to be at the SLURM User Group Meeting 2012 to give a
short talk on our experiences with the SLURM-Bank scripts and workflow,
but sadly I have to be in the US during this meeting and my colleague
"Paddy Doyle" will there instead of me.  I would have liked to go and chat
with the developers of SLURM to push for more advanced banking/accounting
facilities in SLURM itself. Visiting BSC again would have been fun.
