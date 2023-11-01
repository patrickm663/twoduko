/**
  * Author: Patrick Moehrke
  * License: MIT
*/

import std.stdio;
import game;

void main() {
  Twoduko my_game = new Twoduko(4, 4);
  my_game.play_game();
}

