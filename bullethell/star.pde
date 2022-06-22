class Star extends GameObject {

  //constructor
  Star() {
    super(random(width), 0, 0, 0, random(1, 5), #FFFFFF, 1);
    vy=size;
  }

  //behavior
  void act() {
    super.act();
    if (y>height)
      lives=0;
  }
}
