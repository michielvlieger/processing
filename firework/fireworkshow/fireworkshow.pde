ArrayList<firework> fireworks = new ArrayList<firework>();
float fr=60;
float screenlimit=20;
float slowest=50;
float fastest=250;

void setup(){
  size(640, 360, P2D);
  colorMode(HSB);
  background(51);
  frameRate(fr);
}

void draw(){
  if(random(10)>9.8 && fireworks.size()<screenlimit && frameCount>10){
      fireworks.add(new firework(random(slowest,fastest)));
  }
  
  fill(51, 50);
  noStroke();
  rect(0,0,width,height);
  
  for(int i=fireworks.size()-1; i>=0;i--){
    firework f = fireworks.get(i);
    f.run();
    if(f.state==2){
      fireworks.remove(i);
      fireworks.add(new firework(random(slowest,fastest)));
    }
  }
}
