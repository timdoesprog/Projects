class Board {
  
  int cellSize;
  float x;
  float y;
  
  // two dimensional array for all the pieces on the board
  // 0 means no piece == initial value
  // -1 means a white piece
  // +1 means a black piece
  ChessPiece[][] board;
  
  Board(int cs, float x_, float y_) {
    cellSize = cs;
    x = x_;
    y = y_;
    board = new ChessPiece[8][8];
  }  
  
  // draw a 8x8 chess board starting at x, y with a specified cell size
  void drawBoard() {
    float len = cellSize * 8;
    stroke(255);
    noFill();
    rect(x, y, len, len);
    for (int i = 1; i < 8; i++) {
      // vertical lines
      line(x + i * cellSize, y, x + i * cellSize, y + len);
      // horizontal lines
      line(x, y + i * cellSize, x + len, y + i * cellSize);
    }
  }
}