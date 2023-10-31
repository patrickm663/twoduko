import std.conv;
import std.math;
import std.random;
import std.stdio;
import std.string;

class twoduko {
  private:
    int[][] board;
    int x;
    int y;
    int sq_x;
    int sq_y;
    int play;
    int x_move;
    int y_move;
    auto rng = Random();

    void play_move(int p_move, int x_move, int y_move) {
      this.board[x_move][y_move] = p_move;
    }

    bool horizontal_valid(int p_move, int x_move) {
      for(int j = 0; j < this.y; j++) {
	if (p_move == this.board[x_move][j]) {
	  return(false);
	}
      } 
      return(true);
    }

    bool vertical_valid(int p_move, int y_move) {
      for(int i = 0; i < this.x; i++) {
	if (p_move == this.board[i][y_move]) {
	  return(false);
	}
      } 
      return(true);
    }

    bool grid_valid(int p_move, int x_move, int y_move) {
      int start_grid_x = x_move - (x_move % this.sq_x);
      int end_grid_x = start_grid_x + (this.sq_x - 1);
      int start_grid_y = y_move - (y_move % this.sq_y);
      int end_grid_y = start_grid_y + (this.sq_y - 1);
      for(int i = start_grid_x; i <= end_grid_x; i++) {
	for(int j = start_grid_y; j <= end_grid_y; j++) {
	  if (p_move == this.board[i][j]) {
	    return(false);
	  }
	}
      }
      return(true);
    }


  public:
    bool is_complete;
    bool is_valid;
    
    this(int x, int y) {
      this.x = x;
      this.y = y;
      this.sq_x = to!int(sqrt(to!float(this.x)));
      this.sq_y = to!int(sqrt(to!float(this.y)));
      this.is_complete = false;
      this.is_valid = false;
      this.board = new int[][](this.x, this.y);
    }

    bool check_is_complete() {
      for(int i = 0; i < this.x; i++){
	for(int j = 0; j < this.y; j++){
	  if(this.board[i][j] == 0) {
	    for(int k = 1; k <= this.x; k++) {
	      if(this.is_valid_move(k, i, j)) {
		this.is_complete = false;
		return(this.is_complete);
	      }
	    }
	  }
	}
      }
      this.is_complete = true;
      return(this.is_complete);
    }

    bool is_valid_move(int p_move, int x_move, int y_move) {
      if (0 < p_move && p_move <= this.x && 0 <= x_move && x_move < this.x && 0 <= y_move && y_move <= this.y) {
	if(this.board[x_move][y_move] == 0 && this.horizontal_valid(p_move, x_move) && this.vertical_valid(p_move, y_move) && this.grid_valid(p_move, x_move, y_move)) {
	  return(true);
	}
      } 
      return(false);
    }

    void set_player_move() {
      int x_move;
      int y_move;
      int play;
      
      //Only accept integer inputs
      try {
	writeln("Enter an x position: ");
	x_move = to!int(strip(stdin.readln())); 
	writeln("Enter a y position: ");
	y_move = to!int(strip(stdin.readln())); 
	writeln("Enter a move: ");
	play = to!int(strip(stdin.readln())); 
	this.is_valid = this.is_valid_move(play, x_move, y_move);
	if (this.is_valid) {
	  this.play_move(play, x_move, y_move);
	} else {
	  writeln("Invalid move!");
	}
      } catch (Exception e) {
	writeln("Invalid move!");
      }
    }

    void set_cpu_move() {
      int x_move = -1; 
      int y_move = -1; 
      int play = -1; 
      while(!this.is_valid_move(play, x_move, y_move)) {
	x_move = uniform(0, this.x, this.rng);  //Between [0, x) 
	y_move = uniform(0, this.y, this.rng);   
	play = uniform(1, this.x+1, this.rng);
      }
	this.play_move(play, x_move, y_move);
    }


    void display_board() {
      string board_string;
      for(int r = -1; r < this.x; r++) {
	for(int c = -1; c < this.y; c++) {
	  if(r == -1 && c == -1) {
	    write("    ");
	  } else if(r == -1 && c > -1) {
	    write(to!string(c)~" ");
	  } else if(r > -1 && c == -1) {
	    write(to!string(r)~"  |");
	  } else {
	    board_string = to!string(this.board[r][c]);
	    if(board_string == "0") {
	      board_string = " ";
	    }
	    if (c % this.sq_y == 0) {
	      write(board_string~" ");
	    } else if(c < this.y - 1) {
	      write(board_string~"|");
	    } else {
	      write(board_string);
	    }
	  } 
	}
	if(r == -1 || r % this.sq_x == 1 || r == this.x-1) {
	  if(r > -1) {
	    writeln("|");
	  } else {
	    writeln();
	  }
	  write("    ");
	  for(int k = 0; k < this.x; k++) {
	    if(k < this.x-1) {
	      write("- ");
	    } else {
	      write("-\n");
	    }
	  }
	} else {
	  writeln("|");
	}
      }
      writeln();
    }

}
