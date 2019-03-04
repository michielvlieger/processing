class circle {
  float angle=0;
  float locAngle, dis, maxAngle, startFrame;
  int i,circles;
  boolean done=false;
  PVector loc = new PVector(0, 0);

  circle(int I, int Circles) {
    i=I;
    circles=Circles;
    locAngle = TWO_PI/Circles*i;
    maxAngle = TWO_PI-TWO_PI/Circles;
    startFrame=frameCount+I*10;
  }

  void show() {
    arc(loc.x, loc.y, 100, 100, (angle-maxAngle*i)+TWO_PI/circles/2, (TWO_PI-maxAngle*i)+TWO_PI/circles/2);
  }

  void update() {
    if (startFrame<=frameCount) {
      dis=map(-cos((startFrame-frameCount)*0.04), -1, 1, -1, 125);
      if (angle<maxAngle&&dis>50) {
        angle+=0.08;
      }
      if (angle>0&&dis<=0) {
        done=true;
      }
      float xdiv=cos(locAngle)*dis;
      float ydiv=sin(locAngle)*dis;
      loc.y = ydiv;
      loc.x = xdiv;
    }
  }
}
