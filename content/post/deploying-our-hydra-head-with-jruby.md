+++
title = "deploying our hydra head with jruby"
date = "2013-01-22T19:49:02+00:00"


categories = []
+++

We've been ramping up our development work on the project that I have been on
in the last month or so. One of the issues that we've come across is the not
so good XML validation and parsing libraries that are available in the ruby
world compared to the java world.

So as an exercise I decided to see if I could make our prototype work
with jruby with the view of doing a test deployment on tomcat or some
other application server. One of the motivating reason for doing this
is to get access to the java based XML libraries for validation and
processing. It also means that if I can deploy to the same Tomcat server
where I'm running SOLR and Fedora-Commons then it means I'm saving myself
a chunk of work setting up and maintaining *mod_passenger*.

In short what I ended up doing was make sqlite3 as being dependent on
the ruby platform and creating a block for jruby. So here's the relevant
snippet from my *Gemfile*

``` ruby
gem 'sqlite3', :platforms => :ruby                                              
                                                                                
platforms :jruby do                                                             
  gem 'jruby-openssl'                                                           
  gem 'activerecord-jdbcsqlite3-adapter'                                        
  gem 'jruby-lint'                                                              
  gem 'warbler'                                                                 
                                                                                
  gem 'actionmailer'                                                            
  gem 'actionpack'                                                              
  gem 'activerecord'                                                            
  gem 'activerecord-jdbc-adapter'                                               
  gem 'activeresource'                                                          
  gem 'activesupport'                                                           
  gem 'jdbc-mysql'                                                              
  gem 'rack'                                                                    
  gem 'rake'                                                                    
end
```

What I found was that jruby behaves oddly when I'm behind a proxy, it
seems to blindly take my system proxy settings on my mac, so I had to
work around it.

Nokogiri seems to be subtly different when deployed with jruby and thus
it breaks a bunch of things, which is funny as this was the main reason
to testing out jruby so that we can access the java based XML libraries.
