class Money {
  int x, y, diameter;
  float vx, vy, ax, ay;
  boolean dropped;

  Money (int diameter) {
    this.x = 0;
    this.y = 0;
    this.diameter = diameter;
    
    vx = 0.0;
    vy = 0.0;
    ax = 0.0;
    ay = 0.0;
    dropped = false;
  }

  // drop this object
  void drop() {
    x = (int)random(width/4, 3*width/4);
    y = (int)random(-100, -50);
    
    vx = random(-0.05f, 0.05f);
    vx = 0f;
    vy = -1f;

    ax = random(-0.005f, 0.012f);
    ay = random(0.01f, 0.05f);

    dropped = true;
  }

  void draw() {
    if (dropped) {
      // make the ball fall
      if (y < height) {
        x += vx;
        y += vy;

        vx += ax;
        vy += ay;
      } else {
        dropped = false;
      }

      stroke(200, 50 + diameter);
      fill(150, 50 + diameter);
      ellipse(x, y, diameter, diameter);
    }
  }
}
