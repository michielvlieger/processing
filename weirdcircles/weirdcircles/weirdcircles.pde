circle[] circles;
int circleAmount=9;
float maxAngle;
int nextStartFrame;

void setup() {
  size(400, 400);
  noStroke();
  blendMode(EXCLUSION);
  maxAngle = TWO_PI/circleAmount;
  nextStartFrame=0;
  starting();
}

void draw() {
  translate(width/2, height/2);
  background(220);
  noStroke();
  fill(255);
  if (frameCount>nextStartFrame) {
    blendMode(EXCLUSION);
    int done=0;
    for (int i=0; i<circleAmount; i++) {
      circles[i].show();
      if (!circles[i].done) {
        
        circles[i].update();
      } else {
        done=i;
      }
    }
    blendMode(REPLACE);
    fill(35);
    if (done>=1) {
      arc(0, 0, 100, 100, (0-maxAngle)+maxAngle/2, (maxAngle*done)+maxAngle/2);
    }
    if (done==circleAmount-1&&frameCount>nextStartFrame+275){
      nextStartFrame=frameCount;
      starting();
    }
  }
}

void starting() {
  circles=new circle[circleAmount];
  for (int i=0; i<circleAmount; i++) {
    circles[i]=new circle(i, circleAmount);
  }
}
