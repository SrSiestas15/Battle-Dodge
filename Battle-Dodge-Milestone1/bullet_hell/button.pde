class Button{
  float xPosition;
  float yPosition;
  float bLength;
  float bHeight;
  
  color colourOff;
  color colourOn;
  
  String message;
  
  int mouseOver = 0;
  
  Button(float x, float y, float l, float h, color c1, color c2, String m){ //SKILL 30 - Write a constructor function with parameters

    xPosition = x;
    yPosition = y;
    bLength = l;
    bHeight = h;
    colourOff = c1;
    colourOn = c2;
    message = m;
  }
  
  void show(){
   noStroke();
   rectMode(CENTER); //SKILL 3 - Mode: CENTER
   textAlign(CENTER,CENTER);
   if (mouseX > xPosition-bLength/2 && mouseX < xPosition+(bLength/2) && mouseY > yPosition-bHeight/2 && mouseY < yPosition+(bHeight/2)){
     fill(colourOn);
     mouseOver = 1;
   } else {
     fill(colourOff);
     mouseOver = 0;
   }
   rect(xPosition,yPosition,bLength,bHeight); //SKILL 1 - rect()
   fill(255);
   textFont(gothic);
   textSize(30);
   text(message,xPosition,yPosition);
       
  }
}
