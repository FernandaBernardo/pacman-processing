class PacMan extends Sprite {
  int direcao;
  int speed;
  final int andando = 5;
  final int parado = 0;

  PacMan (int px, int py, int pw, int ph) {
    x = px;
    y = py;
    w = pw;
    h = ph;
    direcao = 'r';

    speed = parado;
  }

  void desenha () {
    fill(255, 255, 0);
    ellipse(x, y, w, h);
    fill(0);
    switch (direcao) {
    case 'u': 
      {
        triangle(x, y, x-SIZE_PACMAN/2, y-SIZE_PACMAN/2, x+SIZE_PACMAN/2, y-SIZE_PACMAN/2);
        break;
      }
    case 'd': 
      {
        triangle(x, y, x-SIZE_PACMAN/2, y+SIZE_PACMAN/2, x+SIZE_PACMAN/2, y+SIZE_PACMAN/2);
        break;
      }
    case 'l': 
      {
        triangle(x, y, x-SIZE_PACMAN/2, y-SIZE_PACMAN/2, x-SIZE_PACMAN/2, y+SIZE_PACMAN/2);
        break;
      }
    case 'r': 
      {
        triangle(x, y, x+SIZE_PACMAN/2, y-SIZE_PACMAN/2, x+SIZE_PACMAN/2, y+SIZE_PACMAN/2);
        break;
      }
    }
  }

  boolean colideCom (Sprite ps) {
    int up = y - h/2;
    int down = y + h/2;
    int left = x - w/2;
    int right = x + w/2;

    boolean colidiu = false;
    if (up <= ps.y + ps.h/2 && down >= ps.y - ps.h/2 && left <= ps.x + ps.w/2 && right >= ps.x - ps.w/2) colidiu = true;

    return colidiu;
  }

  void mudaDirecao () {
    if (key == CODED) {
      switch (keyCode) {
      case UP: 
        {
          direcao = 'u';
          break;
        }
      case DOWN: 
        {
          direcao = 'd';
          break;
        }
      case LEFT: 
        {
          direcao = 'l';
          break;
        }
      case RIGHT: 
        {
          direcao = 'r';
          break;
        }
      default: 
        {
          break;
        }
      }
    }
  }  

  void move (boolean invert) {
    if (!invert) speed = -speed;
    switch (direcao) {
    case 'u': 
      {
        y -= speed;
        break;
      }
    case 'd': 
      {
        y += speed;
        break;
      }
    case 'l': 
      {
        x -= speed;
        break;
      }
    case 'r': 
      {
        x += speed;
        break;
      }
    default: 
      {
        break;
      }
    }
    if (!invert) speed = -speed;
  }
}

