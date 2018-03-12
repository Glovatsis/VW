Food food;
ArrayList <Bacterium> bacterium;
ArrayList <Virus> virus;
int score;
boolean gameOver;
int state;
int startTime;


static final int CHERRY = 1;
static final int POWERUP = 2;

void setup(){
  size(1024,780); 
  reset();
}

void reset(){ 
  food = new Food();
  bacterium = new ArrayList<Bacterium>();
  virus = new ArrayList<Virus>();
  virus.add(new Virus());
  virus.add(new Virus());
  virus.add(new Virus());
  bacterium.add(new Bacterium(food));
  bacterium.add(new Bacterium(food));
  bacterium.add(new Bacterium(food));
  bacterium.add(new Bacterium(food));
  score=0;
  gameOver =false;
  state=CHERRY;
  startTime = -1000000;
}

void draw(){
  if (state == POWERUP)
    background(50);
    else
  background(0);
  fill(255);
  textSize(15);
  text("Score: "+score, 10, 40);
  if(!gameOver){
    if(millis()-startTime>3000){
      state=CHERRY;
      startTime=-100000;
    }
    println(""+(millis()-startTime));
    food.draw();
    for(int i=0; i<bacterium.size(); i++){
      Bacterium bc = bacterium.get(i);
      bc.draw(food,virus);
    } 
    for(int i=0; i<virus.size(); i++){
      Virus vr = virus.get(i);
      vr.draw(); 
    }
    
   for(int i=0; i<virus.size(); i++){
     for(int j=0; j<bacterium.size(); j++){
       
      Virus vr = virus.get(i);
      Bacterium bc = bacterium.get(j);   
      if(bc.canBeEatenBy(vr)){      
        bacterium.remove(bc);
        j--;
          if ((state==CHERRY) && (bacterium.size()==0)){
            gameOver = true;         
        }   
        else if (state==POWERUP){        
          virus.remove(vr);
          i--;
          score++;
          
          }
        }
      }
    }
    for(int i=0; i<bacterium.size(); i++){
      Bacterium bc= bacterium.get(i);
    if(food.canBeEatenBy(bc)){
      if(food.is(CHERRY)){        
        score++;
        virus.add(new Virus());
      }else if(food.is(POWERUP)){
        state=POWERUP;
        startTime = millis();
      }
      food = new Food();
      }
    }
  }
  else{
    pushStyle();
    textAlign(CENTER,CENTER);
    textSize(25);
    fill(255,0,0);
    text("SIMULATION OVER", width/2, height/2);
    fill(255);
    stroke(0);
    rectMode(CENTER);
    rect(width/2, height/2+70, 150, 40);
    fill(0);
    text("Start Over", width/2, height/2+70);
    popStyle();
  }
}

void mouseClicked(){
    if( 
      (gameOver) && (mouseX>=(width/2-75)) && (mouseX <=(width/2+75)) &&
      (mouseY>=(height/2+70-20)) && (mouseY<=(height/2+70+20))
    ){
      reset();
    }
}