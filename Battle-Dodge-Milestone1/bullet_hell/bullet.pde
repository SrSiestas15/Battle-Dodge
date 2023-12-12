class Bullet{
  float speedX = random(2,6); //speed the position will move at based on keyboard input
  float speedY = random(2,6); //speed the position will move at based on keyboard input
  PVector position; //bullet position //SKILL 38 - Use PVector class
  int side = 0; //which side of game area the bullet will come from
  int min = -2; //fastest negative speed
  int max = 2; //fastest positive speed
  float newSpeed;
  
  Bullet(){ //SKILL 28 - constructor function
    position = new PVector(random(390,400), random(390,400)); //SKILL 39 - Basic position with vector //SKILL 41 - random 2D vector
  }
  
  //draw a circle at the bullet's position
  void show(){
    fill(#FFEC27);
    circle(position.x, position.y, 10);
  }
  
  void move(){
   position.x += speedX;
   position.y += speedY;
   if (position.x > 390 || position.x < 10 || position.y > 385 || position.y < 142){ //resets bullet position if enters off-game area
     side = int(random(1,5)); //randomizes what side the bullet will come from and randomizes X and Y speed appropriately
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
  
  float randAny(){ //SKILL 21 - Declare & call a function with a return type
   newSpeed = random(-max,max);
   return newSpeed;
  }
}
