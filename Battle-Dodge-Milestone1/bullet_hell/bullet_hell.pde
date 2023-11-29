Button startButton;
Button homeButton;
Player player;

int bulletNum = 5;
int curScore = 0;
int highScore = 0;

Bullet[] bulletArray = new Bullet[bulletNum]; 

float distance;


PImage titleScreen;
PImage gameScreen;
PImage deathScreen;

int gamestate = 0;

void setup(){
 size(400,400);
 background(255);
 startButton = new Button(200,240,100,50,#ff004d,#ffa300);
 homeButton = new Button(100,340,100,50,#7E2553,#FF004D);
 player = new Player(5,10);
  for (int i = 0; i<bulletArray.length; i++){
    bulletArray[i] = new Bullet();
  }
 titleScreen = loadImage("titleScreen2.png");
 gameScreen = loadImage("gameScreen.gif");
 deathScreen = loadImage("deathScreen1.png");
}

void draw(){
  if (gamestate == 0){
    image(titleScreen, 0, 0,400,400);
    startButton.show();
  } else if (gamestate == 1){
    if (frameCount == 60){
      curScore += 1;
      frameCount = 0;
    }
    image(gameScreen, 0, 0,400,400);
    player.show();
    player.move();
    for (int i = 0; i<bulletArray.length; i++){  
      bulletArray[i].show();
      bulletArray[i].move();
    }
    fill(255);
    textSize(20);
    text("Score: "+curScore,20,20);
  } else if (gamestate == 2){
    image(deathScreen, 0, 0,400,400);
    homeButton.show();
  }
}

void mousePressed(){
  if (startButton.mouseOver == 1 && gamestate == 0){
    frameCount = 0;
    gamestate = 1;
    if (curScore > highScore){
      highScore = curScore;
    }
    curScore = 0;
  }
  if (homeButton.mouseOver == 1 && gamestate == 2){
    gamestate = 0;
  }
  print(mouseX+","+mouseY+",");
}

void keyPressed(){
  if(key == 'w') {
    player.goUp = true;
  }
  if(key == 's') {
    player.goDown = true;
  }
  if(key == 'a') {
    player.goLeft = true;
  }
  if(key == 'd') {
    player.goRight = true;
  }
}

//if a key is released, set the booleans correctly
void keyReleased(){
  if(key == 'w') {
    player.goUp = false;
  }
  if(key == 's') {
    player.goDown = false;
  }
  if(key == 'a') {
    player.goLeft = false;
  }
  if(key == 'd') {
    player.goRight = false;
  }
}
