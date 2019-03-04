class drop{
  float y= random(-height,0);
  float x= random(0,width);
  float yspeed;
  float droplength = random(7,20);
  
  void fall(){
    yspeed=0.4*droplength;
    y=y+yspeed;
    
    if(y>height){
      y=random(-200,-100);
    }
  }
  void show(){
   stroke(138,43,226);
   line(x,y,x,y+droplength); 
  }
}
