---
layout: post
title: Getting Set with Github and Jekyll 
date:   2013-08-13 22:15:23
categories: how-to
---

So, a quick overview of how this site is made and hosted. The site is hosted using [Github Pages](https://pages.github.com/), which uses Jekyll to generate static HTML websites from a bunch of text files and some templates. 

Two main advantages:

1. Free hosting
1. Hassle-reduced (nearly hassle-free) writing.

Setup is straightforward, but there is a fair list of things you'll need.

On your local machine:

* a text editor, for writing stuff
* [Git](http://git-scm.com/downloads), for saving stuff and talking to Github
* [Ruby](http://www.ruby-lang.org/en/downloads/), the language that Jekyll is written in / the interpreter that it runs on
* [RubyGems](http://rubygems.org/pages/download), a package manager for Ruby projects
* [Jekyll](http://jekyllrb.com/), for turning the stuff you wrote into a website

On the internet:

* a [Github](https://github.com/) user account, where the site will be hosted
* a domain name, if you want a non-github address

And finally, before we begin - Documentation (for things I might miss here):

* [Github Pages Help](https://help.github.com/categories/20/articles)
* [Jekyll Docs](http://jekyllrb.com/docs/home/)
* [Markdown Syntax](http://daringfireball.net/projects/markdown/basics)

Installing Stuff
----------------

On Ubuntu:

{% highlight sh %}
sudo apt-get install git-core
sudo apt-get install ruby
sudo apt-get install rubygems
gem install jekyll
jekyll new myblog
cd myblog
jekyll serve
# => Now browse to http://localhost:4000
{% endhighlight %}
