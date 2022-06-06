public class CatRocket {
  double mass;
  int x;
  int y;
  double d; //distance from planet
  
  CatRocket(double mass, int x, int y){
    this.mass = mass; //mass = 448648;
    this.x = x; //x = 260;
    this.y = y; //y = (height/2) + 70;
  }
  
  public int getX(){
    return x;
  }

  public int getY(){
    return y;
  }
  
  public double getD(Planet p){
    double py = height/2;
    double px = width/2;
    double dSqrd = (x-px)*(x-px)+(y-py)*(y-py); 
    d = Math.sqrt(dSqrd) - p.getRadius();
    return d; 
  }
  
  public void setX(int newX){
    x = newX; //this.x?
  }
  
  public void setY(int newY){
    y = newY; //this.y?
  }
  
}
