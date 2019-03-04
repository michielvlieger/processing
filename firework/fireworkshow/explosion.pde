class explosion{
  PVector pos;
  ArrayList<explosionparticle> particles;
  float hu;
  boolean done = false;

  
  explosion(float xpos,float ypos){
    pos = new PVector(xpos,ypos);
    particles = new ArrayList<explosionparticle>();
  }
  
  void show(){
    if (!done) {
      for (int i = 0; i < 100; i++) {
          particles.add(new explosionparticle(random(255),pos.x,pos.y,1));    // Add "num" amount of particles to the arraylist
       }
       done=true;
    }
  } 
  
  void update(){
    for (int i = particles.size()-1; i >= 0; i--) {
      explosionparticle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  boolean isdead(){
    if(particles.size()==0 && done == true){
      return true;
    }
    return false;
  }
}
