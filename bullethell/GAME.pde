void game() {
  background(0);
  addObjects();
  gameEngine();
  debug();
}
void addObjects() {
  objects.add(0, new Star());


  if (frameCount%100==0)objects.add(new Enemy());
  if (frameCount%135==0)objects.add(new Enemy2());
  if (frameCount%160==0)objects.add(new Enemy3());
}

void gameEngine() {
  int i=0;
  while (i<objects.size()) {
    GameObject s=objects.get(i);
    s.act();
    s.show();
    if (s.lives<=0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}

void debug() {
  fill(255);
  text("lives"+player1.lives, 20, 20);
}



void gameClicks() {
  mode=GAMEOVER;
}
