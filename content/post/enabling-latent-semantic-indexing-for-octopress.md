+++
title = "enabling latent semantic indexing for octopress"
date = "2012-03-08"


categories = ["linux", "octopress"]
+++

For those that care about having related posts on their [Octopress]()
blog. It's actually quite easy to turn it on, it's nice to have and
useful. But it's not enabled by default in Octopress.

This feature already exists in jekyll, enabling this feature in
Octopress is a trival task.

Firstly add this to your `_config.yml` file

    lsi: true

Then create a file such as `source/_includes/custom/asides/related.html` with the following
content, add it to one of your asides in `_config.yml`

{% raw %}
	<section>
	<h1>Related Posts</h1>
	<ul class="posts">
		{% for post in site.related_posts limit:5 %}
		<li class="related">
		    <a href="{{ root_url }}{{ post.url }}">{{ post.title }}</a>
		</li>
		{% endfor %}
		</ul>
	</section>
{% endraw %}

It is possible to style the list, but in the above I have chosen to
keep the same style as the recent posts.

## Probable issues with enabling LSI

There are some issues with enabling LSI in jekyll/octopress, the
primary issue will be performance. The default implementation will be
slow if you have lots of posts to classify. It would be recommended
that rb-gsl be installed to accelerate the classification process.


[Octopress]: http://octopress.org/
