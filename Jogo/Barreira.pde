class Barreira extends Sprite {
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
  
  boolean colideCom(Sprite s) {
    return true;
  }
}

