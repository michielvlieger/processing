class fireworkarrow{
  PVector vel = PVector.random2D();
  PVector acc = new PVector(0,0);
  PVector pos;
  //float arrowwidth;
  float lifespan=255;
  float hu=255;
  
  fireworkarrow(float startingSpeed,float x, float y){
    hu=255;
    //arrowwidth = random(1,1.5);
    vel = new PVector(0,-startingSpeed/frameRate);
    pos= new PVector(x,y);
    lifespan=255;
    acc.add(0,(9.81/frameRate)/frameRate);
  }
  
  void show(){
   //strokeWeight(arrowwidth);
   //stroke(138,43,226);
   //line(xpos,ypos,xpos,ypos+(arrowwidth*4)); 
   strokeWeight(2);
   stroke(hu, 255, 255, lifespan);
   point(pos.x, pos.y);
  }
  
  void move(){
      //float fc=frameCount;
      //double y = startingypos - startingspeed*fc + 0.5*g*(Math.pow(fc,2));
      //ypos=(float)y;
      //speed = speed - g;
      //ypos = ypos - speed;
      vel.add(acc);
      pos.add(vel);
      vel.mult(0.99);}
  
  boolean isdead(){
    if (vel.y > 0) {
      lifespan = 0;
      return true;
    }
    return false;
  }
}
