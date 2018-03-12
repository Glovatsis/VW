public class Food extends Eatable{
  private int dx;
  private int dy;
  private int Vx;
  private int Vy;
  private PImage photo;
  private int type;
  
  Food(){
    super(20);
    dx=1;
    dy=1;    
    Vx=int(random(5));
    Vy=int(random(5)); 
    if(random(100)>25){ 
      type=CHERRY;
      photo = loadImage("assets/cherry.png");
    }
    else{
      type=POWERUP;
      photo = loadImage("assets/powerup.png");  
    }
  }
  //if(f.is(CHERRY))  
  public boolean is(int i){
    return type==i;
  }
  
  
  public int getType(){
    return type;
  }
  
  public void draw(){
    noStroke();
    fill(0,255,0);
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