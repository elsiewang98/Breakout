Player player = new Player(150,15,10);
Ball ball;
BlockList bl;
int row = 5;
int col = 6;
int wide = 120;
int high = 40;
int gap = 10;
float rectHeight = 0;
void setup(){
  size(1000,700);
  noStroke();
  ball = new Ball(10, player,25);
  bl = new BlockList(col,row,wide,high,gap,ball);
}

void draw(){
  background(0);
  player.drawPlayer();
  bl.drawBlockList();
  ball.drawBall();
  restart();
}

void restart(){
  if(ball.isGameOver || bl.isGameWin){
    fill(0);
    rectMode(CORNER);
    rectHeight += 5;
    rect(0,0,width,rectHeight);
    if(rectHeight > height* 1.2 ){
      fill(255);
      textSize(30);
      if(bl.isGameWin){
        textAlign(RIGHT);
        text("YOU WIN! Press ENTER to start again", width-40, height/2);
      }else{
        textAlign(RIGHT);
        text("YOU LOSE! Press ENTER to start again", width- 40, height/2);
      }
    }
    
  }
}
void keyPressed(){
  if(keyCode == ENTER && (ball.isGameOver || bl.isGameWin)){ 
    bl = new BlockList(col,row,wide,high,gap,ball);
    ball.dieTimes = 0;
    rectHeight = 0;
  }
}
