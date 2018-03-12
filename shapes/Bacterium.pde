public class Bacterium extends Eatable{
  private int dx;
  private int dy;
  private int Vx;
  private int Vy;
  private int life;
  private PImage photo;
  
  Bacterium(Food food){  
    super(20);
    dx=1;
    dy=1;    
    Vx=4;
    Vy=4;
    life=1;
    photo = loadImage("assets/bacterium.png");
  }
  public int getL(){
    return life;
  }
  public void draw(Eatable food,ArrayList <Virus> enemies){
    noStroke();
    fill(0,255,0);
    imageMode(CENTER);
    photo.resize(r*2,r*2);
    image(photo,x,y);
    x +=dx*Vx;
    y +=dy*Vy;
    
    float minDist=9999999;
    int closetVirusIndex=0;

     for(int i=0; i<virus.size(); i++){
        Virus vr = virus.get(i);
        float d=dist(x,y,vr.getX(),vr.getY());
        if(d<minDist){
          minDist=d;
          closetVirusIndex=i;
        }
      }
    Virus closestEnemy = enemies.get(closetVirusIndex);
    
    float distanceToFood=dist(x,y,food.getX(),food.getY());
    float distanceToClosestEnemy=dist(x,y,closestEnemy.getX(),closestEnemy.getY());
    
    if(distanceToFood<=distanceToClosestEnemy || distanceToClosestEnemy>3*r){
      if(x>food.getX()){
        dx=-1;
      }
      else{
        dx=1;
      }
      if(y>food.getY()){
        dy=-1;
      }
      else{
        dy=1;
      }  
    }else{
    if(x<closestEnemy.getX()){
        dx=-1;
      }
      else{
        dx=1;
      }
      if(y<closestEnemy.getY()){
        dy=-1;
      }
      else{
        dy=1;
      }  
    }
    if(x<0){
      x=0;
    }
    //if(x>width){
    //  x=width;
    //}
    //if(y<0){
    //  y=0;
    //}
    //if(y>height){
    //  y=width;
    //}
  }
}