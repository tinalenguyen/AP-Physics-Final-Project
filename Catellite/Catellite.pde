CatRocket cat;
Planet planets[]; //why is this an array?
int level;
PImage earthPlanet;
PImage catRocket;
PImage orbit;
int initialVelocity;
int stage; //has it started to move sideways yet

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
}

 void draw(){
 
    image(earthPlanet, height/2, 300); //should this be in setup?
    image(catRocket, cat.getX(), cat.getY());
    
    ////TEST/////
    if (cat.getD(planets[0])> height/2 - 200 && stage == 1) //planets is weird AND we need orbit height here
       stage = 2;
       
    if (stage == 1)
      cat.setY(cat.getY() - 1);//initialVelocity is too fast, need to adjust pixels and meters
    else if (stage == 2){
      //if some condition for sideways boost to happen. Maybe mousepressed or some velocity limit
        //SIDEWAYS BOOST
      //else stage = 3; 
    }
    else
      //just move with velocity, need to include gravity I guess
      
      
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
