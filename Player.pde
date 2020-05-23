class Player{
  float llength, thickness, speed;
  float actualPosition = 500;
  int currentDirection = 0;
  float targetPosition = 500;
  Player(float x, float y, float s){
    llength = x;
    thickness = y;
    speed = s;
  }
  float getPaddlePosition(){
    return height-80-thickness;
  }
  float getPaddleLeftBoundary(){
    return actualPosition - llength/2;
  }
  float getPaddleRightBoundary(){
    return actualPosition + llength/2;
  }
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    noStroke();
    //lerp paddle movement
    targetPosition =constrain(targetPosition,llength/2, width-llength/2);
    actualPosition = lerp(actualPosition,targetPosition,0.1);
    update();
    rect(actualPosition,height-80,llength, thickness);
  }
  void update(){
    if(keyPressed){
      if(keyCode == LEFT){currentDirection = -1;}
      else if(keyCode == RIGHT){currentDirection = 1;}
    }else{
      currentDirection = 0;
    }
    targetPosition += speed  * currentDirection;
  }
}
