boolean rectRect(Pacman p, Barreira b) {
  if (p.x+tamPacMan/2 >= b.x-b.w/2 && p.x-tamPacMan/2 <= b.x+b.w/2 && p.y+b.h/2 >= b.y-b.h/2 && p.y-tamPacMan/2 <= b.y+b.h/2) return true;
  else return false;
}
