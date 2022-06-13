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
  
  public double getX(){ //should this and y version be based on COM?
    return x;
  }

  public double getY(){
    return y;
  }
  
  public double getD(){ //includes radius of planet
    double py = height/2;
    double px = width/2;
    double dSqrd = (x-px)*(x-px)+(y-py)*(y-py); 
    d = Math.sqrt(dSqrd);// NOT NEEDED ANYMORE==> - p.getRadius();
    return d; //IN PIXELS
  }
  
  public void setX(double newX){
    x = newX;
  }
  
  public void setY(double newY){
    y = newY;
  }
  
}
