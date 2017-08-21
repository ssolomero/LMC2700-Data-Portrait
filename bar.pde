class bar {
  float angle2;
  int num;
  ArrayList<PVector> history;


  bar() {
    angle2 = angle;
    num = countArr[hour][minute];
    this.history = new ArrayList<PVector>();
  }
  
  void show() {
     //line
    lineAngle(width/2, height/2, angle2, (164 + (num * 10))); 
  }
  void lineAngle(int x, int y, float angle, float length) {
    stroke(0 , 255, 255); 
    strokeWeight(3);
    line(x, y, x+cos(angle)*length, y-sin(angle)*length);
  }
}


 