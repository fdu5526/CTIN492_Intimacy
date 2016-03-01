Ball[] balls;
Leg[] legs;
int past_second = -1;
PImage leg_img;




void setup() {
  size(600, 600);
  randomSeed(15251);
  initialize_balls();
  leg_img = loadImage("leg.png");
  initialize_legs();
  set_to_current_time();
  
}

/**
 * initializes the clock to current time
 */
void set_to_current_time()
{
  int minute_passed = 60*hour() + minute();
  for(int i = 0; i < minute_passed; i++)
  {
    int r = (int)random(0,720);
    Ball random_ball = balls[r];
    
    // select a ball that hasnt already fallen
    while(random_ball.speed != 0.0)
    {
      r = (int)random(0,720);
      random_ball = balls[r];
    }

    random_ball.drop();
  }
}


/**
 * draw the gradient for the background
 */
void draw_background(){

  for(int i = 0; i < height; i++)
  {
    stroke(100-i/7, 50-i/12, 70-i/10);
    line(0, i, width, i);
  }
}

void draw() {
  draw_background();

  // resets the clock every 12 hours
  if(hour() % 12 == 0 && minute() % 60 == 0 && millis() % 1000.0 < 100.0)
  {
    initialize_balls();
    initialize_legs();
  }

  // selects random ball to drop every minute
  if(second() == 0 && past_second != second())
  {
    int r = (int)random(0,720);
    Ball random_ball = balls[r];
    
    // select a ball that hasnt already fallen
    while(random_ball.speed != 0.0)
    {
      r = (int)random(0,720);
      random_ball = balls[r];
    }
    random_ball.drop();
  }
  past_second = second();

  // draw the balls
  for(int i = 0; i < balls.length; i++)
  {
    Ball b = balls[i];
    b.draw_ball();
  }

  // draw the legs
  for(int i = 0; i < legs.length; i++)
  {
    Leg l = legs[i];
    l.draw_leg();
  }
}
