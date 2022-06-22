//Lisa

final int INTRO=0;
final int GAME=1;
final int GAMEOVER=2;
final int PAUSE=3;
int mode;
int timer=5;

boolean up, down, left, right, space;

ArrayList<GameObject>objects;
Starfighter player1;

color black=#0E0700;
color green=#4E6A51;
color yellow=#D28800;
color browngreen=#9C946D;
color lorange=#E6B37A;

void setup() {
  size(800, 800);
  mode=GAME;
  rectMode(CENTER);
  objects=new ArrayList<GameObject>();
  player1=new Starfighter();
  objects.add(player1);
  

}

void draw() {
  if (mode==INTRO) intro();
  else if (mode==GAME) game();
  else if (mode==GAMEOVER) gameover();
  else if (mode==PAUSE) pause();
}
