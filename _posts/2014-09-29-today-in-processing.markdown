---
layout: post
title: Three things I learnt about Processing today
date: 2014-09-29 21:23:54
categories: processing
---

1. setup() runs once, draw() runs once a frame.
1. there are some handy magic variables: width, height, mouseX and mouseY.
1. running background() clears the frame so it doesn't just fill up with colour.

Here's a sketch:

<script src="/js/processing.min.js"></script>
<canvas class="sketch" data-processing-sources="/sketches/hello_bee.pde"></canvas>

And here's the code:

{% highlight java linenos  %}
Bee b;

void setup() {
  size(300, 300);
  noStroke();
  fill(#000000);
  b = new Bee(random(width), random(height));
}

void draw() {
  background(#ffffff);
  b.draw();
}

class Bee extends PVector {
  Bee(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void draw() {
    if (mouseX > this.x) {
      this.x++;
    } else {
      this.x--;
    }

    if (mouseY > this.y) {
      this.y++;
    } else {
      this.y--;
    }

    ellipse(this.x, this.y, 10, 10);
  }
}  

{% endhighlight %}

