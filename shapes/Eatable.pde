public class Eatable{
  protected int x;
  protected int y;
  protected int r;  
  
  Eatable(int size){
    r=size;
    x=int(random(r, width-r));
    y=int(random(r, height-r));
  }

   public int getY(){
    return y;
  } 
  
  public int getX(){
    return x;
  }  
  
  public int getR(){
    return r;  
  }
  
  public boolean canBeEatenBy(Eatable something){
    /*if distance between this and 
    something is less that the sum 
    of the two r return true. 
    Else return false*/
    
    if(dist(x,y,something.getX(), something.getY())<=(r+something.getR())){
      return true;
    } 
    else{
      return false;
    }
  }
}