CatRocket cat;
Planet planets[];
int level;
PImage earthPlanet;
PImage catRocket;

void setup(){
    size(1080, 800);
    background(0);
    cat = new CatRocket();
    planets = new Planet[3];
    
    earthPlanet = loadImage("earth.png");  
    earthPlanet.resize(250, 225);
    catRocket = loadImage("catrocket.png");
    catRocket.resize(75, 75);
    
    planets[0] = new Earth();
}

 void draw(){
 
    image(earthPlanet, height/2, 300);
    image(catRocket, (height/2) + 90, 234);
   
 }
