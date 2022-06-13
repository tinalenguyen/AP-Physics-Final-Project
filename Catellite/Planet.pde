import static java.lang.Math.*;
public class Planet {
 double mass;// in kg
 double radius; //in km
 float gravity; // constant for each planet, m/(s^2)
 
 public double getMass(){
   return mass; 
 }
 
 public double getRadius(){
   return radius; 
 }
 
  Planet(){
    
  }
  
}

class Earth extends Planet {
  Earth(){
     mass = 5.972*Math.pow(10, 24); //in kg
     radius = 6371; //in km
     //radius = 6563;
     //radius = 50; //random number
     gravity = 9.8;
  }
  
  void display() {
    rectMode(CENTER);
 
    rect(0, 0, 100, 100);
  }
}
