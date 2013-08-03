class Level1 extends Level {
  Level1 () {
    super();
    System.out.println(width);
    for (int i = 0; i<width; i+=((2*tamBorda)+tamPacMan)) {
      barreiras.add(new Barreira(i, 0, largBarreira, 100));
      System.out.println(i);
    }
  }
}

