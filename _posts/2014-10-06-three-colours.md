---
layout: post
title: Three squares with colours
date: 2014-10-06 18:55:54
categories: processing
---

I find [colour spaces](https://en.wikipedia.org/wiki/Color_space) counter-intuitive: somehow red, green and blue light mix to make all the colours we ever see on screens. So I wanted to play a bit with spreading out all the possible rgb colours (then ended up sampling a fraction, to get smaller squares).

Rather than drawing points with the `point()` function, Processing also lets you manipulate the pixels of the canvas directly, setting a colour value at each point.

1. call `loadPixels()`
1. then you can manipulate the `pixels` array directly
1. call `updatePixels()` 

Here's a sketch:

<script src="/js/processing.min.js"></script>
<canvas class="sketch" data-processing-sources="/sketches/color_block.pde"></canvas>

And here's the code:

{% highlight java linenos  %}
int i = 0;
int j = 0;
int k = 0;

void setup() {
  size(512, 512);
  background(0);
}

void draw() {
  int x;
  int y;
  int px;
  int squareX;
  int squareY;

  // load full array of screen pixels
  loadPixels();

  // loop over square number of pixels - this next block is just
  // copy-pasted three times.
  // There's  probably a nice way to abstract this,
  // as we're only moving the position
  // and the order of the i/j/k values (whether they count for r,g,or b)
  // but this'll do for now.

  // i and j vary like x and y coordinates relative to the colour square
  i = 0; 
  j = 0;
  // squareX and squareY are the coordinates of the top left corner of the 
  // colour square
  squareX = 64;
  squareY = 64+128*2;
  for (int p = 0; p < 128*128; p++) {
    j = (p % 128);
    if (j == 0) {
      i++;
    }
    // x and y are the coordinate of this pixel in the whole canvas
    x = j + squareX;
    y = i + squareY;
    // px is the index of this pixel in the whole pixel array
    px = y*width + x;
    // set this pixel to a colour
    pixels[px] = color(i*2, j*2, k*2);
  }


  // draw another colour square
  i = 0; 
  j = 0;
  squareX = 64+128*2;
  squareY =64;
  for (int p = 0; p < 128*128; p++) {
    j = (p % 128);
    if (j == 0) {
      i++;
    }
    x = j + squareX;
    y = i + squareY;
    px = y*width + x;
    pixels[px] = color(j*2, k*2, i*2);
  }

  // draw a third colour square
  i = 0; 
  j = 0;
  squareX = 128+64;
  squareY = 128+64;
  for (int p = 0; p < 128*128; p++) {
    j = (p % 128);
    if (j == 0) {
      i++;
    }
    x = j + squareX;
    y = i + squareY;
    px =  y*width + x;
    pixels[px] = color(k*2, i*2, j*2);
  }

  updatePixels();
}

/**
 * keyPressed gets called when a key is pressed
 * - and keyCode compares to handy constants
 *
 */
void keyPressed() { 
  // control k value incrementally using the keyboard
  if (keyCode == UP) {
    k = constrain(k + 1, 0, 255);
  } 
  if (keyCode == DOWN) {
    k = constrain(k - 1, 0, 255);
  }
}

/**
 * mouseMoved gets called when the mouse moves
 * - and mouseX and mouseY are set to canvas coordinates
 *
 */
void mouseMoved() {
  // set k value to somewhere in the 0-128 scale, based on movement inside
  // the block of the canvas, with a buffer/border of 64px
  float scaledY;
  if (mouseY < 64){
    scaledY = 0.0;
  } else {
    if(mouseY > (height - 64) ){
      scaledY = 1.0;
    } else {
      scaledY = (mouseY - 64.0) / (height - 128);
    }
  }
  k = floor(scaledY*128);
}

{%endhighlight %}

