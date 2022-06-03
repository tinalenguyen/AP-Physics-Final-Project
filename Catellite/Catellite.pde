CatRocket cat;
Planet planets[];
int level;
PImage earthPlanet;
PImage catRocket;
PImage orbit;
int initialVelocity;

void setup(){
    size(1080, 800);
    background(0);
    level = 0;
    initialVelocity = 15;
    cat = new CatRocket();
    planets = new Planet[3];
    
    earthPlanet = loadImage("earth.png");  
    earthPlanet.resize(200, 190);
    catRocket = loadImage("catrocket.png");
    catRocket.resize(50, 50);
    
     
    planets[0] = new Earth();
}

 void draw(){
 
    image(earthPlanet, height/2, 300);
    image(catRocket, (height/2) + 70, 260);
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
