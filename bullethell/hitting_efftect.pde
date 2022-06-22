class EnemyEffect extends GameObject {

  //constructor
  EnemyEffect(float x, float y, float vx, float vy, color c) {
    super(x, y, vx+5, vy+5, 1, c, 10);
  }

  void act() {

    super.act();
    
    if (timer<0) {
      lives=0;
    }
  }

  void show() {
    super.show();
  }
}
