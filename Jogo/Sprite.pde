abstract class Sprite {
  int x;
  int y;
  int w;
  int h;
  
  abstract void desenha();
  
  abstract boolean colideCom(Sprite s);
  
}
