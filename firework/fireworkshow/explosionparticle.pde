class explosionparticle{
  float lifespan = 255.0;
  PVector pos;
  PVector vel;
  PVector acc;
  float hu;
  float lifedet;
  float velmult;
  
  explosionparticle(float h, float x, float y, int type){
    switch(type){
      case 1:
        hu = h;
        acc = new PVector(0,0);
        vel = PVector.random2D();
        vel.mult(random(1.5));
        pos = new PVector(x,y);
        acc.add(0,(9.81/frameRate)/frameRate);
        lifedet=3.0;
        velmult=0.95;
        break;
      case 2:
        hu = h;
        acc = new PVector(0,0);
        float ypos=random(-1.4,-0.3);
        float xpos=ypos*random(-0.2,0.2);
        vel=new PVector(xpos,ypos);
        //vel = new PVector(random(-0.15,0.15), random(-1.2,-0.5));
        //vel.mult(random(0,1.5));
        pos = new PVector(x,y);
        acc.add(0,-(0.0060*vel.y));
        lifedet=2.4;
        velmult=0.98;
        break;
    }
  }
  
  void run() {
    update();
    display();
  }
  
  void display() {
    stroke(hu, 255, 255, lifespan);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    lifespan -= lifedet;
    vel.mult(velmult);
    
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
