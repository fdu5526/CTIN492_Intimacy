Money[] balls;
int test = 10;


Money[] moneyList;
int moneyListIndex = 0;



void setup () {
  size(900, 900);
  randomSeed(15251);
  
  // initialize a bunch of money
  moneyList = new Money[500];
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i] = new Money(50);
  }

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
    test = 5;
    dropMoney(5);
  }


  // draw the money
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i].draw();
  }
}