int test = 10;

PImage moneyImage;
Money[] moneyList;
int moneyListIndex = 0;

Button loveButton;



void setup () {
  size(900, 900);
  randomSeed(15251);

  moneyImage = loadImage("money.png");
  
  // initialize a bunch of money
  moneyList = new Money[500];
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i] = new Money();
  }

  loveButton = new Button(450, 450, 100);

}


void dropMoney (int amount) {

  for (int i = 0; i < amount; i++) {
    moneyList[moneyListIndex].drop();
    moneyListIndex++;
    moneyListIndex = moneyListIndex == moneyList.length ? 0 : moneyListIndex;
  }
  
}


void draw () {
  background(20);

  test--;
  if (test < 0) {
    test = 15;
    dropMoney(3);
  }


  // draw the money
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i].draw();
  }

  loveButton.draw();
}