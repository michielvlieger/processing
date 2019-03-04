class firework{
  float startingspeed;
  float xpos;
  float ypos;
  fireworkarrow arrow;
  explosion explosion;
  int state;
  boolean exploded=false;
  
  firework(float speed){
     startingspeed = speed;
     xpos = random(0,width);
     ypos = height;
     state=0;
     arrow = new fireworkarrow(startingspeed,xpos,ypos);
  }
  
  void run(){
    switch(state){
      case 0 :
        arrow.show();
        shootarrow();
        break;
      case 1:
        explode();
        explosion.show();
        break;
      case 2:
        println("remove");
        break;
    } 
  }
  
  void shootarrow(){
    if(arrow.isdead()){
      state=1;
    } else{
      arrow.move();
    }
  }
  
  void explode(){
    if(exploded==false){
       explosion = new explosion(xpos,arrow.pos.y);
       exploded = true;
    }
    explosion.update();
    if(explosion.isdead()){
      state=2;
    }
  }
}
