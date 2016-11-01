float x;
float bX;
float bY;
int score;
boolean fired;
int invaders = 3;
invader [] ufo  = new invader[invaders];
float [] invaderX= new float [invaders]; 
float invaderY; 
boolean loose;

void setup(){
 size(640, 480); 
 x = width/2;
 score= 0;
 rectMode(CENTER);
 loose= false;
 invaderY = 100;
 
 //instantiates the X coordinate of the invaders
 for (int i=1; i<invaders; i++){
   invaderX[i-1]= i*50; 
 }
 //instantiates the invaders
 for (int i=0; i<invaders; i++){
   ufo[i] = new invader (invaderX[i], invaderY, width);
 }
}

void draw(){
  //detects if the player has lost yet, if not, it exicutes the bulk of the code
  if (loose== false){
    background(0);
    text("SCORE: "+score, 20,20);
    rect(x, height, 100, 50);
    for (int i=0; i<invaders; i++){
      ufo[i].update();
      ufo[i].detection(bX, bY);
    }
    //controles the player's ability to fire a bullet
    if (fired==true){
       rect(bX-10, bY, 20, 20);
       bY-=5;
       if (bY<0)
          fired=false;
     }
     
    //locks the player's paddle/tank inside of the screen
    if (x-50<0)
      x=50;
    if (x>width-50)
      x=width-50;
      
    //detects if the player has pressed left, right, A or D and moves paddle accirdingly  
    if (keyPressed){
      if (key=='a'){
        x-=3;
      }
      if (key=='d'){
        x+=3;
      }
      if (keyCode == LEFT){
        x-=3;
         }
      if (keyCode == RIGHT){
        x+=3;
      }   
    }
    //detects the palyer's input to fire their weapon
    if (keyPressed){
         if (keyCode == SHIFT){
           print("pew");
           if (fired==false){
             fired = true;
             bX=x;
             bY=height-50;
           }
         }
     }
  }
  //detects if the player has 'lost' and skips the main body of the program, 
  //displaying the player's final score and a game over message
  if (loose == true){
    background(0);
    text("GAME OVER /n YOUR SCORE"+score, width/2, height/2);
  }
}