class Money {
  int x, y;
  float vx, vy, ax, ay;
  boolean dropped;
  float theta;
  float dTheta;

  Money () {
    this.x = 0;
    this.y = 0;
    
    vx = 0.0;
    vy = 0.0;
    ax = 0.0;
    ay = 0.0;
    dropped = false;
    theta = random(-0.5, 0.5);
    dTheta = random(0.01, 0.03);
    dTheta = random(0f, 1f) > 0.5f ? dTheta : -dTheta;
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
      if (y < height + 100) {
        x += vx;
        y += vy;
        vx += ax;
        vy += ay;
        theta += dTheta;
      } else {
        playerMoney++;
        dropped = false;
      }

      pushMatrix();
        translate(x, y);
        rotate(theta);
        image(moneyImage, 0, 0);
      popMatrix();
    }
  }
}
