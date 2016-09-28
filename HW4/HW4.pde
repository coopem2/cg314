boolean powered= false;
boolean grow= false;
boolean shrink= false;
boolean rdp=false; //red +
boolean rds=false; //red -
boolean blp=false; // blue +
boolean bls=false; // blue -
boolean grnp=false;// green +
boolean grns=false;// green-
float rd=100;
float bl=100;
float grn=100;
float weight=1;
float x,y;
float easing= 0.2;

boolean MAKE_ART= false;
PImage TAH_ART;

void setup(){
  TAH_ART=loadImage("1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg");
  size (640, 480);
  noStroke();
  stroke(255,255,255);
}

void draw(){
  fill (255,255,255);
  noStroke();
  float Tx = mouseX;// these are the rules for the
  float Ty = mouseY;// mouse smoothing effect.
  float Px = x;     //
  float Py = y;     //
  x+= (Tx-x)*easing;//
  y+= (Ty-y)*easing;//
  rect(0,0, 50, height);//            creates frame
  rect(0,0, width, 10);//             creates frame
  rect(width-20,0, width, height);//  creates frame
  rect(0,height-20, width, 20);//     creates frame
  fill (100,100,100);
  
  if (MAKE_ART==true){//detects if powered is on or off
      image(TAH_ART, 50, 10,width-50,height-10); 
      MAKE_ART=false;
      print("ding");
  }
  
  if (rdp==true){//detects if red button + is pressed
          rd=rd+15;
          rdp=false;
          stroke(rd,grn,bl);
  }
  if (rds==true){//detects if red button - is pressed
      if(rd<=15){
        rd=rd-15;
        rds=false;
        stroke(rd,grn,bl);
      }
      else{
        rd=0;
        rds=false;
        stroke(rd,grn,bl);
      }
  }
  
  if (grnp==true){//detects if green button + is pressed
          grn=grn+15;
          grnp=false;
          stroke(rd,grn,bl);
  }
  if (grns==true){//detects if green button - is pressed
      if(grn<=15){
        grn=grn-15;
        grns=false;
        stroke(rd,grn,bl);
      }
      else{
        grn=0;
        grns=false;
        stroke(rd,grn,bl);
      }
  }
  
  if (grnp==true){//detects if green button + is pressed
          grn=grn+15;
          grnp=false;
          stroke(rd,grn,bl);
  }
  if (grns==true){//detects if green button - is pressed
      if(grn>15){
        grn=grn-15;
        grns=false;
        stroke(rd,grn,bl);
      }
      else{
        bl=0;
        bls=false;
        stroke(rd,grn,bl);
      }
  }

  if (grow==true){//detects if grow is on or off
          weight++;
          grow=false;
  }
  if (shrink==true){//detects if grow is on or off
      if(weight>1){
        weight--;
        shrink=false;
      }
      else{
        weight=1;
        shrink=false;
      }
  }

  if (powered==true){//detects if powered is on or off
     stroke(rd,grn,bl);
  }
  else{
    fill (255,0,0);
    noStroke();
  }
  rect(20,20,20,20); //draws the button that denotes if the line is on or off
  fill (100,100,100);//resets the fill so the colors of other buttons are unneffected by powered
  
  if((mouseX>40 && mouseX<width-20)&& (mouseY>10 && mouseY<height-20)){//sets the boundries of the cavnas edges
    strokeWeight(weight);//sets the weight of the line to match the current adjustment
    line(x, y, Px, Py);
  }
  
  strokeWeight(1); //sets the stroke weight to 1 in order to make sure canvas/program dosent explode
  stroke(0,0,0);
  rect(20,50,20,20); rect(20,60,20,1); rect(30,50,1,20);//+ button
  rect(20,80,20,20); rect(20,90,20,1);//minus button
  fill (255,0,0);
  rect(20,110,20,10); rect(25,115,10,1); rect(30,110,1,10);//+ button for red 
  rect(20,130,20,10); rect(25,135,10,1);//                   minus button red
  fill (0, 255,0);
  rect(20,150,20,10); rect(25,155,10,1); rect(30,150,1,10);//+ button for green 
  rect(20,170,20,10); rect(25,175,10,1);//                   minus button green
  fill (0,0,255);
  rect(20,190,20,10); rect(25,195,10,1); rect(30,190,1,10);//+ button for blue 
  rect(20,210,20,10); rect(25,215,10,1);//                   minus button blue
  
  fill(100,100,100); rect(10,240,32,20); fill(255,255,255); text("ART", 15,255);
  
  
  
  fill(rd,grn,bl);
  rect(20,height-30,20,20);
  //println("ping");
}

void mouseClicked(){
  if ((mouseX> 10 && mouseX<32) && (mouseY>240 && mouseY <260)){ //detects if the mouse is within the dimensions of the box
    if (MAKE_ART== false){//checks to see if the toggle for powered is on or off
        MAKE_ART = true;//assigns on if powered is off
      }
    else{
        MAKE_ART = false;// assigns off if powered is on
      }
  }
  
  if ((mouseX> 40 && mouseX<width-20) && (mouseY>40 && mouseY <height-20)){ //detects if the mouse is within the dimensions of the box
    if (powered== false){//checks to see if the toggle for powered is on or off
        powered = true;//assigns on if powered is off
      }
    else{
        powered = false;// assigns off if powered is on
      }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>50 && mouseY <70)){ //detects if the mouse is within the dimensions of the box
      if (grow== false){//checks to see if the toggle for powered is on or off
        grow = true;
      }   
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>110 && mouseY <120)){ //detects if the mouse is within the dimensions of the box
      if (rdp== false){
        rdp = true;
        println("dong");
      }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>130 && mouseY <140)){ //detects if the mouse is within the dimensions of the box
     if (blp== false){
        blp = true;
        println("ding");
     }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>150 && mouseY <160)){ //detects if the mouse is within the dimensions of the box
      if (grnp== false){
        grnp = true;
        println("dong");
      }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>170 && mouseY <180)){ //detects if the mouse is within the dimensions of the box
     if (grns== false){
        grns = true;
        println("ding");
     }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>190 && mouseY <200)){ //detects if the mouse is within the dimensions of the box
     if (blp== false){
        blp = true;
        println("ding");
     }
  }
  if ((mouseX> 20 && mouseX<40) && (mouseY>210 && mouseY <220)){ //detects if the mouse is within the dimensions of the box
     if (bls== false){
        bls = true;
        println("ding");
     }
  }

}