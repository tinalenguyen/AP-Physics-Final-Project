public class CatRocket {
  double mass;
  double x;
  double y;
  double d; //distance from planet
  
  CatRocket(double mass, double x, double y){
    this.mass = mass; //mass = 448648;
    this.x = x; //x = 260;
    this.y = y; //y = (height/2) + 70;
  }
  
  public double getX(){
    return x;
  }

  public double getY(){
    return y;
  }
  
  public double getD(Planet p){
    double py = height/2; //is this wrong?
    double px = width/2; //is this wrong?
    double dSqrd = (x-px)*(x-px)+(y-py)*(y-py); 
    d = Math.sqrt(dSqrd) - p.getRadius();
    return d; 
  }
  
  public void setX(double newX){
    x = newX; //this.x?
  }
  
  public void setY(double newY){
    y = newY; //this.y?
  }
  
}
