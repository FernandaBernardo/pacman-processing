class PacMan {
  int x;
  int y;
  int direcao;
  int up;
  int down;
  int left;
  int right;

  PacMan (int px, int py) {
    x = px;
    y = py;
    direcao = 'p';
    up = y - tamPacMan/2;
    down = y + tamPacMan/2;
    left = x - tamPacMan/2;
    right = x + tamPacMan/2;
  }

  void desenha () {
    fill(255);
    ellipse(x, y, tamPacMan, tamPacMan);
    rect (left, up, tamPacMan, 2);
    rect (left, down, tamPacMan, 2);
    rect (right, up, 2, tamPacMan);
    rect (left, up, 2, tamPacMan);
  }

  void colisaoParede () {
    switch (direcao) {
      case ('u'):
      if (!colisaoBarreira()) {
        if (pacman.y>tamPacMan/2) {
          pacman.y-=5;
          up = y - tamPacMan/2;
          down = y + tamPacMan/2;
          left = x - tamPacMan/2;
          right = x + tamPacMan/2;
        }
      }
      break;

      case ('d'):
      if (!colisaoBarreira()) { 
        if (pacman.y<height-tamPacMan/2) {
          pacman.y+=5;
          up = y - tamPacMan/2;
          down = y + tamPacMan/2;
          left = x - tamPacMan/2;
          right = x + tamPacMan/2;
        }
      }
      break;

      case ('l'): 
      if (!colisaoBarreira()) {
        if (pacman.x>tamPacMan/2) {
          pacman.x-=5;
          up = y - tamPacMan/2;
          down = y + tamPacMan/2;
          left = x - tamPacMan/2;
          right = x + tamPacMan/2;
        }
      }
      break;

      case ('r'): 
      if (!colisaoBarreira()) {
        if (pacman.x<width-tamPacMan/2) {
          pacman.x+=5;
          up = y - tamPacMan/2;
          down = y + tamPacMan/2;
          left = x - tamPacMan/2;
          right = x + tamPacMan/2;
        }
      } 
      break;
    }
  }

  boolean colisaoBarreira () {
    switch (direcao) {
      case ('u'):
      for (Barreira b: level.barreiras) {
        if (rectRect(b.x, b.y, b.w, 2*b.h, left, up, tamPacMan, 1)) return true;
      }
      break;

      case ('d'):
      for (Barreira b: level.barreiras) {
        if (rectRect(b.x, b.y, b.w, b.h, left, down, tamPacMan, 1)) return true;
      }
      break;

      case ('r'):
      for (Barreira b: level.barreiras) {
        if (rectRect(b.x, b.y, b.w, b.h, right, up, 1, tamPacMan)) return true;
      }
      break;

      case ('l'):
      for (Barreira b: level.barreiras) {
        if (rectRect(b.x, b.y, 2*b.w, b.h, left, up, 1, tamPacMan)) return true;
      }
      break;
    }
    return false;
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

