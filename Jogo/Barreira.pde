class Barreira {
  int x;
  int y;
  int w;
  int h;
  Barreira(int px, int py, int pw, int ph) {
    x = px;
    y = py;
    w = pw;
    h = ph;
  } 

  void desenha () {
    fill (255, 0, 0, 255);
    rect(x, y, w, h);
  }
}

