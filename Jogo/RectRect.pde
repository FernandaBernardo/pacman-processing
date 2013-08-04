boolean rectRect(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) return true;
  else return false;
}
