class Ball{
  float diameter, currentSin, speed; 
  float positionX, positionY;
  boolean startGame = false;
  int dieTimes = 0;
  boolean isGameOver = false;
  Player paddle;
  Ball(float s, Player player, float d){
    diameter = d;
    speed = s;
    paddle = player;
    positionX = 500;
    
    //set random starting angle
    currentSin = random(PI/6,PI*5/6);
  }
  void drawBall(){
    noStroke();
    fill(255);
    circle(positionX,positionY,diameter);
    println("dieTimes"+ dieTimes);
    showLifeTimes();
    gameControl();
  }
  void gameControl(){
    //press SPACE to start game
    if(keyPressed){
      if(key == ' '){
        if(!isGameOver) startGame = true;
      }
    }
    if(gameOver()) startGame = false;
    
    //player can reposition the paddle before game start
    if(startGame){ 
      update();
    }else{
      positionX = lerp(positionX,paddle.actualPosition,0.5);
      positionY = paddle.getPaddlePosition()-10;
    }
  }
  void update(){
    positionX += speed * cos(currentSin);
    positionY -= speed * sin(currentSin);
    BounceOffWall();
    BounceOffPaddle();
  }
  void BounceOffWall(){
    //touch left and right wall
    if(positionX <= diameter/2 || positionX >= width - diameter/2){
      LeftRightBounce();
    }
    
    //touch top wall
    if (positionY <= diameter/2){
      UpDownBounce();
    }
  }
  void LeftRightBounce(){
    currentSin = PI - currentSin;
  }
  void UpDownBounce(){
    currentSin = - currentSin;
  }
  void BounceOffPaddle(){
    //touch paddle
    if(positionY <= paddle.getPaddlePosition() && positionY >= paddle.getPaddlePosition()-10){
      if(positionX < paddle.getPaddleRightBoundary() && 
      positionX > paddle.getPaddleLeftBoundary()){
        
      //bounce off differnt angle according to where it hits the paddle
      currentSin = map(positionX,paddle.getPaddleLeftBoundary(),paddle.getPaddleRightBoundary(),50/6,10/6)/ 10 * PI;
      }
    }
  }
  boolean gameOver(){
    if(positionY > height +30){
      dieTimes++;
      return true;
    }
    return false;
  }
  
  void showLifeTimes(){
    int remainLife = 3- dieTimes;
    textSize(30);
    if(remainLife >= 0){
      textAlign(LEFT);
      text(remainLife, width-80, height-30);
      circle(width-45,height-40,20);
      isGameOver = false;
    }else{
      text("GAME OVER", width-200, height-30);
      isGameOver = true;
    }
    
  }
}
