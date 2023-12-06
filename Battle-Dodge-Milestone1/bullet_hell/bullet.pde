class Bullet{
  float speedX = random(2,6); //speed the position will move at based on keyboard input
  float speedY = random(2,6); //speed the position will move at based on keyboard input
  PVector position; //bullet position
  int side = 0;
  int reset = 0;
  int min = -2;
  int max = 2;
  float newSpeed;
  
  Bullet(){
    position = new PVector(random(390,400), random(390,400));
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
      speedX = random(1,max);
      speedY = randAny();
     } else if (side == 2){
      position.x = random(10,390);
      position.y = 142;
      speedX = randAny();
      speedY = random(1,max);
     } else if (side == 3){
      position.x = 390;
      position.y = random(142,385);
      speedX = random(-max,-1);
      speedY = randAny();
     } else if (side == 4){
      position.x = random(10,390);
      position.y = 385;
      speedX = randAny();
      speedY = random(-max,-1);
     }
   }
  }
  
  float randAny(){
   newSpeed = random(-max,max);
   return newSpeed;
  }
}
