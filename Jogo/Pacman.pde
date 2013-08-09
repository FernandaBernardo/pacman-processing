class PacMan extends Sprite {
  int direcao;
  int up;
  int down;
  int left;
  int right;

  PacMan (int px, int py, int pw, int ph) {
    x = px;
    y = py;
    w = pw;
    h = ph;
    direcao = 'p';
    up = y - h/2;
    down = y + h/2;
    left = x - w/2;
    right = x + w/2;
  }

  void desenha () {
    fill(255);
    ellipse(x, y, tamPacMan, tamPacMan);
    rect (left, up, tamPacMan, 2);
    rect (left, down, tamPacMan, 2);
    rect (right, up, 2, tamPacMan);
    rect (left, up, 2, tamPacMan);
  }

  boolean colideCom(Barreira b) {
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
  
  void keyPressed () {
    if (key == CODED) {
      if (keyCode == UP) direcao = 'u';
      if (keyCode == LEFT) direcao = 'l';
      if (keyCode == DOWN) direcao = 'd';
      if (keyCode == RIGHT) direcao = 'r';
    }
  }
}

