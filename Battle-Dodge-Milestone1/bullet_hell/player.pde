class Player{
  boolean goUp; //is the up key currently being pressed?
  boolean goDown; //is the down key currently being pressed?
  boolean goLeft; //is the left key currently being pressed?
  boolean goRight; //is the right key currently being pressed?
  float speed; //speed the position will move at based on keyboard input
  float size;
  PVector position; //player position
  
  Player(float sp, float sz){
    speed = sp;
    size = sz;
    position = new PVector(width/2, height/2);
  }
  
  //draw a square at the player's position
  void show(){
    fill(255);
    circle(position.x, position.y, size);
  }
  
  //if a key is currently down, change the player's position
  void move(){
    
    if(goUp == true){
      position.y -= speed;
    }
    if(goDown == true){
      position.y = position.y + speed;
    }
    if(goLeft == true){
      position.x = position.x - speed;
    }
    if(goRight == true){
      position.x = position.x + speed;
    }
    position.y = constrain(position.y, 142+size, 390-size);
    position.x = constrain(position.x, 10+size, 390-size);
  }
}
