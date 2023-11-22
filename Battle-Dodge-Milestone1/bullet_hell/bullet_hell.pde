Button startButton;
Button homeButton;
Player player;

int bulletNum = 5;
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
 player = new Player(5,10);
  for (int i = 0; i<bulletNum; i++){
    bulletArray[i] = new Bullet();
  }
 titleScreen = loadImage("titleScreen.png");
 gameScreen = loadImage("gameScreen.gif");
 deathScreen = loadImage("deathScreen.png");
}

void draw(){
  if (gamestate == 0){
    image(titleScreen, 0, 0,400,400);
    startButton.show();
  } else if (gamestate == 1){
    image(gameScreen, 0, 0,400,400);
    player.show();
    player.move();
    for (int i = 0; i<bulletNum; i++){  
      bulletArray[i].show();
      bulletArray[i].move();
    }
  } else if (gamestate == 2){
    image(deathScreen, 0, 0,400,400);
  }
}

void mousePressed(){
  if (startButton.mouseOver == 1){
    gamestate = 1;
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
