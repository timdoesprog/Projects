static final int NUMPIECES = 32;
Board board;
// ChessPiece[] pieces = new ChessPiece[NUMPIECES];
ChessPiece selected;


void setup() {
  size(800, 800);
  board = new Board(75, 50, 50);
  // peasant moves
  PVector[] moves = {new PVector(0, -1), new PVector(1, 0)};
  ChessPiece piece1 = new ChessPiece(
    1,                        // moveLength
    moves,                    // moves
    new PVector(3, 6),        // position
    "Peasant",                // name
    -1                        // isWhite
  );
  
  ChessPiece piece2 = new ChessPiece(
    1,                        // moveLength
    moves,                    // moves
    new PVector(4, 6),        // position
    "Peasant",                // name
    -1                         // isWhite
  );
  
  // update the board whenever a new piece gets created
  board.board[int(piece1.position.x)][int(piece1.position.y)] = piece1;
  board.board[int(piece2.position.x)][int(piece2.position.y)] = piece2;
  
  // after the board is set, generate all the possible moves for the pieces
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (board.board[i][j] != null) {
        board.board[i][j].generateValidMoves();
      }
    }
  }
}

void draw() {
  background(51);
  board.drawBoard();
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (board.board[i][j] != null) {
        board.board[i][j].display(board);
      }
    }
  }
}


void mousePressed() {
  // get the cell where the mouse was clicked
  PVector mouseCell = new PVector(
                                  int((mouseX - board.x) / board.cellSize),
                                  int((mouseY - board.y) / board.cellSize)
                                  );
                                  
  boolean changed = false;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      if (board.board[i][j] != null && selected == null) {
        // can't test for equality, distance < 1 means they are in the same cell
        if (PVector.dist(board.board[i][j].position, mouseCell) < 1) {
          selected = board.board[i][j];
          changed = true;
          break;
        }
      }
    }
  }
  
  // player clicked in an empty field
  if (!changed) {
    if (selected != null) {
      selected.move(mouseCell, board);
    }
    selected = null;
  }
}