CatRocket cat;
Planet planetS;
PShape earth;

void setup(){
    size(1080, 800);
    background(0);
    cat = new CatRocket();
    planetS = new Planet[3];
    
  //  earth = loadShape("earth.svg");    
  
    planets[0] = earth;
  
}

 void draw(){
    if (level==0){
      //display earth
    }
   
 }
