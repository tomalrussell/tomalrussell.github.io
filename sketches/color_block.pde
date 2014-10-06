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

  // loop over square number of pixels
  i = 0; 
  j = 0;
  squareX = 64;
  squareY = 64+128*2;
  for (int p = 0; p < 128*128; p++) {
    j = (p % 128);
    if (j == 0) {
      i++;
    }
    x = j + squareX;
    y = i + squareY;
    px = y*width + x;
    pixels[px] = color(i*2, j*2, k*2);
  }


  // loop over square number of pixels
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

  // loop over square number of pixels
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

void keyPressed() { 
  if (keyCode == UP) {
    k = constrain(k + 1, 0, 255);
  } 
  if (keyCode == DOWN) {
    k = constrain(k - 1, 0, 255);
  }
}

void mouseMoved() {
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

