class Block{
  float wide, high, positionX, positionY;
  boolean isActive = true;
  Ball ball;
  int touchBallStatus = 0;
  
  Block(float x, float y, float w, float h, Ball b){
    positionX = x;
    positionY = y;
    wide = w;
    high = h;
    ball = b;
  }
  void drawBlock(){
    if(isActive){
      fill(255);
      ifTouchBall();
    }else{
      fill(0);
    }
    rectMode(CENTER);
    noStroke();
    rect(positionX,positionY,wide,high); 
  }
  void ifTouchBall(){
    //Touch Left/Right side of block
    if((ball.positionX - ball.diameter/2 <=  (positionX+wide/2) && ball.positionX >=  (positionX+wide/2)) ||
    (ball.positionX + ball.diameter/2 >= (positionX-wide/2) && ball.positionX <= (positionX-wide/2))){
      if(ball.positionY < positionY + high/2 && ball.positionY >= positionY - high/2){
        isActive = false;
        touchBallStatus = -1;
      }     
    }
    
    //Touch Top/Down side of block
   else if((ball.positionY - ball.diameter/2 <= (positionY+high/2) && ball.positionY >= (positionY+high/2)) ||
   (ball.positionY + ball.diameter/2 >= (positionY-high/2)&& ball.positionY <= (positionY-high/2) )){
      if(ball.positionX <= positionX + wide/2  && ball.positionX >= positionX - wide/2){
        isActive = false;
        touchBallStatus =  1;        
      }
    }
    BounceOffThisBlock();
  }
  void BounceOffThisBlock(){
    if(touchBallStatus == 1){
      ball.currentSin = - ball.currentSin;
    }else if(touchBallStatus == -1){
      ball.LeftRightBounce();
    }
  }
}
