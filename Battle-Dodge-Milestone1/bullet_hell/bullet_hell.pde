Button startButton;
Button tryButton;
Button homeButton;

Player player;
PFont gothic;

int bulletNum = 5;
int curScore = 0;
int highScore = 0;

color glow;

ArrayList<Bullet> bulletArray = new ArrayList<Bullet>();

//Bullet[] bulletArray = new Bullet[bulletNum]; 

float distance;
boolean dead = false;

PImage titleScreen;
PImage gameScreen;
PImage deathScreen;

int gamestate = 0;

void setup(){ 
 size(400,400);
 background(255);
 gothic = createFont("gothicFont.ttf",10);
 startButton = new Button(200,240,100,50,#ff004d,#ffa300, "Start");
 tryButton = new Button(100,340,155,50,#7E2553,#FF004D, "Try Again");
 homeButton = new Button(300,340,155,50,#7E2553,#FF004D, "Home");
 player = new Player(5,10);
  for (int i = 0; i<6; i++){
    bulletArray.add(new Bullet());
  }
 titleScreen = loadImage("titleScreen2.png");
 gameScreen = loadImage("gameScreen.gif");
 deathScreen = loadImage("deathScreen1.png");
}

void draw(){
  switch (gamestate){
    case 0:
      image(titleScreen, 0, 0,400,400);
      startButton.show();
      break;
    case 2:
      image(deathScreen, 0, 0,400,400);
      textAlign(CENTER);
      text("Score " +curScore,120,220);
      text("High Score " + highScore,120,250);
      tryButton.show();
      homeButton.show();
      break;
  }
  
   while(gamestate == 1){
     image(gameScreen, 0, 0,400,400); 
     for (int i = 0; i<bulletArray.size(); i++){
        Bullet curBul = bulletArray.get(i);
        curBul.show();
        curBul.move();
      }
      if (frameCount == 60){
        curScore += 1;
        frameCount = 0;
      }
      player.show();
      player.move();
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text("Score "+curScore,20,30);
      break;
   }
}

void mousePressed(){
  if (gamestate == 1){
    bulletArray.add(new Bullet()); //adds a new bullet when clicking during main game (for bugtesting)
  }
  if (startButton.mouseOver == 1 && gamestate == 0){
    println("to main game");
    dead = false;
    curScore = 0;
    frameCount = 0;
    gamestate = 1;
    if (curScore > highScore){
      highScore = curScore;
    }
  }
  if (homeButton.mouseOver == 1 && gamestate == 2){
    println("back to home menu");
    gamestate = 0;
  } if (tryButton.mouseOver == 1 && gamestate == 2){
    println("replay");
    dead = false;
    frameCount = 0;
    curScore = 0;
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
