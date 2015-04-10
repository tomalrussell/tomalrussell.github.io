---
layout: post
title: Lister, a simple localStorage wrapper
date: 2015-03-06 13:20:06
categories:
---

I wrote a small wrapper around localStorage, for saving lists of things
in the browser, called [lister (code on github)](//github.com/tomalrussell/lister/).

Local storage in the browser is handy - you can save data that will persist
between page refreshes, and maybe avoid making network requests, whether that's
to let people use that data offline, or just to avoid making relatively slow
requests over the network.

HTML5 localStorage is well supported across browsers
[http://caniuse.com/#feat=namevalue-storage](http://caniuse.com/#feat=namevalue-storage).
On the other hand, it's basically just a key/value store for strings
[http://diveintohtml5.info/storage.html#methods](http://diveintohtml5.info/storage.html#methods).

Lister handles storing objects in lists and getting them out again: under the
hood, each list uses its name as the localStorage key and a JSON-stringified
array of objects as the value.




