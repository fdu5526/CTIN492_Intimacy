import ddf.minim.*;

int test = 0;

PImage moneyImage;
Money[] moneyList;
int moneyListIndex = 0;

int playerMoney = 500;

Button loveButton;

PImage[] merchandiseImages;
ArrayList<Merchandise> merchandiseList;

Minim minim;
AudioPlayer[] moneySounds;
AudioPlayer dingSound, wrongSound, blubSound;

void setup () {
  frameRate(30);
  size(900, 900);
  randomSeed(15251);
  minim = new Minim (this);
  blubSound = minim.loadFile("blub1.mp3");
  dingSound = minim.loadFile("ding.mp3");
  wrongSound = minim.loadFile("wrong.mp3");
  moneySounds = new AudioPlayer[10];
  for (int i = 0; i < moneySounds.length; i++) {
    moneySounds[i] = minim.loadFile("cash.mp3");
  }

  moneyImage = loadImage("money.png");
  
  // initialize a bunch of money
  moneyList = new Money[300];
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i] = new Money();
  }

  // initialize other visual elements
  loveButton = new Button(450, 450, 100);
  merchandiseList = new ArrayList<Merchandise>();

  merchandiseImages = new PImage[21];
  for (int i = 0; i < merchandiseImages.length; i++) {
    merchandiseImages[i] = loadImage("merchandise" + i + ".jpg");
  }
}


void draw () {
  background(20);

  // temp timer
  test--;
  if (test < 0) {
    test = 100;
    addMerchandise();
  }

  // draw the button
  loveButton.draw();
  tint(255,255,255);

  // draw the money
  for (int i = 0; i < moneyList.length; i++) {
    moneyList[i].draw();
  }

  // draw all the merchandises
  for (int i = 0; i < merchandiseList.size(); i++) {
    merchandiseList.get(i).draw();
  }

  // draw money count
  textSize(80);
  fill(0, 255, 0);
  text("$" + playerMoney, 50, 100);
}


void mousePressed () {
  loveButton.pressed();
}

void mouseReleased () {
  boolean moneyButton = loveButton.released();
  if (moneyButton) {
    int amount = (int)random(75, 125);
    dropMoney(amount);
  }
}


void mouseClicked () {


  // check click the merchandises
  boolean boughtSomething = false;
  for (int i = merchandiseList.size() - 1; i >= 0; i--) {
    boolean b = merchandiseList.get(i).checkClickedOn();
    if (b) {
      boughtSomething = true;
      merchandiseList.get(i).bought = true;
      playerMoney -= merchandiseList.get(i).moneyValue;
      dingSound.cue(0);
      dingSound.play();
      break;
    }
  }
}





void playMoneySound () {
  AudioPlayer a = moneySounds[(int)random(0,moneySounds.length)];
  a.cue(0);
  a.play();
}


// drop amount of money
void dropMoney (int amount) {

  for (int i = 0; i < amount; i++) {
    moneyList[moneyListIndex].drop();
    moneyListIndex++;
    moneyListIndex = moneyListIndex == moneyList.length ? 0 : moneyListIndex;
  }
}

// spawn a merchanise
void addMerchandise () {
  int x = (int)random(-100, -50);
  int y = (int)random(width - 300, width - 100);
  int v = (int)random(50, 200);

  Merchandise m = new Merchandise(x, y, v);
  merchandiseList.add(m);
}

// offscreen merchanise, remove it
void removeMerchandise (Merchandise m) {
  merchandiseList.remove(m);
}