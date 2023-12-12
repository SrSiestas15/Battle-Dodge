/* Object Oriented Game 
 --Battle Dodge--
 By James Munoz Sevillano
 survive agaisnt the onslaught of bullets
 
 some of the code was ellaborated upon from the object-oriented toy project */

Button startButton;
Button tryButton;
Button homeButton;

Player player;
PFont gothic;
PFont pixelFont;

int bulletNum = 5; //SKILL 10 - Global variable
int curScore = 0;
int highScore = 0;
int level = 0;
int addedBullet;

color glow;

ArrayList<Bullet> bulletArray = new ArrayList<Bullet>(); //SKILL 34 - Initialize arrayList
int[] gamestate = new int[1]; //SKILL 33 - initalize array

float distance;
boolean dead = false;

PImage titleScreen;
PImage gameScreen;
PImage deathScreen;
PImage winScreen;


void setup(){ //SKILL 4 - setup()
 size(400,400);
 background(255); //SKILL 5 - background();
 gothic = createFont("gothicFont.ttf",10);
 pixelFont = createFont("Minecraft.ttf",10);
 startButton = new Button(200,240,100,50,#ff004d,#ffa300, "Start"); //SKILL 29 - Use the keyword new to instantiate an object
 tryButton = new Button(100,340,155,50,#7E2553,#FF004D, "Try Again");
 homeButton = new Button(300,340,155,50,#7E2553,#FF004D, "Home");
 player = new Player(5,10);
  for (int i = 0; i<6; i++){ //SKILL 16 - for loop
    bulletArray.add(new Bullet()); //SKILL 35 -  Manage a set of objects with an ArrayList
  }
 gamestate[0]= 0;
 titleScreen = loadImage("titleScreen2.png");
 gameScreen = loadImage("gameScreen.gif");
 deathScreen = loadImage("deathScreen1.png");
 winScreen = loadImage("winScreen.png");
}

void draw(){
  switch (gamestate[0]){ //SKILL 15 - switch statement
    case 0: //main menu screen
      image(titleScreen, 0, 0,400,400);
      startButton.show();
      shine1();
      break; //SKILL 18 - break
    case 2: //game over screen
      image(deathScreen, 0, 0,400,400);
      textAlign(CENTER);
      fill(255); //SKILL 2 - fill()
      text("Score " +curScore,120,220);
      text("High Score " + highScore,120,250);
      tryButton.show();
      homeButton.show();
      shine2();
      break;
    case 3: //victory screen
      image(winScreen, 0, 0,400,400);
  }
  
   while(gamestate[0] == 1){ //main gameplay loop
     image(gameScreen, 0, 0,400,400); 
     for (int i = 0; i<bulletArray.size(); i++){ //SKILL 9 - local variable (i) //SKILL 17 - nested loop //SKILL 36 -  Use an ArrayList method: size()
        Bullet curBul = bulletArray.get(i);
        curBul.show();
        curBul.move();
      }
      if (frameCount == 60){ //SKILL 12 - conditional statement //SKILL 13 - boolean expression
        curScore += 1;
        frameCount = 0;
      }
      player.show();
      player.move();
      monText();
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text("Score "+curScore,20,30);
      if (curScore>99){
       gamestate[0] = 3; 
      }
      break;
   }
}

void mousePressed(){ //SKILL 7 - mousePressed()
  if (startButton.mouseOver == 1 && gamestate[0] == 0){ //SKILL 14 - logical operator
    println("to main game"); //SKILL 11 - println()
    player.speed = 5;
    dead = false;
    curScore = 0;
    frameCount = 0;
    gamestate[0] = 1;
    if (curScore > highScore){
      highScore = curScore;
    }
    for (int i = 0; i<addedBullet+1; i++){ //SKILL 8 - increment operator ++
      bulletArray.remove(i);
    } addedBullet = 0;
  }
  if (homeButton.mouseOver == 1 && gamestate[0] == 2){
    println("back to home menu");
    gamestate[0] = 0;
  } if (tryButton.mouseOver == 1 && gamestate[0] == 2){
    println("replay");
    dead = false;
    frameCount = 0;
    curScore = 0;
    gamestate[0] = 1;
    player.speed = 5;
  }
  print(mouseX+","+mouseY+",");
}

//player movement
void keyPressed(){
  if(key == 'w') {
    player.moveUp = true;
  }
  if(key == 's') {
    player.moveDown = true;
  }
  if(key == 'a') {
    player.moveLeft = true;
  }
  if(key == 'd') {
    player.moveRight = true;
  }
}

//if a key is released, set the variables correctly
void keyReleased(){
  if(key == 'w') {
    player.moveUp = false;
  }
  if(key == 's') {
    player.moveDown = false;
  }
  if(key == 'a') {
    player.moveLeft = false;
  }
  if(key == 'd') {
    player.moveRight = false;
  }
}

void monText(){ //displays and changes the text said by monster
  for (int i = 0; i<bulletArray.size(); i++){
        Bullet curBul = bulletArray.get(i);
        curBul.max = 2;
        curBul.min = -2;
    }
  textAlign(LEFT,TOP);
  textFont(pixelFont);
  textSize(17);
  fill(0);
  checkLevel(curScore);
  if (curScore<10){
    text("Hello",294,13);
    text("there...",294,33);
    text("Move with",294,53);
    text("the WASD",294,73);
    text("keys.",294,90);
  } else if (curScore<30){
    text("You're not",294,13);
    text("bad...",294,33);
    text("You're on",294,53);
    text("level "+level+"!",294,73);
    text("Try going",294,90);
    text("for 10...",294,110);
  } else if (curScore<40){
    text("Level "+level+"!",294,13);
    text("let's make",294,33);
    text("this harder.",294,53);
    text("Faster",294,73);
    text("bullets!!!",294,90);
    for (int i = 0; i<bulletArray.size(); i++){
        Bullet curBul = bulletArray.get(i);
        curBul.max = 3;
        curBul.min = -3;
    }} else if (curScore<70){
    text("Back to a",294,13);
    text("normal",294,33);
    text("speed. But",294,53);
    text("let's speed ",294,73);
    text("YOU up...",294,90);
    speedUp(player);
  } else{
    player.speed = 5;
    text("Mhmmmm...",294,13);
    text("Very well.",294,33);
    text("You were",294,53);
    text("a strong",294,73);
    text("foe...",294,90);
  }
}

//stars shining in title screen
void shine1(){ //SKILL 20 - Declare & call a function with no parameters and no return type
  fill(#FFE75D,50);
  circle(20,220,sin(frameCount/8)+20);
  circle(64,170,sin(frameCount/8)+20);
  circle(342,167,cos(frameCount/8)+20);
  circle(354,266,sin(frameCount/8)+20);
  circle(376,21,cos(frameCount/8)+20);
}

//stars shining in game over screen
void shine2(){
  fill(#FFE75D,50);
  circle(193,195,sin(frameCount/8)+20);
  circle(67,196,sin(frameCount/8)+20);
  circle(309,129,cos(frameCount/8)+20);
}

void checkLevel(int i){ //SKILL 23 - pass by copy (value)
  i /= 10;
  level = i;
}

void speedUp(Player pl){ //SKILL 24 - pass by reference (object)
  pl.speed += .011;
}
