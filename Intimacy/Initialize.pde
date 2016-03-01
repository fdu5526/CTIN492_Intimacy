
/**
 * allocate the ball objects
 */
void initialize_balls(){
  balls = new Ball[720];
  int i = 0;
  while(i < balls.length)
  {
    int x = 0;
    int y = 20;
    while((x < width/2 && y > 2*x/3 + random(-10,10)) || 
          (x > width/2 && y > 2*(width - x)/3 + random(-10,10))
          )
    {
      x = (int)random(20, width-20);
      y = (int)random(5, height/3);
    }

    int s = (int)random(20, 50);

    balls[i] = new Ball(x, y, s);
    i++;
  }
}

/**
 * allocate the leg objects
 */
void initialize_legs()
{
  legs = new Leg[20];
  for(int i = 0; i < legs.length; i++)
  {
    Ball b = balls[(int)random(0,720)];
    while(!(b.x < 200 || b.x > 300))
      b = balls[(int)random(0,720)];

    legs[i] = new Leg(b);
  }

}