class Enemy extends GameObject {
  int threshold;
  int cooldown;
  //constructor
  Enemy() {
    super(random(width), -20, 0, 5, 40, green, 1);
    threshold=60;
    cooldown=threshold;
  }

  void act() {
    super.act();

    //managing gun
    cooldown++;
    if (cooldown>=threshold) {
      objects.add(new EnemyBullet(x, y, 0, 10));
      cooldown=0;
    }

    //collision
    int i=0;
    while (i<objects.size()) {
      GameObject obj=objects.get(i);
      if (collidingWith(obj)) {
        if (obj instanceof Bullet) {
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
