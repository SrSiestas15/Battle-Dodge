class Bullet{
  float speedX = random(2,6); //speed the position will move at based on keyboard input
  float speedY = random(2,6); //speed the position will move at based on keyboard input
  PVector position; //bullet position
  int side = 0;
  int reset = 0;
  
  Bullet(){
    position = new PVector(width/2, height/2);
    position.x = 400;
  }
  
  //draw a square at the player's position
  void show(){
    fill(#FFEC27);
    circle(position.x, position.y, 10);
  }
  
  //if a key is currently down, change the player's position
  void move(){
   position.x += speedX;
   position.y += speedY;
   
   if (position.x > 390 || position.x < 10 || position.y > 385 || position.y < 142){
     side = int(random(1,5));
     if (side == 1){
      position.x = 10;
      position.y = random(142,385);
      speedX = random(1,6);
      speedY = random(-6,6);
     } else if (side == 2){
      position.x = random(10,390);
      position.y = 142;
      speedX = random(-6,6);
      speedY = random(1,6);
     } else if (side == 3){
      position.x = 390;
      position.y = random(142,385);
      speedX = random(-6,-1);
      speedY = random(-6,6);
     } else if (side == 4){
      position.x = random(10,390);
      position.y = 385;
      speedX = random(-6,6);
      speedY = random(-6,-1);
     }
   }
  }
}
