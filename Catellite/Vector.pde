public class Vector{

    //public final Vector ZERO = new Vector(0,0);
    //public static final Vector ZERO = new Vector(0,0);

  private double x;
  private double y;

  public Vector(double x, double y){
    this.x = x;
    this.y = y;
  }

  public double getX(){
    return x;
  }

  public double getY(){
    return y;
  }
  
  public void setX(double newX){
    x = newX; 
  }
  
  public void setY(double newY){
    y = newY;
  }
  
  public double magnitude(){
    double magnitudeSqrd = x*x + y*y;
    return Math.sqrt(magnitudeSqrd);
  }

  public Vector add(Vector other){
    double sumX = x + other.getX(); //sum of x components
    double sumY = y + other.getY(); //sum of y components
    Vector res = new Vector(sumX, sumY);
    return res; //return resultant
  }

  public Vector subtract(Vector other){
    double difX = x - other.getX(); //difference of x components
    double difY = y - other.getY(); //difference of y components
    Vector res = new Vector(difX, difY);
    return res;
  }

  public Vector multiply(double factor){
    double proX = x * factor; //product of x component and factor
    double proY = y * factor; //product of y component and factor
    Vector res = new Vector(proX, proY);
    return res;
  }

  public Vector divide(double factor){
    double quoX = x / factor; //quotient of x component and factor
    double quoY = y / factor; //quotient of y component and factor
    Vector res = new Vector(quoX, quoY);
    return res;
  }
  
//MIGHT NEED THIS FOR SCALING UNITS TO PIXELS  
//  public Vector scale(double x, double y) {
//    return new Vector(getX()*x, getY()*y);
//  }

  public Vector normalized(){
    double m = magnitude();
    return divide(m);
  }

}
