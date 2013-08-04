class PacMan {
  int x;
  int y;
  int direcao;

  PacMan (int px, int py) {
    x = px;
    y = py;
    direcao = 'p';
  }

  void desenha () {
    fill(255);
    ellipse(x, y, tamPacMan, tamPacMan);
  }

  void colisaoParede () {
    switch (direcao) {
      case ('u'):
      if (pacman.y>tamPacMan/2) pacman.y-=5;
      break;

      case ('d'): 
      if (pacman.y<height-tamPacMan/2) pacman.y+=5; 
      break;

      case ('l'): 
      if (pacman.x>tamPacMan/2) pacman.x-=5;
      break;

      case ('r'): 
      if (pacman.x<width-tamPacMan/2) pacman.x+=5; 
      break;
    }
  }

  void keyPressed () {
    if (key == CODED) {
      if (keyCode == UP) direcao = 'u';
      if (keyCode == LEFT) direcao = 'l';
      if (keyCode == DOWN) direcao = 'd';
      if (keyCode == RIGHT) direcao = 'r';
    }
  }
}

