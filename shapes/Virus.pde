public class Virus extends Eatable{
  private int dx;
  private int dy;
  private int Vx;
  private int Vy;
  private PImage photo;
  
  Virus(){
    super(20);
    dx=1;
    dy=1;    
    Vx=int(random(2))+1;
    Vy=int(random(2))+1;
    photo = loadImage("assets/virus.png");
  }
  
  public void draw(){
    noStroke();
    fill(255,0,0);
    imageMode(CENTER);
    photo.resize(r*2,r*2);
    image(photo,x,y);
    x +=dx*Vx;
    y +=dy*Vy;
    if(x>width-r){
      dx=-1;
      Vx =int(random(5));
      Vy =int(random(5));
    }
    if(x<r){
      dx=1;
      Vx =int(random(5));
      Vy =int(random(5));
    }
    if(y>height-r){
      dy=-1;
      Vx =int(random(5));
      Vy =int(random(5));
    }
    if(y<r){
      dy=1;
      Vx =int(random(5));
      Vy =int(random(5));
    }  
  }  
}