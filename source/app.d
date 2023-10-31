import std.stdio;
import game;

void main() {
  writeln("Welcome to TWODUKO!\n");
  twoduko my_game = new twoduko(4, 4);
  my_game.display_board();

  //Play game
  while(!my_game.is_complete){
    //Human move
    writeln("PLAYER MOVE");
    while(!my_game.is_valid) {
      my_game.set_player_move();
    }

    my_game.display_board();
    my_game.is_valid = false;
    if(my_game.check_is_complete()){
      my_game.is_complete = true;
      my_game.display_board();
      writeln("YOU WIN!");
      break;
    }

    //CPU move
    writeln("CPU MOVE");
    my_game.set_cpu_move();
    my_game.display_board();

    if(my_game.check_is_complete()){
      my_game.is_complete = true;
      my_game.display_board();
      writeln("YOU LOSE!");
      break;
    }
  }

  writeln("GAME OVER");

}

