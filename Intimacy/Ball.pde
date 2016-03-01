class Ball{
  int x, y, diameter, stop_point;
  float speed, acceleration;
  int dx, dy, dd;

  Ball(int a, int b, int d)
  {
    x = a;
    y = b;
    diameter = d;
    speed = 0.0;
    acceleration = 0.0;
    stop_point = (int)random(-30, 30);
    dx = (int)random(-3,3);
    dy = (int)random(-3,3);

    // delta diameter
    dd = (int)random(5,15);
    if(random(-1,1) < 0.0)
      dd *= -1.0;
  }

  /**
   * drops the ball
   */
  void drop()
  {
    acceleration = 0.9;
  }

  void draw_ball()
  {
    // make the ball fall
    if(y < height - 40 + stop_point || (speed < 0.0))
    {
      y += speed;
      speed += acceleration;
    }
    else if(abs(speed) > 3.5)
      speed *= -0.4;

    float percent = (millis() % 1000.0)/1000.0;
    if(percent > 0.5)
      percent = 1.0 - percent;

    stroke(200, 50 + diameter);
    fill(20, 50 + diameter);
    ellipse(x+percent*dx, y+percent*dy, diameter+percent*dd, diameter+percent*dd);
  }
}
