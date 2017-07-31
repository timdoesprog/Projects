class ChessPiece {
  
  int moveLength;
  PVector[] moves;
  PVector position;
  ArrayList<PVector> validMoves;
  String name;
  
  // if white -1
  // if black 1
  int isWhite;
  
  ChessPiece(int ml, PVector[] m, PVector p, String n, int w) {
    moveLength = ml;
    moves = m;
    position = p;
    name = n;
    isWhite = w;
    
  }
  
  void display(Board board) {
    float x = board.x + position.x * board.cellSize;
    float y = board.y + position.y * board.cellSize;
    noFill();
    if (isWhite == -1) stroke(255, 0, 0);
    if (isWhite == 1) stroke(0, 0, 255);
    ellipse(x + board.cellSize/2, y + board.cellSize/2, 32, 32);
  }
  
  void generateValidMoves() {
    validMoves = new ArrayList<PVector>();
    for (int i = 0; i < moves.length; i++) {
      PVector currentPosition = position.copy();
      PVector move = moves[i];
      for (int j = 1; j <= moveLength; j++) {
        currentPosition.add(move);
        
        // safety for move out of the board
        if (currentPosition.x < 0 || currentPosition.x > 7 || currentPosition.y < 0 || currentPosition.y > 7) break;
        
        // case the field is empty
        if (board.board[int(currentPosition.x)][int(currentPosition.y)] == null) {
          validMoves.add(currentPosition.copy());
        }
        
        // case the incountered piece is the same color as this piece
        else if (board.board[int(currentPosition.x)][int(currentPosition.y)].isWhite == isWhite) {
          break;
        }
        
        // case the field is occupied by a different color as this one
        else {
          validMoves.add(currentPosition.copy());
          break;
        }
      }
    }
    println(validMoves);
  }
  
  void move(PVector goal, Board board) {
    // if the player clicks outside the board return
    if (goal.x > 7 || goal.x < 0 || goal.y > 7 || goal.y < 0) return;
    if (isValidMove(goal)) {
      board.board[int(position.x)][int(position.y)] = null;
      position = goal;
      board.board[int(position.x)][int(position.y)] = this;
      // new valid moves need to be generated after every move the piece makes
      generateValidMoves();
    }
  }
  
  boolean isValidMove(PVector goal) {
    for (int i = 0; i < validMoves.size(); i++) {
      PVector currentMove = validMoves.get(i);
      if (PVector.dist(currentMove, goal) < 1) {
        return true;
      }
    }
    return false;
  }
}