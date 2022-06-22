class Starfighter extends GameObject {

  int cooldown, threshold;

  Starfighter() {
    super(width/2, width/2, 0, 0, 40, #FF0000, 3);
    threshold=10;
    cooldown=threshold;
  }

  void act() {
    super.act();

    //managing guns
    cooldown++;
    if (space&&cooldown>=threshold) {
      objects.add(new Bullet());
      cooldown=0;
    }

    //controlling the starfighter
    if (up)vy=-4;
    if (down)vy=4;
    if (left)vx=-4;
    if (right)vx=4;
    if (!up&&!down)vy=vy*0.9;
    if (!left&&!right) vx=vx*0.9;


    //enemy 1 collision
    int i=0;
    while (i<objects.size()) {
      GameObject obj=objects.get(i);
      if (obj instanceof EnemyBullet && collidingWith(obj)) {
          player1.lives--;
        
      }
      i++;
    }
    
    //enemey 2 colli
    int n=0;
    while (n<objects.size()) {
      GameObject obj=objects.get(n);
      if (obj instanceof Enemy2) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives=0;
        }
      }
      n++ ;
    }
    
    //enemy3 colli
    int u=0;
    while (u<objects.size()) {
      GameObject obj=objects.get(u);
      if (obj instanceof Enemy3) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives=0;
        }
      }
      u++ ;
    }
  }
}
