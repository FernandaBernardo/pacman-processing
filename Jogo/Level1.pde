class Level1 extends Level {
  Level1 () {
    super();
    desenhaBarreira();
  }
  
  void desenhaBarreira () {
    barreiras.add(new Barreira(width/2, SIDE_WALL/2, width, SIDE_WALL));
    barreiras.add(new Barreira(width/2, height - SIDE_WALL/2, width, SIDE_WALL));
    barreiras.add(new Barreira(SIDE_WALL/2, height/2, SIDE_WALL, height - SIDE_WALL));
    barreiras.add(new Barreira(width - SIDE_WALL/2, height/2, SIDE_WALL, height - SIDE_WALL));
  }
}

