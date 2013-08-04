class Level1 extends Level {
  Level1 () {
    super();
    desenhaBarreira();
  }
  
  void desenhaBarreira () {
    for (int i = 0; i<width; i+=((2*tamBorda)+tamPacMan)) {
      barreiras.add(new Barreira(i, 0, largBarreira, 100));
    } 
  }
}

