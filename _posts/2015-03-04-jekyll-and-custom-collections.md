---
layout: post
title: Jekyll and custom collections
date: 2015-03-04 15:25:37
categories:
---

I just noticed that Jekyll can handle custom collections (ie. not just posts and pages)

Custom collections can be lists of anything -

declare the collection in \_config.yml:


{% highlight yaml %}
collections:
  demos:
    output: true
    permalink: /demos/:path/
{% endhighlight %}

make a new folder '_demos', with a 'test.md' file in it:


{% highlight yaml %}
---
layout: page
title: Test Demo
---

Test demo content

{% endhighlight %}

and, for an archive page as an index to the collection, another new folder, 'demos', with an 'index.html' file in it:


{% highlight liquid %}{% raw %}
---
layout: default
---

<ul class="post-list">
{% for demo in site.demos %}
  <li>
    <h2>
      <a class="post-link" href="{{ demo.url | prepend: site.baseurl }}">{{ demo.title }}</a>
    </h2>
  </li>
{% endfor %}
</ul>

{% endraw %}{% endhighlight %}


Check it out: [/demos](/demos)