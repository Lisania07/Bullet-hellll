class Enemy3 extends GameObject {
  int threshold;
  int cooldown;
  Enemy3() {
    super(random(780, 800), random(100, 250), random(-5, 0), 3, 20, yellow, 1);
    threshold=80;
    cooldown=threshold;
  }

  void act() {
    super.act();

    cooldown++;
    if (cooldown>=threshold) {
      objects.add(new EnemyBullet(x, y, random(-6, -9), random(8, 10)));
      cooldown=0;
    }



    // collision
    int i=0;
    while (i<objects.size()) {
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;

          if (lives==0) {
            objects.add(new EnemyEffect(x, y, 0, 5, c));
            objects.add(new EnemyEffect(x, y, 5, 0, c));
            objects.add(new EnemyEffect(x, y, 0, -5, c));
            objects.add(new EnemyEffect(x, y, -5, 10, c));
            objects.add(new EnemyEffect(x, y, 0, 10, c));
            objects.add(new EnemyEffect(x, y, 10, 0, c));
            objects.add(new EnemyEffect(x, y, 0, -10, c));
            objects.add(new EnemyEffect(x, y, -10, 10, c));
            objects.add(new EnemyEffect(x, y, -10, -10, c));
            objects.add(new EnemyEffect(x, y, -5, 5, c));
            objects.add(new EnemyEffect(x, y, -10, -5, c));
            objects.add(new EnemyEffect(x, y, -5, 10, c));
          }
        }
      }
      i++;
    }
    //remove if goes off screen
    if (offScreen())lives=0;
  }
 
}
