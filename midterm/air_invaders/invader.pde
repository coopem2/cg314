float invX;
float invY;
boolean hit;
float hitX, hitY;
float move;
float flippoint;
boolean flip;


class invader{
  invader(float tX, float tY, float tScreen){
      invX=tX;
      invY=tY;
      rectMode(CENTER);
      noStroke();
      hit = false;
      flippoint = tScreen;
      flip= false;
  }
 void update(){
   //draws the invader if it has not been hit
   if (hit == false){
     fill (255);
     rect (invX, invY, 50, 50);
     fill (0);
     rect (invX-14, invY-10, 15,15);
     rect (invX+14, invY-10, 15,15);
     rect (invX, invY+10, 30,10);
     rect (invX*.8, invY*1.2, 10,10);
     rect (invX*1.2, invY*1.2, 10,10);
     fill (255);
     rect (invX, invY-14, 25,10);
     
     //flips the direction and forces the invader down when it hits the edge
     if (flip == false)
       invX++;
     if (flip == true)
       invX--;
     if (invX>flippoint){
        flip = true;
        invY+=50;
     }
     if (invX<0){
       flip = false;
       invY+=50;
     }
   }
 }
 //detects when the invader is shot, or reaches the bottom of the screen
 void detection(float TMPhitX, float TMPhitY){
   hitX= TMPhitX;
   hitY= TMPhitY;
   
   //detects if the invader is hit, and changes the display varriable
   if (hitX+25>invX && hitX-50< invX && hitY+30>invY && hitY-40<invY){
     hit= true;
     score ++;
   }
   //detects if the invader hits the bottom of the screen and triggers game over state
   if (invY>=height-50){
     loose = true;
   }
   
 }
}