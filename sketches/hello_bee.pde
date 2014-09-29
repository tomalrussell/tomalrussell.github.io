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
