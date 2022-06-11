//VERY IMPORTANT: fix issues with where planet is placed. affects px and py in catrocket which is important

CatRocket cat;
Planet planets[]; //why is this an array?
int level;
PImage earthPlanet;
PImage catRocket;
PImage orbit;
int initialVelocity;
double ax; //x component of acceleration
double ay; //y component of acceleratoin
int stage; //has it started to move sideways yet
int frate;
double tv;
Vector v;  //new Vector(0,0); always causes stackoverflow.... whyyyy


void setup(){
    size(1080, 800);
    background(0);
    level = 0;
    initialVelocity = 15;
    cat = new CatRocket(448648, (height/2)+70, 260);
    planets = new Planet[3];
    stage = 1;
    
    earthPlanet = loadImage("earth.png");  
    earthPlanet.resize(200, 190);
    catRocket = loadImage("catrocket.png");
    catRocket.resize(50, 50);
     
    planets[0] = new Earth();
    
    frate = 20;
    frameRate(frate);
    
    tv = 10; //tangential velocity for testing, should be determined in phase 2, this is how we got 8 later
    
    v = new Vector(0,0);
}

 void draw(){
 
    image(earthPlanet, height/2, 300); //should this be in setup? ALSO why are height/width swapped...
    //image(earthPlanet, width/2-100, height/2-95); centered
    image(catRocket, (float)cat.getX(), (float)cat.getY());
    
    ////TEST/////
    if (cat.getD(planets[0])> height/2 - 200 && stage == 1) //planets is weird AND we need orbit height here
       stage = 2;
       
    if (stage == 1)
      cat.setY(cat.getY() - 1);//initialVelocity is too fast, need to adjust pixels and meters
    else if (stage == 2){
      //VERY TEMP
      //v.add(new Vector(tv,0));  //causes stack overflow error
      v.setX(tv);
      stage = 3;
      //VERY TEMP END
      
      //if some condition for sideways boost to happen. Maybe mousepressed or some velocity limit
        //SIDEWAYS BOOST
        //SIDEWAYS BOOS WILL SET THE TANGENTIAL VELOCITY??
      //else stage = 3; this is onbly if there is some extended condition. If just one time thing move within the last if
    }
    else{ //STAGE 3
      //v.add(new Vector(0,1)); //based off gravity/frate (so in one second accelerates 9.8) TEST IS 8
      //cat.setY(cat.getY());
      //cat.setX(cat.getX()+1);
      //Math.abs(cat.getX()-width/2); //x component of distance
      ay = -8*(cat.getY()-height/2)/cat.getD(planets[0]); //acceleration(c) * y component of distance / distance <== ratio
      ax = -8*(cat.getX()-width/2)/cat.getD(planets[0]);
//      v.add(new Vector(ax,ay).divide(frate)); //add the velocity to v
      v.setX(v.getX()+ax/frate);
      v.setY(v.getY()+ay/frate);
      cat.setY(cat.getY()+v.getY());
      cat.setX(cat.getX()+v.getX());
    }
      //just move with velocity, need to include gravity I guess
      //NOTE: NEED TO MAKE VELOCITY A VECTOR AND THEN MOVE THROUGH VECTOR ADDITION, MAYBE INSTINTANEOUS? quantity is weird
      
      
    ////ENDTEST////
    
    //image(catRocket, (height/2) + 70, 260);
    noFill();
    stroke(#EA88FA);
    ellipse(height/2 + 150, 400, 730, 450);
    fill(#EA88FA);
    // LAUNCH BUTTON
    rect(845, 733, 235, 67);
    // VELOCITY  BUTTON
    rect(0, 710, 350, 90);
    
    // TEXTS
    fill(0);
    textSize(40);
    text("Launch", 900, 780);
    text("-", 30, 767);
    text(initialVelocity, 90, 765);
    text("km/s", 160, 765);
    text("+",  290,  765);
      
  
    
  //  if (mousePressed) print(mouseX + "," + mouseY + "!");
 }
 
 void mousePressed(){
   if (mouseX < 81 && mouseX>0 && mouseY < 1080 && mouseY > 710){
     initialVelocity--;
   }
   if (mouseX < 350 && mouseX > 280 && mouseY < 1080 && mouseY > 710){
     initialVelocity++;
   }
   
 }
