class Player{
  boolean moveUp;
  boolean moveDown;
  boolean moveLeft;
  boolean moveRight;
  float speed; //player speed
  float size; //player size
  PVector position; //player position
  
  Player(float sp, float sz){
    speed = sp;
    size = sz;
    position = new PVector(width/2, height/2); //starts player sprite at middle of screen
  }
  
  void show(){
      fill(255);
      circle(position.x, position.y, size);
    for (int i = 0; i<bulletArray.size(); i++){ //detects bullet collision
      Bullet curBul = bulletArray.get(i);
      
      if (dist(position.x, position.y, curBul.position.x, curBul.position.y)< 15){ //SKILL 6 - dist() //SKILL 40 - Find the direction and distance between two points
        gamestate[0] = 2;
        position.x = 200;
        position.y = 260;
        curBul.position.x = 400;
        if (curScore>highScore){ //manages current score (if the current score is higher than high score, replaces it)
         highScore = curScore; 
        }
      }
    }
  }
  
  void move(){ //move player sprite
    if(moveUp == true){
      position.y -= speed;
    }
    if(moveDown == true){
      position.y = position.y + speed;
    }
    if(moveLeft == true){
      position.x = position.x - speed;
    }
    if(moveRight == true){
      position.x = position.x + speed;
    }
    position.y = constrain(position.y, 142+size, 390-size); //keeps player srite in playable area
    position.x = constrain(position.x, 10+size, 390-size);
  }
}
