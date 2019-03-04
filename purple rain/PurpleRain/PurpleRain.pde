drop[] drops= new drop[1000];


void setup(){
  //size(640,360);
  fullScreen();
  for(int i=0; i<drops.length;i++){
    drops[i]=new drop();
  }
  
}

void draw(){
  background(230,230,250);
  for(int i=0; i<drops.length;i++){
    drops[i].fall();
    drops[i].show();
  }
}
