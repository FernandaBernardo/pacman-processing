Level level;
PacMan pacman;
boolean desabilitaTeclado;

void setup() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  desabilitaTeclado = false;
  level = new Level1();
  pacman = new PacMan (400, 300, SIZE_PACMAN, SIZE_PACMAN);
}

void draw () {
  if (keyPressed) desabilitaTeclado = true;
  background(0);

  level.desenha();
  pacman.desenha();
  boolean pacmanColidiu = false;
  for (Barreira b : level.barreiras) {
    if (pacman.colideCom(b)) {
      pacmanColidiu = true;
      break;
    } 
  }
  if (!pacmanColidiu) {
    pacman.move(true);
  }
  else {
    pacman.move(false);
    pacman.speed = pacman.parado;
  }
}

void keyPressed () {
  if (!desabilitaTeclado) {
    pacman.speed = pacman.andando;
    pacman.mudaDirecao();
  }
}

void keyReleased () {
 desabilitaTeclado = false; 
}
