class Leg{
  float direction;
  float theta, leg_scale, dtheta;
  Ball ball;

  Leg(Ball ba)
  {
    ball = ba;
    leg_scale = random(0.8, 1.2);
    theta = random(-0.5, 0.5);
     
    direction = 1.0;
    if(random(-1,1) < 0.0)
      direction *= -1;
  }

  void draw_leg()
  {
    pushMatrix();
    
    float percent = (millis() % 1000.0)/1000.0;
    if(percent > 0.5)
      percent = 1.0 - percent;

    translate(ball.x, ball.y);

    if(ball.x > width/2)
      scale(-leg_scale,leg_scale);
    else
      scale(leg_scale,leg_scale);

    if(0.0 < ball.speed && ball.speed < 0.1)
      percent = 1.0 + 0.03*percent;

    float on_ground = 0.0;
    float speed = 1.0;
    if(ball.acceleration != 0.0)
    {
      on_ground = 0.006*ball.y;
      speed = ball.speed;
    }

    rotate(theta+percent*0.09*(direction*speed)+on_ground);

    image(leg_img, 0, 0);

    popMatrix();
  }
}