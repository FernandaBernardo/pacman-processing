Level level;
PacMan pacman;

void setup() {
  size(800, 600);
  level = new Level1();
  pacman = new PacMan (400, 300);
}

void draw () {
  background(0);
  
  level.desenha();
  pacman.desenha();
  pacman.colisaoParede();
}

void keyPressed () {
  pacman.keyPressed();  
}

