class BlockList{
  int row, col;
  float wide, high, gap;
  float totallength, startingPosition;
  float CountRemainingBlocks;
  boolean isGameWin = false;
  Ball ball;
  Block[][] blocks;
  BlockList(int r, int c, float w, float h, float g, Ball b){
    row = r;
    col = c;
    wide = w;
    high = h;
    gap = g;
    ball = b;
    blocks = new Block[col][row];
    totallength = row * wide + (row - 1) * gap;
    startingPosition = (width - totallength)/2;
    for(int i=0; i < col ;i ++){
      for(int j=0; j < row; j ++){
        float positionX = startingPosition + (gap + wide)*j +wide/2;
        float positionY = (gap + high)*i+high/2+60;
        blocks[i][j] = new Block(positionX,positionY,wide,high,ball);
      }
    }
  }
  void drawBlockList(){
    CountRemainingBlocks = 0;
    for(int i=0; i < col ;i ++){
      for(int j=0; j < row; j ++){
        blocks[i][j].drawBlock();
        if(blocks[i][j].isActive) CountRemainingBlocks++;
      }
    }
    if(CountRemainingBlocks == 0) isGameWin = true;    
  }
}
